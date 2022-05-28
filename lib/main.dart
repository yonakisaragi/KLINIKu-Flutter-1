import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kliniku/components/screens/main/HomePasien.dart';
import 'package:kliniku/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isViewed;
void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KLINIKu',
      theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(primary: primaryColor)),
      // home: isViewed != 0 ? OnBoard() : WelcomeScreen(),
      home: MenuPasien(),
    );
  }
}
