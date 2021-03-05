import 'package:andreApp/services/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key, @required this.auth}) : super(key: key);
  final authBase auth;

  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          FlatButton(
              onPressed: _signOut,
              child: Text(
                "Logout",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ))
        ],
      ),
    );
  }
}
