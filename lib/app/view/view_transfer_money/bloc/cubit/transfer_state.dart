part of 'transfer_view_model.dart';

@immutable
final class TransferState extends Equatable {
  const TransferState({
    required this.amount,
    required this.accountNumber,
  });
  final double amount;
  final String accountNumber;

  @override
  List<Object?> get props => [amount, accountNumber];

  TransferState copyWith({
    double? amount,
    String? accountNumber,
  }) {
    return TransferState(
      amount: amount ?? this.amount,
      accountNumber: accountNumber ?? this.accountNumber,
    );
  }
}
