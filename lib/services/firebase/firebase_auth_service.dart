import 'package:banking_mobile_app/app/model/user_model.dart';
import 'package:banking_mobile_app/services/auth_base.dart';
import 'package:firebase_auth/firebase_auth.dart';

final class FirebaseAuthService implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  
  UserModel _userFromFirebase(User? user) {
    final userAccount = UserModel(
      userId: user?.uid,
      username: user?.displayName,
      email: user?.email,
    );

    return userAccount;
  }

  @override
  Future<UserModel> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _userFromFirebase(userCredential.user);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> signWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _userFromFirebase(userCredential.user);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> currentUser() async {
    try {
      final user = _firebaseAuth.currentUser;
      return _userFromFirebase(user);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
