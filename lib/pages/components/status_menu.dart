import 'package:flutter/material.dart';
import 'package:kliniku/const.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondaryColor,
        body: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Status Jadwal Anda",
                  style: TextStyle(fontFamily: 'Montserrat', fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: textColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Dr. Yamato".toUpperCase(),
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/doctor-1.jpg"),
                        radius: 48,
                      ),
                    ),
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 5),
                        child: Text(
                          "Dokter Gigi",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Roboto',
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Icon(
                              Icons.calendar_month,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Senin, April 21",
                            style: TextStyle(
                                fontFamily: 'Roboto', color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Icon(
                                Icons.access_time_outlined,
                                color: Colors.white,
                              )),
                          Text(
                            "10:00 WIB ~ 11:00 WIB",
                            style: TextStyle(
                                fontFamily: 'Roboto', color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      Container(
                        height: 18,
                        width: 100,
                        color: Colors.yellow,
                        child: Text(
                          "proses".toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        height: 30,
                        margin: EdgeInsets.only(top: 10),
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("CANCEL",
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith((states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.redAccent[400];
                                }
                                return Colors.redAccent[400];
                              }),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)))),
                        ),
                      )
                    ])
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
