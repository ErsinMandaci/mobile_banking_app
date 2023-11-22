import 'package:banking_mobile_app/app/model/user_model.dart';
import 'package:banking_mobile_app/services/firestore/account_service.dart';
import 'package:banking_mobile_app/services/firestore/user_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final class UserRepository {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection(
    'users',
  );

  final UserService _firestoreUserService = UserService();
  final AccountService _accountService = AccountService();

  Future<void> saveUser(UserModel user) async {
    try {
      final documentSnapshot = await _userCollection.doc(user.userId).get();

      if (!documentSnapshot.exists) {
        await _firestoreUserService.saveUser(user);
      } else {
        return;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> transferMoney(String accountNumber, double amount) async {
    try {
      await _accountService.transferMoney(accountNumber, amount);
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
