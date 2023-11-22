import 'package:banking_mobile_app/app/model/account_model.dart';
import 'package:banking_mobile_app/app/model/user_model.dart';
import 'package:banking_mobile_app/services/base/user_base_service.dart';
import 'package:banking_mobile_app/services/firestore/account_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final class UserService implements IUserBaseService {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection(
    'users',
  );

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<void> saveUser(UserModel userModel) async {
    if (userModel.userId != null) {
      final getAccount = await AccountService().addAccount(userModel);
      await _userCollection.doc(userModel.userId).set({
        'userID': userModel.userId,
        'username': userModel.username,
        'email': userModel.email,
        'accountID': getAccount,
      });
    }
  }

  // Future<Account> getActiveUserAccount() async {
  //   final userSnapshot =
  //       await _userCollection.doc(_auth.currentUser?.uid).get();
  //   print(userSnapshot.data());

  //   if (userSnapshot.exists) {
  //     final getAccountResponse = await AccountService().getAccount();
  //     return getAccountResponse;
  //   } else {
  //     throw Exception('Hesap bulunamadı.');
  //   }
  // }

  @override
  Future<UserModel> readUser(String uid) {
    throw UnimplementedError();
  }

  // @override
  // Future<DocumentReference> addAccount(UserModel userModel) async {
  //   final random = Random();
  //   final randomNumber = random.nextInt(900000000) + 100000000;
  //   final account = await _accountCollection.add(
  //     {
  //       'accountNumber': randomNumber.toString(),
  //       'totalMoney': '0',
  //       'userID': _userCollection.doc(userModel.userId),
  //     },
  //   );
  //   return account;
  // }

  // @override
  // Future<void> transferMoney(String accountNumber, double amount) async {
  //   final userSnapshot = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(_firebaseAuth.currentUser?.uid)
  //       .get();

  //   if (userSnapshot.exists) {
  //     final accountReference =
  //         await userSnapshot.get('accountID') as DocumentReference;

  //     final accountSnapshot = await accountReference.get();
  //     final accountData = accountSnapshot.data()! as Map<String, dynamic>;
  //     final userBankAccountNumber = accountData['accountNumber'] as String;
  //     final userBalance = double.parse(
  //       accountData['totalMoney'] as String,
  //     ); // String'i double'a çevirdik

  //     // Kontrol 1: Kullanıcının yeterli bakiyesi var mı?
  //     if (userBalance < amount) {
  //       throw Exception('Yetersiz bakiye.');
  //     }

  //     // Kontrol 2: Gönderilen hesap numarası gerçekten var mı?
  //     final toAccountSnapshot = await FirebaseFirestore.instance
  //         .collection('account')
  //         .where('accountNumber', isEqualTo: accountNumber)
  //         .get();

  //     if (toAccountSnapshot.docs.isEmpty) {
  //       throw Exception('Hedef hesap numarası bulunamadı.');
  //     }

  //     // Para transferi
  //     await _transactionCollection.add({
  //       'amount': amount,
  //       'fromAccountID': userBankAccountNumber,
  //       'toAccountID': accountNumber,
  //       'date': DateTime.now(),
  //     });

  //     // Kullanıcının hesabından para çekme
  //     await accountReference.update({
  //       'totalMoney':
  //           (userBalance - amount).toString(), // double'ı String'e çevirdik
  //     });

  //     // Alıcı hesabına para eklemek için ayrı bir fonksiyon oluşturabilir veya burada doğrudan ekleyebilirsiniz.
  //     // Örnek olarak burada eklemeyi seçtim:

  //     final toAccountReference = toAccountSnapshot.docs.first.reference;
  //     final toAccountData = toAccountSnapshot.docs.first.data();
  //     final toUserBalance = double.parse(
  //       toAccountData['totalMoney'] as String,
  //     ); // String'i double'a çevirdik

  //     await toAccountReference.update({
  //       'totalMoney':
  //           (toUserBalance + amount).toString(), // double'ı String'e çevirdik
  //     });
  //   } else {
  //     throw Exception('Kullanıcı bilgisi bulunamadı.');
  //   }
  // }
}
