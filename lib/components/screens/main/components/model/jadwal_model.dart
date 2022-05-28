class jadwalModel {
  final String name;
  final String specialist;
  final String time;
  final String image;

  jadwalModel(this.name, this.specialist, this.time, this.image);
}

List<jadwalModel> jadwal = [
  jadwalModel('Drg Yamato', 'Spesialis Gigi', "09:00 WIB ~ 11:00 WIB",
      "assets/images/doctor-1.jpg"),
  jadwalModel('Dr. Felicia', 'Dokter Umum', "08:00 WIB ~ 12:00 WIB",
      "assets/images/doctor-2.jpg"),
  jadwalModel('Dr. Rahadi', 'Spesialis THT', "09:00 WIB ~ 11:00 WIB",
      "assets/images/doctor-1.jpg"),
];
