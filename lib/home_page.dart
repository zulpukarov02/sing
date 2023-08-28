import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sing/auth.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().singOut();
  }

  Widget title() {
    return const Text('Firebase auth');
  }

  Widget userUid() {
    return Text(user?.email ?? 'User email');
  }

  Widget singOutBottom() {
    return ElevatedButton(onPressed: signOut, child: const Text('Sing Out'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [userUid(), singOutBottom()],
        ),
      ),
    );
  }
}
