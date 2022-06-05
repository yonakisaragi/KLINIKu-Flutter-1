import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kliniku/components/widgets/reuse.dart';
import 'package:kliniku/const.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                content: Text("Link reset password terkirim! Cek email anda"));
          });
      print(_emailController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e.code);
      showDialog(
          context: context,
          builder: (context) {
            switch (e.code) {
              case "user-not-found":
                return alertBox(context, "Email belum terdaftar");
              case "invalid-email":
                return alertBox(context, "Email tidak sesuai format");
              default:
                return alertBox(context, "Terdapat kesalahan");
            }
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondaryColor,
        appBar: AppBar(
          backgroundColor: secondaryColor,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Masukkan Email dan kita akan mengirim link reset password',
              style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                        borderRadius: BorderRadius.circular(12)),
                    hintText: "Email",
                    fillColor: secondaryColor,
                    filled: true),
              ),
            ),
            SizedBox(height: 10),
            MaterialButton(
              onPressed: passwordReset,
              child: Text('Reset Password',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                      color: Colors.white)),
              color: primaryColor,
            ),
          ],
        ));
  }
}
