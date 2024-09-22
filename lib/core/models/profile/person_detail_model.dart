import 'dart:io';

import 'package:mobile_exam/core/enums/profile_enum.dart';

class PersonDetailModel {
  final int? profileId;
  final String? image;
  final File? imageFile;
  final String? email;
  final String? password;
  final Gender? sex;

  PersonDetailModel({
    this.profileId = 0,
    this.image,
    this.imageFile,
    this.email,
    this.password,
    this.sex,
  });

  PersonDetailModel.mock({
    this.profileId = 0,
    this.image,
    this.imageFile,
    this.email = 'kitja.rodrat@gmail.com',
    this.password = '123456',
    this.sex = Gender.male,
  });

// make init profile to data above
  factory PersonDetailModel.init() {
    return PersonDetailModel(
      profileId: 0,
      image:  '',
      email:  '',
      password:  '',
      sex: Gender.male,
    );
  }

  factory PersonDetailModel.fromMap(Map<String, dynamic> map) {
    return PersonDetailModel(
      profileId: map['profileId'],
      image: map['image'],
      imageFile: map['imageFile'],
      email: map['email'],
      password: map['password'],
      sex: map['sex'] != null && map['sex'] != 'null' ? Gender.values.byName(map['sex']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'profileId': profileId,
      'image': image,
      'imageFile': imageFile,
      'email': email,
      'password': password,
      'sex': sex != null ? sex?.desc : sex,
    };
  }

  PersonDetailModel copyWith({
    int? profileId,
    String? image,
    File? imageFile,
    String? email,
    String? password,
    Gender? sex,
  }) {
    return PersonDetailModel(
      profileId: profileId ?? this.profileId,
      image: image ?? this.image,
      imageFile: imageFile ?? this.imageFile,
      email: email ?? this.email,
      password: password ?? this.password,
      sex: sex ?? this.sex,
    );
  }
}
