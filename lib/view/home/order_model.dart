class BirthdayOrder {
  final String id;
  final String packageName;
  final String price;
  final DateTime date;
  final String status;
  final String userId;

  BirthdayOrder({
    required this.id,
    required this.packageName,
    required this.price,
    required this.date,
    required this.status,
    required this.userId,
  });
}
