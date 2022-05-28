import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:kliniku/components/screens/main/components/home_menu.dart';
import 'package:kliniku/components/screens/main/components/profile_page.dart';
import 'package:kliniku/const.dart';
import 'components/location_menu.dart';
import 'components/status_menu.dart';

class MenuPasien extends StatefulWidget {
  const MenuPasien({Key? key}) : super(key: key);

  @override
  State<MenuPasien> createState() => _MenuPasienState();
}

class _MenuPasienState extends State<MenuPasien> {
  int index = 0;
  final screens = [HomePage(), StatusPage(), LocationPage()];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home, size: 30, color: Colors.white),
      Icon(Icons.library_books, size: 30, color: Colors.white),
      Icon(Icons.location_on_sharp, size: 30, color: Colors.white),
    ];

    return Scaffold(
        appBar: _buildAppBar(),
        extendBody: true,
        backgroundColor: secondaryColor,
        bottomNavigationBar: _buildCurvedNavbar(items),
        body: screens[index]);
  }

  AppBar _buildAppBar() {
    return AppBar(
      // titleSpacing: 0,
      automaticallyImplyLeading: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              icon: Icon(
                Icons.account_circle_outlined,
                color: Colors.black,
              )),
          Text(
            "Hello pasien!",
            style: TextStyle(color: Colors.black, fontFamily: 'Montserrat'),
          )
        ],
      ),
    );
  }

  CurvedNavigationBar _buildCurvedNavbar(List<Widget> items) {
    return CurvedNavigationBar(
      color: primaryColor,
      backgroundColor: Colors.transparent,
      items: items,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 300),
      height: 55,
      index: index,
      onTap: (index) => setState(() {
        this.index = index;
      }),
    );
  }
}
