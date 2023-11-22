import 'package:banking_mobile_app/app/model/user_model.dart';

abstract class AuthBase {
  Future<UserModel> currentUser();
  Future<void> signOut();
  Future<UserModel> signWithEmailAndPassword(String email, String password);
  Future<UserModel> createUserWithEmailAndPassword(
    String email,
    String password,
  );
}
