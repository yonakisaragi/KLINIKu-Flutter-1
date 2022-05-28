import 'package:flutter/material.dart';
import 'package:kliniku/components/screens/welcome/login_menu.dart';
import 'package:kliniku/components/screens/welcome/register_menu.dart';
import 'package:kliniku/components/widgets/reuse.dart';
import 'package:kliniku/const.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 125),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                iconPath('kliniku.png'),
                SizedBox(height: 60),
                rButtonWelcome(context, true, () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginMenu()));
                }),
                SizedBox(height: 20),
                rButtonWelcome(context, false, () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterMenu()));
                })
              ],
            ),
          ))
        ],
      ),
    );
  }
}
