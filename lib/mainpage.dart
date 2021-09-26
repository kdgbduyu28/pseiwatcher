
import 'package:flutter/material.dart';
import 'package:focused_menu/modals.dart';
import 'stockcard.dart';
import 'package:http/http.dart' as http;
import 'stockdata.dart';
import 'stock.dart';
import 'package:provider/provider.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff152D35),
      body: Consumer<StockData>(builder: (context, stockdata, child) {
        return GridView.builder(
          itemCount: Provider.of<StockData>(context, listen: true).favstockCount,
          itemBuilder: (context, index) {
            final stock = stockdata.favStocks[index];
            return FocusedMenuHolder(
              onPressed: () {},
              menuItems: <FocusedMenuItem>[
                FocusedMenuItem(
                    title: Text("Remove from Favorites"),
                    onPressed: () {
                      Provider.of<StockData>(context, listen: false)
                          .removefavStock(index);
                    })
              ],
              child: StockCard(stock.stockname, stock.stocksymbol,
                  stock.stockvalue, stock.stockpercentchange),
            );
          },
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 30,
              mainAxisSpacing: 10),
        );
      }),
    );
  }
}
