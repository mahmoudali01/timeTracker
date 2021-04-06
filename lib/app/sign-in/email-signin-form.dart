import 'package:andreApp/common-widgets/form-submit-button.dart';
import 'package:andreApp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum EmailSignInType { signIn, register }

class EmailSignInForm extends StatefulWidget {
  const EmailSignInForm({Key key, @required this.auth}) : super(key: key);

  final authBase auth;

  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  EmailSignInType _formType = EmailSignInType.signIn;
  String get _email => _emailController.text;
  String get _password => _passwordController.text;

  void _submit() async {
    try {
      if (_formType == EmailSignInType.signIn) {
        await widget.auth.signInWithEmaillAndPassword(_email, _password);
      } else {
        await widget.auth.createUserWithEmaillAndPassword(_email, _password);
      }
      Navigator.of(context).pop();
    } catch (e) {
      print(e.toString());
    }
  }

  void _toggleFormType() {
    setState(() {
      _formType = _formType == EmailSignInType.signIn
          ? EmailSignInType.register
          : EmailSignInType.signIn;
    });
    _emailController.clear();
    _passwordController.clear();
  }

  List<Widget> _buidChildren() {
    final primaryText =
        _formType == EmailSignInType.signIn ? 'sign in' : 'create an account';
    final secondaryText = _formType == EmailSignInType.register
        ? 'have an account? sign in'
        : 'need an account? register';
    return [
      TextField(
        controller: _emailController,
        decoration:
            InputDecoration(labelText: 'email', hintText: 'test@test.com'),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
      ),
      SizedBox(
        height: 8.0,
      ),
      TextField(
        controller: _passwordController,
        decoration: InputDecoration(
          labelText: 'password',
        ),
        obscureText: true,
        textInputAction: TextInputAction.done,
      ),
      SizedBox(
        height: 8.0,
      ),
      FormSubmitButton(text: primaryText, onPressed: _submit),
      SizedBox(
        height: 8.0,
      ),
      FlatButton(child: Text(secondaryText), onPressed: _toggleFormType)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(19.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: _buidChildren(),
        ));
  }
}
