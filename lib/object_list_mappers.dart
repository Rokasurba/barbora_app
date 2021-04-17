import 'package:barbora_app/models/stock.dart';

List<Stock> mapStockData(stockData) {
  if (stockData.isEmpty) return [];
  var stockList =
      (stockData as List).map((e) => new Stock.fromJson(e)).toList();
  return stockList;
}

List<Stock> mapStockLocalStorageData(stockData) {
  if (stockData.isEmpty) return [];
  var stockList =
      (stockData as List).map((e) => new Stock.fromLocalStorage(e)).toList();
  return stockList;
}
