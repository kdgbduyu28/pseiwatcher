import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pseiwatcher/google_sign_in.dart';
import 'loginscreen.dart';

class UserDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xff345B63),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Text(
                "Hello",
                style: TextStyle(
                  fontSize: 40,
                  color: Color(0xffD4ECDD),
                ),
              ),
              flex: 5,
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  Provider.of<GoogleSignInProvider>(context, listen: false).signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }));
                },
                child: Text(
                  "Sign Out",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xffD4ECDD),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
