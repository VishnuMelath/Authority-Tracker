class PermitsModel {
  final String id;
  final String name;
  final DateTime startDate;
  final DateTime expiryDate;
  final String type;
  final String url;

  PermitsModel({
    required this.id,
    required this.name,
    required this.startDate,
    required this.expiryDate,
    required this.type,
    required this.url,
  });
}
