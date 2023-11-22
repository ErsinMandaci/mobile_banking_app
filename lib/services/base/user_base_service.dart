import 'package:banking_mobile_app/app/model/user_model.dart';

abstract class IUserBaseService {
  Future<void> saveUser(UserModel userModel);
  Future<UserModel> readUser(String uid);
}
