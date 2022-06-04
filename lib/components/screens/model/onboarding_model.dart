class OnboardingModel {
  final String image;
  final String title;
  final String subtitle;

  OnboardingModel(this.image, this.title, this.subtitle);
}

List<OnboardingModel> page = [
  OnboardingModel(
      'assets/icons/pose_6.png',
      'BUAT JANJI DENGAN SMARTPHONE ANDA',
      'Cukup dengan smartphone anda dapat membuat janji dengan dokter'),
  OnboardingModel('assets/icons/pose_4.png', 'TUNGGU DAN PERIKSA',
      'Anda hanya perlu menunggu janji anda diterima dan langsung pergi ke Klinik'),
  OnboardingModel(
      'assets/icons/pose_1.png', 'TUNGGU APALAGI?', 'Mulai sekarang!'),
];
