import 'package:flutter/material.dart';
import 'package:kliniku/components/screens/main/DetailDokter.dart';
import 'package:kliniku/components/screens/main/ListDokter/DokterUmum.dart';
import 'package:kliniku/components/screens/main/components/model/categories_model.dart';
import 'package:kliniku/components/screens/main/components/model/jadwal_model.dart';
import 'package:kliniku/const.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 10, top: 10, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jadwal Dokter Hari Ini",
                    style: TextStyle(fontSize: 18, fontFamily: 'Montserrat'),
                  ),
                  SizedBox(height: 15),
                  jadwalDokter(),
                  SizedBox(height: 15),
                  kategoriKlinik()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Padding kategoriKlinik() {
  return Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
      height: 200,
      child: Column(
        children: [
          Row(children: [
            Expanded(
                child: Text(
              "Kategori",
              style: TextStyle(fontSize: 18, fontFamily: 'Montserrat'),
            )),
          ]),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: ((BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                        width: 60,
                        height: 50,
                        child: InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListDokter()),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                categories[index].image,
                                color: Colors.black,
                              ),
                              Flexible(
                                child: Text(
                                  categories[index].name,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        )),
                  );
                })),
          )
        ],
      ),
    ),
  );
}

Container jadwalDokter() {
  return Container(
      height: 180,
      child: Expanded(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: jadwal.length,
            itemBuilder: ((BuildContext context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 16, bottom: 10),
                child: Container(
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: primaryColor,
                  ),
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailDokter()),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 20,
                          top: 35,
                          child: Image.asset(
                            jadwal[index].image,
                            width: 80,
                            height: 100,
                          ),
                        ),
                        Positioned(
                          left: 120,
                          top: 35,
                          child: Text(
                            jadwal[index].name,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 120,
                          top: 75,
                          child: Text(
                            jadwal[index].specialist,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 120,
                          top: 109,
                          child: Icon(
                            Icons.access_time_outlined,
                            color: Colors.white,
                          ),
                        ),
                        Positioned(
                          left: 150,
                          top: 111,
                          child: Text(
                            jadwal[index].time,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })),
      ));
}
