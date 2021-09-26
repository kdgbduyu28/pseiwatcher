import 'package:flutter/cupertino.dart';
import 'package:pseiwatcher/stock.dart';
import 'package:pseiwatcher/stockcard.dart';

var stockslist = [
  'JFC',
  'BDO',
  'ACEN',
  'DITO',
  'PGOLD',
  'APL',
  'MM'
];

class StockData extends ChangeNotifier {

  List<StockCard> stocks = [];
  List<StockCard> favStocks = [];

  int get stockCount {
    return stocks.length;
  }

  int get favstockCount {
    return favStocks.length;
  }

  void addStock(var stocklist) {
    stocks.add(stocklist);
    notifyListeners();
  }

  void removeStock(int index){
    stocks.removeAt(index);
    notifyListeners();
  }

  void addfavStock(var stocklist) {
    favStocks.add(stocklist);
    notifyListeners();
  }

  void removefavStock(int index) {
    favStocks.removeAt(index);
    notifyListeners();
  }




}

