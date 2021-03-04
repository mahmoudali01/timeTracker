import 'package:andreApp/app/sign-in/sign-in-button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  Future<void> _signInAnonymously() async {
    final UserCredentials = FirebaseAuth.instance.signInAnonymously();
    print(UserCredentials);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Time Tracker')),
      body: _buildContent(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent() {
    return Padding(
        //color: Colors.yellow,
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Sign In",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 32.0),
            ),
            SizedBox(
              height: 48.0,
            ),
            SignInButtom(
              text: 'sign in with google',
              textColor: Colors.black87,
              color: Colors.white,
              onPressed: () {
                print('button pressed');
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            SignInButtom(
              text: 'sign in with facebook',
              textColor: Colors.white,
              color: Color(0XFF334D92),
              onPressed: () {
                print('button pressed');
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            SignInButtom(
              text: 'sign in with email',
              textColor: Colors.white,
              color: Colors.teal[700],
              onPressed: () {
                print('button pressed');
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              "or",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0, color: Colors.black87),
            ),
            SizedBox(
              height: 8.0,
            ),
            SignInButtom(
              text: 'go anonymous',
              textColor: Colors.white,
              color: Colors.lime[300],
              onPressed: _signInAnonymously,
            ),
          ],
        ));
  }
}
