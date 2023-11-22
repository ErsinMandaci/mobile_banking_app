import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_state.dart';

class TransferViewModel extends Cubit<TransferState> {
  TransferViewModel()
      : super(const TransferState(amount: 0, accountNumber: ''));

  void getAmount(double amount, String accountNumber) {
    emit(state.copyWith(amount: amount, accountNumber: accountNumber));

    print(state.amount);
  }
}
