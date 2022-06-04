import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kliniku/components/screens/welcome/register_menu.dart';
import 'package:kliniku/components/widgets/reuse.dart';
import 'package:kliniku/const.dart';

class LoginMenu extends StatefulWidget {
  const LoginMenu({Key? key}) : super(key: key);

  @override
  State<LoginMenu> createState() => _LoginMenuState();
}

class _LoginMenuState extends State<LoginMenu> {
  // Form Key
  final _formKey = GlobalKey<FormState>();

  // Controller
  final _emailController = new TextEditingController();
  final _passController = new TextEditingController();

  // Sign In agilfachrian2@gmai.com | password123
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passController.text.trim());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Login Button
    final lButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: primaryColor,
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 10),
        minWidth: 200,
        // minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signIn();
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => MenuPasien()));
        },
        child: Text(
          "MASUK",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    // Sudah terdaftar?
    final belumdaftar = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Belum punya akun? ", style: TextStyle(fontFamily: 'Roboto')),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegisterMenu()));
          },
          child: Text(
            "DAFTAR",
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              color: daftarColor,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: secondaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(36),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        "LOG IN",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Color.fromARGB(255, 6, 59, 8),
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 200,
                        child: Image.asset(
                          "assets/icons/kliniku-logo.png",
                          width: 200,
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        "Selamat datang kembali di\n aplikasi KLINIKu",
                        style: TextStyle(
                            color: Color.fromRGBO(44, 43, 43, 1),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nunito',
                            fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      rTextFF(_emailController, Icons.email_outlined, false),
                      SizedBox(height: 20),
                      rTextFF(_passController, Icons.lock_outline, true),
                      SizedBox(height: 30),
                      lButton,
                      SizedBox(height: 20),
                      belumdaftar
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
