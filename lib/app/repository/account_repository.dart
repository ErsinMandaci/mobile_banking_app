import 'package:banking_mobile_app/app/model/account_model.dart';
import 'package:banking_mobile_app/app/model/transaction_model.dart';
import 'package:banking_mobile_app/app/model/user_model.dart';
import 'package:banking_mobile_app/services/base/account_base_service.dart';
import 'package:banking_mobile_app/services/firestore/account_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final class AccountRepository extends IAccountBaseService {
  @override
  Future<DocumentReference<Object?>> addAccount(UserModel userModel) async {
    try {
      final addAccountResponse = await AccountService().addAccount(userModel);

      if (addAccountResponse.id.isNotEmpty) {
        return addAccountResponse;
      } else {
        throw Exception('Failed to add account');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> transferMoney(String accountNumber, double amount) async {
    try {
      final transferMoneyResponse =
          await AccountService().transferMoney(accountNumber, amount);
      return transferMoneyResponse;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> checkAccount(String accountNumber) async {
    try {
      final checkAccountResponse =
          await AccountService().checkAccount(accountNumber);
      if (checkAccountResponse) {
        return true;
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Account> getAccount() async {
    try {
      final getAccountResponse = await AccountService().getAccount();
      if (getAccountResponse.accountNumber?.isNotEmpty ?? true) {
        return getAccountResponse;
      }
      throw Exception(
        'Failed to get account data from Account Repository Get account ',
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<TransactionModel>> getTransaction() async {
    try {
      final getTransactionResponse = await AccountService().getTransaction();
      if (getTransactionResponse.isEmpty) return [];
      return getTransactionResponse;
    } catch (e) {
      rethrow;
    }
  }
}
