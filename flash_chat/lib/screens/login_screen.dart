import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/pill_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "/login";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = "";
  String _password = "";
  bool _showSpinner = false;
  final _firebaseAuthInstance = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _showSpinner,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'flash-logo',
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                onChanged: (value) {
                  _email = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter email'),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                onChanged: (value) {
                  _password = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter password'),
                obscureText: true,
              ),
              const SizedBox(
                height: 24.0,
              ),
              PillButton(
                text: 'Log In',
                color: Colors.lightBlueAccent,
                onPressed: () async {
                   setState(() {
                     _showSpinner = true;
                   });
                   try {
                    final userCredential = await _firebaseAuthInstance
                        .signInWithEmailAndPassword(email: _email, password: _password);
                    if(userCredential.user != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState(() {
                      _showSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
