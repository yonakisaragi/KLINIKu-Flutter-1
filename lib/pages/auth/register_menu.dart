import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kliniku/components/widgets/reuse.dart';
import 'package:kliniku/const.dart';

class RegisterMenu extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterMenu({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterMenu> createState() => _RegisterMenuState();
}

class _RegisterMenuState extends State<RegisterMenu> {
  // Form Key
  final _formKey = GlobalKey<FormState>();

  // Controller
  final _nameController = new TextEditingController();
  final _addrController = new TextEditingController();
  final _noHpController = new TextEditingController();
  final _emailController = new TextEditingController();
  final _passController = new TextEditingController();
  final _confPassController = new TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _addrController.dispose();
    _noHpController.dispose();
    _emailController.dispose();
    _passController.dispose();
    _confPassController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passController.text.trim());
    }
  }

  bool passwordConfirmed() {
    if (_passController.text.trim() == _confPassController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Button
    final sButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: primaryColor,
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 10),
        minWidth: 200,
        onPressed: () {
          signUp();
        },
        child: Text(
          "DAFTAR",
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

    // Sudah punya akun?
    final adaAkun = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Sudah punya akun? ", style: TextStyle(fontFamily: 'Roboto')),
        GestureDetector(
          onTap: widget.showLoginPage,
          child: Text(
            "LOGIN",
            style: TextStyle(
              fontFamily: 'Montserrat',
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
                    SizedBox(height: 25),
                    Text("DAFTAR",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Color.fromARGB(255, 6, 59, 8),
                        )),
                    SizedBox(height: 10),
                    Text(
                      "Masukan data diri anda untuk mendaftar pada aplikasi",
                      style: TextStyle(
                          color: Color.fromRGBO(44, 43, 43, 1),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito',
                          fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    rrTextFF(
                        "Nama", _nameController, Icons.person_outline, false),
                    SizedBox(height: 20),
                    rrTextFF(
                        "Alamat", _addrController, Icons.home_outlined, false),
                    SizedBox(height: 20),
                    rrTextFF(
                        "No Hp", _noHpController, Icons.phone_outlined, false),
                    SizedBox(height: 20),
                    rrTextFF(
                        "Email", _emailController, Icons.email_outlined, false),
                    SizedBox(height: 20),
                    rrTextFF(
                        "Password", _passController, Icons.lock_outline, true),
                    SizedBox(height: 20),
                    rrTextFF("Ulangi Password", _confPassController,
                        Icons.lock_outline, true),
                    SizedBox(height: 20),
                    sButton,
                    SizedBox(height: 20),
                    adaAkun
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
