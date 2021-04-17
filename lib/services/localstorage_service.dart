import 'dart:convert';

import 'package:barbora_app/models/stock.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../object_list_mappers.dart';

class LocalStorageService {
  static late LocalStorageService _instance;
  static late SharedPreferences _preferences;

  static Future<LocalStorageService> getInstance() async {
    _instance = LocalStorageService();
    _preferences = await SharedPreferences.getInstance();

    return _instance;
  }

  // Saving and Getting methods ----------------------
  dynamic _getFromDisk(String key) {
    var value = _preferences.get(key);
    //  print('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }

  // updated _saveToDisk function that handles all types
  void _saveToDisk<T>(String key, T content) {
    print(
        '(TRACE) LocalStorageService:_saveStringToDisk. key: $key value: $content');
    if (content is String) {
      _preferences.setString(key, content);
    }
    if (content is bool) {
      _preferences.setBool(key, content);
    }
    if (content is int) {
      _preferences.setInt(key, content);
    }
    if (content is double) {
      _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences.setStringList(key, content);
    }
  }

  // for the sake of simplicity where are not making this function dynamic
  // we can only pass and save stock lists
  void _addToList(key, List<Stock> data) {
    var currentData = _getFromDisk(key);

    if (currentData == null) {
      _saveToDisk(key, json.encode(data));
    } else {
      List<dynamic> storageData = json.decode(currentData);

      storageData.addAll(data);
      // convertuojame i set, kad ismesti dublikatus
      storageData.toSet().toList();
      _saveToDisk(key, json.encode(storageData));
      storageData = [];
    }
  }

  void _remove(key) {
    _preferences.remove(key);
  }

  // -------------------------------------------------

  List<Stock> getData(key, offset) {
    var data = _getFromDisk(key);

    if (data != null) {
      var stockList = mapStockLocalStorageData(json.decode(data));
      if (offset > stockList.length) return [];
      return stockList.getRange(0, offset).toList();
    }
    return [];
  }

  void saveData(dataKey, content) {
    _saveToDisk(dataKey, content);
  }

  void addToList<T>(key, List<Stock> stockList) {
    _addToList(key, stockList);
  }

  void remove(key) {
    _remove(key);
  }
}
