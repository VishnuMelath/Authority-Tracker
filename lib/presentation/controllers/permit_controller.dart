import 'package:authority_tracker/domain/models/permits_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PermitController extends ChangeNotifier {
  bool? isloading;
  List<PermitsModel> permits = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createPermit(PermitsModel permit) async {
    try {
      isloading = true;
      notifyListeners();
      await _firestore.collection('permits').add(permit.toMap());
      isloading = false;
    } catch (e) {
      isloading = null;
      throw Exception('Failed to create permit: $e');
    } finally {
      notifyListeners();
    }
  }

  Future<void> updatePermit(PermitsModel permit) async {
    try {
      isloading = true;
      notifyListeners();
      await _firestore
          .collection('permits')
          .doc(permit.id)
          .update(permit.toMap());
      isloading = false;
    } catch (e) {
      isloading = null;
      throw Exception('Failed to update permit: $e');
    } finally {
      notifyListeners();
    }
  }

  Future<void> deletePermit(String permitId) async {
    try {
      isloading = true;
      notifyListeners();
      await _firestore.collection('permits').doc(permitId).delete();
      isloading = false;
    } catch (e) {
      isloading = null;
      throw Exception('Failed to delete permit: $e');
    } finally {
      notifyListeners();
    }
  }

  Future<void> getPermitsByProject(String projectId) async {
    try {
      isloading = true;
      notifyListeners();
      final query = await _firestore
          .collection('permits')
          .where('projectId', isEqualTo: projectId)
          .get();

      permits.addAll(
        query.docs.map((doc) => PermitsModel.fromDoc(doc)).toList(),
      );
      isloading = false;
    } catch (e) {
      isloading = null;
      throw Exception('Failed to fetch permits: $e');
    } finally {
      notifyListeners();
    }
  }
}
