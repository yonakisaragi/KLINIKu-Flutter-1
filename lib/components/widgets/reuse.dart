import 'package:flutter/material.dart';
import 'package:kliniku/const.dart';

Image imagePath(String path) {
  Image lokasi = Image.asset('assets/images/${path}');
  return lokasi;
}

Image iconPath(String path) {
  Image lokasi = Image.asset('assets/icons/${path}');
  return lokasi;
}

Container rButtonWelcome(BuildContext context, bool isLogin, Function onTap) {
  return Container(
    height: 45,
    width: MediaQuery.of(context).size.width,
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        isLogin ? 'LOG IN' : 'DAFTAR',
        style: TextStyle(
            fontFamily: 'Nunito',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return darkerColor;
            }
            return primaryColor;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)))),
    ),
  );
}

TextFormField rTextFF(
    TextEditingController ctrle, IconData icon, bool isPassword) {
  return TextFormField(
    autofocus: false,
    controller: ctrle,
    obscureText: isPassword,
    keyboardType: isPassword ? null : TextInputType.emailAddress,
    // validator: (){},
    onSaved: (value) {
      ctrle.text = value!;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      prefixIcon: Icon(icon),
      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      hintText: isPassword ? "Password" : "Email",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

TextFormField rrTextFF(
    String text, TextEditingController ctrle, IconData icon, bool isPass) {
  return TextFormField(
    autofocus: false,
    controller: ctrle,
    obscureText: isPass,
    // validator: (){},
    onSaved: (value) {
      ctrle.text = value!;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      prefixIcon: Icon(icon),
      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      hintText: text,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
