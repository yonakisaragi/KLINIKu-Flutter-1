import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kliniku/components/screens/main/HomePasien.dart';
import 'package:kliniku/components/screens/welcome/login_menu.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MenuPasien();
        } else {
          return LoginMenu();
        }
      },
    ));
  }
}
