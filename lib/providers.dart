import 'package:barbora_app/models/stock.dart';
import 'package:barbora_app/object_list_mappers.dart';
import 'package:barbora_app/service_locator.dart';
import 'package:barbora_app/services/localstorage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'constants.dart';
import 'services/web_api/web_api.dart';

final stockDataProvider =
    ChangeNotifierProvider<StockDataProvider>((ref) => new StockDataProvider());

final cachedStockDataProvider = ChangeNotifierProvider<CachedStockDataProvider>(
    (ref) => new CachedStockDataProvider());


// used for lazy loading stock list 
class StockDataProvider extends ChangeNotifier {
  WebApi _clientService = serviceLocator<WebApi>();
  LocalStorageService _localStorageService =
      serviceLocator<LocalStorageService>();

  late List<Stock> _stockList = [];
  bool _loading = false;
  int _offset = 0;

  get loading => _loading;
  get stockList => _stockList;

  Future<void> fetchData() async {
    _loading = true;
    
    await loadData();

    _loading = false;
    notifyListeners();
  }

  Future<void> loadInitData() async {
    await loadData();
  }

  Future<void> loadData() async {
    var stockData = await _clientService.getStockList(_offset);

    if (stockData.containsKey('products')) {
      List<Stock> stockList = mapStockData(stockData['products']);
      _localStorageService.addToList(Constants.StockStorageKey, stockList);

      _stockList.addAll(stockList);
      // padidiname offseta tik tuomet jeigu yra duomenys
      _offset += Constants.stockPaginationLimit;
    }
  }
}
// used for loading cached stock items
class CachedStockDataProvider extends ChangeNotifier {
  LocalStorageService _localStorageService =
      serviceLocator<LocalStorageService>();

  late List<Stock> _stockList = [];
  bool _loading = false;
  int _offset = Constants.stockPaginationLimit;

  get loading => _loading;
  get stockList => _stockList;

  Future<void> fetchData() async {
    _loading = true;

    await loadData();

    _loading = false;
    notifyListeners();
  }

  Future<void> loadInitData() async {
    await loadData();
  }

  Future<void> loadData() async {
    var localStockList =
        _localStorageService.getData(Constants.StockStorageKey, _offset);
    print(_offset);
    if (localStockList.isNotEmpty) {
      _stockList = localStockList;
      _offset += Constants.stockPaginationLimit;
    }
  }
}
