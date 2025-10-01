import 'package:cloud_firestore/cloud_firestore.dart';

class PermitsModel {
  final String id;
  final String name;
  final DateTime startDate;
  final DateTime expiryDate;
  final String projectId;
  final String url;

  PermitsModel({
    required this.id,
    required this.name,
    required this.startDate,
    required this.expiryDate,
    required this.projectId,
    required this.url,
  });

  /// Convert Firestore doc → PermitsModel
  factory PermitsModel.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return PermitsModel(
      id: doc.id,
      name: data['name'] ?? '',
      startDate: (data['startDate'] as Timestamp).toDate(),
      expiryDate: (data['expiry'] as Timestamp).toDate(),
      projectId: data['projectId'] ?? '',
      url: data['pdfLink'] ?? '',
    );
  }

  /// Convert model → Firestore map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'startDate': Timestamp.fromDate(startDate),
      'expiry': Timestamp.fromDate(expiryDate),
      'projectId': projectId,
      'pdfLink': url,
    };
  }
}
