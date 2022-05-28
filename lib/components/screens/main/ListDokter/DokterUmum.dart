import 'package:flutter/material.dart';
import 'package:kliniku/const.dart';

class ListDokter extends StatefulWidget {
  const ListDokter({Key? key}) : super(key: key);

  @override
  State<ListDokter> createState() => _ListDokterState();
}

class _ListDokterState extends State<ListDokter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 30,
                right: 30,
              ),
            ),
            Text(
              "Dokter Gigi",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 40,
              ),
            ),
            //list category
            kategori("assets/images/doctor-1.jpg", "Dr. octo", "13.00 sd 18.00",
                "dokter gigi"),
            kategori("assets/images/doctor-2.jpg", "Dr. octo", "13.00 sd 18.00",
                "dokter gigi"),
          ],
        ),
      ),
    );
  }
}

Widget kategori(
  String img,
  String nama,
  String jadwal,
  String bidang,
) {
  return Container(
    padding: const EdgeInsets.all(8.0),
    child: FittedBox(
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        shadowColor: Color.fromARGB(255, 0, 0, 0),
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Text(
                        nama,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            bidang.toUpperCase(),
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 8,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Text(
                        jadwal,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 8,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
