class CouponModel {
  final String id;
  final String title;
  final String description;
  final String qrData;
  final String? link; // можно хранить ссылку на купон

  CouponModel({
    required this.id,
    required this.title,
    required this.description,
    required this.qrData,
    this.link,
  });
}
