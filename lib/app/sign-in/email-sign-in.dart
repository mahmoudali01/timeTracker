import 'package:andreApp/services/auth.dart';
import 'package:flutter/material.dart';
import 'email-signin-form.dart';

class EmailSignIn extends StatelessWidget {
  final authBase auth;

  const EmailSignIn({Key key, @required this.auth}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Sign In')),
      body: Padding(
          padding: EdgeInsets.all(12.0),
          child: Card(
            child: EmailSignInForm(
              auth: auth,
            ),
          )),
      backgroundColor: Colors.grey[200],
    );
  }
}
