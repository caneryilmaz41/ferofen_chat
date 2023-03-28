import 'dart:developer';

import 'package:ferofen_chat/pages/home_page.dart';
import 'package:ferofen_chat/pages/sign_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  var user;

  @override
  void initState() {
    super.initState();
    _checkUser();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _checkUser(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasData && snapshot.data != null) {
            user = snapshot.data;
            return HomePage(
              user: user!,
              onSignOut: () {
                updateUser(null);
              },
            );
          } else {
            return SignInPage(
              onSigin: ((user) {
                setState(() {});
                updateUser(user);
              }),
            );
          }
        }
      },
    );
  }

  Future<User?> _checkUser() async {
    return FirebaseAuth.instance.currentUser;
  }

  void updateUser(User? user) {
    setState(() {
      user = user;
    });
  }
}
