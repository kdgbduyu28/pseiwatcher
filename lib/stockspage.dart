import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:focused_menu/modals.dart';
import 'stockcard.dart';
import 'package:http/http.dart' as http;
import 'stockdata.dart';
import 'package:provider/provider.dart';
import 'package:focused_menu/focused_menu.dart';

class Stocks extends StatefulWidget {
  @override
  _StocksState createState() => _StocksState();
}

class _StocksState extends State<Stocks> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StockData>(builder: (context, stockdata, child) {
      return GridView.builder(
        itemCount: Provider.of<StockData>(context, listen: true).stockCount,
        itemBuilder: (context, index) {
          final stock = stockdata.stocks[index];
          return FocusedMenuHolder(
            onPressed: () {},
            menuItems: <FocusedMenuItem>[
              FocusedMenuItem(
                  title: Text("Add to Favorites"),
                  onPressed: () {
                    Provider.of<StockData>(context, listen: false)
                        .addfavStock(stock);
                  })
            ],
            child: StockCard(stock.stockname, stock.stocksymbol,
                stock.stockvalue, stock.stockpercentchange),
          );
        },
        padding: EdgeInsets.symmetric(horizontal: 20),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 3/2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      );
    });
  }
}
