import 'dart:convert';

import 'package:mobile_exam/core/enums/profile_enum.dart';
import 'package:mobile_exam/core/models/profile/address_detail_model.dart';
import 'package:mobile_exam/core/models/profile/bank_account_detail_model.dart';
import 'package:mobile_exam/core/models/profile/person_detail_model.dart';

List<ProfileModel> profileListFromJson(String str) =>
    List<ProfileModel>.from(json.decode(str).map((x) => ProfileModel.fromMap(x)));

// show list contact to json
String profileListToJson({required List<ProfileModel> data}) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

ProfileModel profileFromJson(String str) => ProfileModel.fromMap(json.decode(str));

// show data json
String profileToJson({required ProfileModel data}) => json.encode(data.toMapRawJson());

class ProfileModel {
  final PersonDetailModel? personDetail;
  final AddressDetailModel? addressDetail;
  final BankAccountDetailModel? bankAccountDetail;

  ProfileModel({
    this.personDetail,
    this.addressDetail,
    this.bankAccountDetail,
  });

  factory ProfileModel.mock() {
    return ProfileModel(
      personDetail: PersonDetailModel.mock(),
      addressDetail: AddressDetailModel.mock(),
      bankAccountDetail: BankAccountDetailModel.mock(),
    );
  }

// make init profile to data above
  factory ProfileModel.init() {
    return ProfileModel(
      personDetail: PersonDetailModel.init(),
      addressDetail: AddressDetailModel.init(),
      bankAccountDetail: BankAccountDetailModel.init(),
    );
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      personDetail: PersonDetailModel.fromMap(map['personDetail']),
      addressDetail: AddressDetailModel.fromMap(map['addressDetail']),
      bankAccountDetail: BankAccountDetailModel.fromMap(map['bankAccountDetail']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'personDetail': personDetail?.toMap(),
      'addressDetail': addressDetail?.toMap(),
      'bankAccountDetail': bankAccountDetail?.toMap(),
    };
  }

  Map<String, String> toMapRawJson() {
    // map json from data inside each model.
    final sex = personDetail?.sex ?? Gender.male;
    return {
      'profileId': '${personDetail?.profileId}',
      'email': '${personDetail?.email}',
      'password': '${personDetail?.password}',
      'sex': sex.desc,
      'pincode': '${addressDetail?.pincode}',
      'address': '${addressDetail?.address}',
      'city': '${addressDetail?.city}',
      'state': '${addressDetail?.state}',
      'country': '${addressDetail?.country}',
      'bankAccountNumber': '${bankAccountDetail?.bankAccountNumber}',
      'accountHolderName': '${bankAccountDetail?.accountHolderName}',
      'iFSCCode': '${bankAccountDetail?.iFSCCode}',
    };
  }

  ProfileModel copyWith({
    PersonDetailModel? personDetail,
    AddressDetailModel? addressDetail,
    BankAccountDetailModel? bankAccountDetail,
  }) {
    return ProfileModel(
      personDetail: personDetail ?? this.personDetail,
      addressDetail: addressDetail ?? this.addressDetail,
      bankAccountDetail: bankAccountDetail ?? this.bankAccountDetail,
    );
  }
}
