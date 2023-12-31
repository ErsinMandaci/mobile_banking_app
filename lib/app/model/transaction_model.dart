import 'package:freezed_annotation/freezed_annotation.dart';
part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    double? amount,
    DateTime? date,
    String? fromAccountID,
    String? toAccountID,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, Object?> json) =>
      _$TransactionModelFromJson(json);
}
