import 'package:flutter/material.dart';

import 'package:focused_menu/modals.dart';
import 'package:provider/provider.dart';
import 'package:pseiwatcher/stockdata.dart';

class StockCard extends StatelessWidget {
  StockCard(this.stockname, this.stocksymbol, this.stockvalue, this.stockpercentchange);
  final String stockname;
  final String stocksymbol;
  final double stockvalue;
  final double stockpercentchange;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 15),
      color: Color(0xff345B63),
      child: Column(
        children: [
          Text(
            stocksymbol,
            style: TextStyle(
              fontSize: 55,
              color: Color(0xffD4ECDD)
            ),
          ),
          Text(
            stockname,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15,
                color: Color(0xffD4ECDD)
            ),
          ),
          Text(
            "$stockvalue PHP",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 25,
                color: Color(0xffD4ECDD)
            ),
          )
        ],
      ),
    );
  }
}
