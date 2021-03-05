import 'package:andreApp/app/sign-in/sign-in-page.dart';
import 'package:andreApp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home_page.dart';

class LandingPage extends StatefulWidget {
  final authBase auth;

  const LandingPage({Key key, @required this.auth}) : super(key: key);
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User _user;
  @override
  void initState() {
    _updateuser(widget.auth.currentUser);
    super.initState();
  }

  void _updateuser(User user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignInPage(
        onSignedIn: _updateuser,
        auth: widget.auth,
      );
    }

    return HomePage(
      onSignedOut: () => _updateuser(null),
      auth: widget.auth,
    );
  }
}
