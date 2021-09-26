import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pseiwatcher/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:pseiwatcher/navigate.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffD4ECDD),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("PSEI Watcher"),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
            ),
            icon: Icon(FontAwesomeIcons.google, color: Colors.red,),
            onPressed: () async {
              final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogin();
              await Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Navigate();
              }));
            },
            label: Text("Sign in with Google"),
          )
        ],
      ),
    );
  }
}
