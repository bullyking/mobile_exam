class BankAccountDetailModel {
  final String? bankAccountNumber;
  final String? accountHolderName;
  final String? iFSCCode;

  BankAccountDetailModel({
    this.bankAccountNumber,
    this.accountHolderName,
    this.iFSCCode,
  });

  BankAccountDetailModel.mock({
    this.bankAccountNumber = '123456789',
    this.accountHolderName = 'Sukanya Yamnarm',
    this.iFSCCode = 'KKBK0000641',
  });

  factory BankAccountDetailModel.init() {
    return BankAccountDetailModel(
      bankAccountNumber: null,
      accountHolderName: null,
      iFSCCode: null,
    );
  }

  factory BankAccountDetailModel.fromMap(Map<String, dynamic> map) {
    return BankAccountDetailModel(
      bankAccountNumber: map['bankAccountNumber'],
      accountHolderName: map['accountHolderName'],
      iFSCCode: map['iFSCCode'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bankAccountNumber': bankAccountNumber,
      'accountHolderName': accountHolderName,
      'iFSCCode': iFSCCode,
    };
  }

  BankAccountDetailModel copyWith({
    String? bankAccountNumber,
    String? accountHolderName,
    String? iFSCCode,
  }) {
    return BankAccountDetailModel(
      bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
      accountHolderName: accountHolderName ?? this.accountHolderName,
      iFSCCode: iFSCCode ?? this.iFSCCode,
    );
  }
}
