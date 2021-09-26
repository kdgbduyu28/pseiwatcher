import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pseiwatcher/loginscreen.dart';
import 'package:pseiwatcher/stockcard.dart';
import 'package:pseiwatcher/stockdata.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void obtainData() async {
    stockslist.forEach((stock) async {
      var url = Uri.parse('https://phisix-api4.appspot.com/stocks/$stock.json');
      http.Response response = await http.get(url);
      try {
        if (response.statusCode == 200) {
          String data = response.body;
          var decodedData = jsonDecode(data);
          final stocklist = StockCard(
              decodedData['stock'][0]['name'].toString(),
              decodedData['stock'][0]['symbol'].toString(),
              decodedData['stock'][0]['price']['amount'],
              decodedData['stock'][0]['percent_change']);
          setState(() {
            Provider.of<StockData>(context, listen: false).addStock(stocklist);
          });
        } else {
          print('failed');
        }
      } catch (e) {
        print(e);
      }
    });

    Future.delayed(Duration.zero, () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LoginScreen();
      }));
    });
  }

  @override
  void initState() {
    super.initState();
    obtainData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 150,
        ),
      ),
    );
  }
}
