import 'package:flutter/material.dart';
import 'package:pseiwatcher/google_sign_in.dart';
import 'package:pseiwatcher/loadingscreen.dart';
import 'package:pseiwatcher/stockdata.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => StockData(),
//       child: MaterialApp(
//         home: LoadingScreen(),
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StockData()),
        ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
      ],
      child: MaterialApp(
        home: LoadingScreen(),
      ),

    );
  }
}


