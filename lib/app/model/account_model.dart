class Account {
  Account({
    this.accountNumber,
    this.totalMoney,
    this.transactionReference,
    this.userID,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      accountNumber: json['accountNumber'] as String?,
      totalMoney: json['totalMoney'] as String?,
      transactionReference: json['transactionReference'] as List<dynamic>?,
      userID: json['userID'] as dynamic,
    );
  }
  String? accountNumber;
  String? totalMoney;
  List<dynamic>? transactionReference;
  dynamic userID;

  Account copyWith({
    String? accountNumber,
    String? totalMoney,
    List<dynamic>? transactionReference,
    dynamic userID,
  }) {
    return Account(
      accountNumber: accountNumber ?? this.accountNumber,
      totalMoney: totalMoney ?? this.totalMoney,
      transactionReference: transactionReference ?? this.transactionReference,
      userID: userID ?? this.userID,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accountNumber': accountNumber,
      'totalMoney': totalMoney,
      'transactionReference': transactionReference,
      'userID': userID,
    };
  }

  @override
  String toString() =>
      'Account(accountNumber: $accountNumber,totalMoney: $totalMoney,transactionReference: $transactionReference,userID: $userID)';

  @override
  int get hashCode =>
      Object.hash(accountNumber, totalMoney, transactionReference, userID);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Account &&
          runtimeType == other.runtimeType &&
          accountNumber == other.accountNumber &&
          totalMoney == other.totalMoney &&
          transactionReference == other.transactionReference &&
          userID == other.userID;
}
