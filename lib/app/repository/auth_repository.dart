import 'package:banking_mobile_app/app/model/user_model.dart';
import 'package:banking_mobile_app/app/repository/user_repository.dart';
import 'package:banking_mobile_app/services/auth_base.dart';
import 'package:banking_mobile_app/services/firebase/firebase_auth_service.dart';

final class AuthRepository implements AuthBase {
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  final UserRepository _userRepository = UserRepository();

  @override
  Future<UserModel> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final user = await _firebaseAuthService.createUserWithEmailAndPassword(
        email,
        password,
      );
      await _userRepository.saveUser(user);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> currentUser() async {
    try {
      final user = await _firebaseAuthService.currentUser();
      return user;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() {
    try {
      return _firebaseAuthService.signOut();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> signWithEmailAndPassword(String email, String password) {
    try {
      return _firebaseAuthService.signWithEmailAndPassword(
        email,
        password,
      );
    } catch (e) {
      rethrow;
    }
  }
}
