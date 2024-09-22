import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_exam/core/constant/api_constant.dart';
import 'package:mobile_exam/core/constant/app_constant.dart';

import 'package:mobile_exam/core/models/profile/profile_model.dart';

class ProfileCollection {
  static final ProfileCollection _instance = ProfileCollection._internal();

  factory ProfileCollection() {
    return _instance;
  }

  static ProfileCollection get instance => _instance;

  ProfileCollection._internal();

  FutureOr<List<ProfileModel>?> fetchProfileList() async {
    var url = Uri.https(AppConstant.baseUrl, ApiConstant.fetchProfileList, {'q': '{http}'});
    var response = await http.get(url);
    if (response.statusCode == 200 && response.body.isNotEmpty) {
      return profileListFromJson(response.body);
    }
    return [];
  }

  FutureOr<ProfileModel?> getProfileById({required String profileId}) async {
    var url = Uri.https(AppConstant.baseUrl, '${ApiConstant.getProfileById}/$profileId', {'q': '{http}'});
    var response = await http.get(url);
    if (response.statusCode == 200 && response.body.isNotEmpty) {
      return profileFromJson(response.body);
    }
    return null;
  }

  FutureOr<bool> saveProfile({required String request}) async {
    var url = Uri.https(AppConstant.baseUrl, ApiConstant.saveProfile, {'q': '{http}'});
    var response = await http.post(url, body: json.decode(request));
    if (response.statusCode == 200 && response.body.isNotEmpty) {
      return true;
    }
    return false;
  }

//   delete profile
  FutureOr<bool> deleteProfile({required String profileId}) async {
    var url = Uri.https(AppConstant.baseUrl, '${ApiConstant.deleteProfile}/$profileId', {'q': '{http}'});
    var response = await http.delete(url);
    debugPrint('response deleteProfile: ${response.body} $profileId');
    if (response.statusCode == 200 && response.body.isNotEmpty) {
      return true;
    }
    return false;
  }
}
