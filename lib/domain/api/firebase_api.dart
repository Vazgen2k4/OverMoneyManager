import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:over_money_manager/domain/models/over_user/over_user.dart';
import 'package:over_money_manager/app_const.dart';

class FirebaseApi {
  static final usersCollection = FirebaseFirestore.instance.collection('users');
  static final authModel = FirebaseAuth.instance;

  static Future<List<OverUser>> getUsers() async {
    final _usersSnapshot = await usersCollection.get();

    final _usersData = _usersSnapshot.docs.map<OverUser>(
      (user) => OverUser.fromJson(user.data()),
    );

    return _usersData.toList();
  }

  static Future<bool> haveAccountWithPhone(
    String phone,
  ) async {
    final _usersData = await getUsers();
    if (_usersData.isEmpty) return false;

    _findUserWithPhone(OverUser user) => user.phone?.trim() == phone.trim();
    final _usersWithOnePhone = _usersData.where(_findUserWithPhone);

    return _usersWithOnePhone.isNotEmpty;
  }

  static Future<void> setUser({
    required OverUser user,
  }) async {
    try {
      final uid = authModel.currentUser?.uid;
      await usersCollection.doc(uid).set(user.toJson());
    } catch (e) {
      AppConstants.borderPrint(e);
    }
  }

  static Future<OverUser?> getUser() async {
    try {
      final uid = authModel.currentUser?.uid;

      if (uid == null) return null;

      final userData = (await usersCollection.doc(uid).get()).data();

      return OverUser.fromJson(userData);
    } catch (e) {
      AppConstants.borderPrint(e);
      return null;
    }
  }
}
