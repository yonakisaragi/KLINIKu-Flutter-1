import 'package:flutter/material.dart';
import 'package:kliniku/pages/auth/login_menu.dart';
import 'package:kliniku/pages/auth/register_menu.dart';

class Authpage extends StatefulWidget {
  const Authpage({Key? key}) : super(key: key);

  @override
  State<Authpage> createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> {
  // Init Show Login Page
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginMenu(showRegisterPage: toggleScreens);
    } else {
      return RegisterMenu(showLoginPage: toggleScreens);
    }
  }
}
