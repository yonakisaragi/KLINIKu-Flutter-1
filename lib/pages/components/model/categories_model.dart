class categoriesModel {
  final String name;
  final String image;

  categoriesModel(this.name, this.image);
}

List<categoriesModel> categories = [
  categoriesModel('Umum', 'assets/icons/general.png'),
  categoriesModel('Mata', 'assets/icons/eye.png'),
  categoriesModel('Gigi', 'assets/icons/tooth.png'),
  categoriesModel('THT', 'assets/icons/tht.png'),
  categoriesModel('Lansia', 'assets/icons/lansia.png'),
  categoriesModel('Ibu Hamil', 'assets/icons/pregnant.png'),
];
