import 'package:banking_mobile_app/app/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DBBase {
  Future<void> saveUser(UserModel userModel);
  Future<UserModel> readUser(String uid);
  Future<DocumentReference> addAccount(UserModel userModel);
  Future<void> transferMoney(String accountNumber, double amount);
}
