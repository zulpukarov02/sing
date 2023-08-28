import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sing/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMasseng = '';
  bool islogin = true;

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<void> singInWithEmailAndPaaword() async {
    try {
      await Auth()
          .singInEmailAndPassword(email: email.text, password: password.text);
    } on FirebaseException catch (e) {
      setState(() {
        errorMasseng = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: email.text, password: password.text);
    } on FirebaseException catch (e) {
      setState(() {
        errorMasseng = e.message;
      });
    }
  }

  Widget title() {
    return const Text('Firebase Auth');
  }

  Widget entryField(String title, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(hintText: title),
    );
  }

  Widget errorMessage() {
    return Text(errorMasseng == '' ? "" : 'Humm ? $errorMasseng');
  }

  Widget submitButton() {
    return ElevatedButton(
        onPressed: islogin
            ? singInWithEmailAndPaaword
            : createUserWithEmailAndPassword,
        child: Text(islogin ? 'Login' : 'Register'));
  }

  Widget loginOrRegisterButton() {
    return TextButton(
        onPressed: () {
          setState(() {
            islogin = !islogin;
          });
        },
        child: Text(islogin ? 'Register instat' : 'Login insteat'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: title()),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            entryField('email', email),
            entryField('password', password),
            errorMessage(),
            submitButton(),
            loginOrRegisterButton()
          ],
        ),
      ),
    );
  }
}
