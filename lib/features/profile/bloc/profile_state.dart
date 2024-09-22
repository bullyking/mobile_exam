part of 'profile_bloc.dart';

enum ProfileStatus {
  init,
  loading,
  success,
  error,
  restate,
  mapDataSuccess,
  createSuccess,
  updateSuccess,
  saveError,
  mockSuccess,
}

extension ProfileCompare on ProfileStatus {
  bool get isInit => this == ProfileStatus.init;
  bool get isLoading => this == ProfileStatus.loading;
  bool get isSuccess => this == ProfileStatus.success;
  bool get isError => this == ProfileStatus.error;
  bool get isRestate => this == ProfileStatus.restate;
  bool get isMapDataSuccess => this == ProfileStatus.mapDataSuccess;
  bool get isCreateSuccess => this == ProfileStatus.createSuccess;
  bool get isUpdateSuccess => this == ProfileStatus.updateSuccess;
  bool get isSaveError => this == ProfileStatus.saveError;
  bool get isMockSuccess => this == ProfileStatus.mockSuccess;
}

class ProfileState extends Equatable {
  final List<ProfileModel>? profileList;
  final ProfileModel? profile;
  final ProfileFormState profileFormState;
  final Gender? tempGender;
  final ValidateType? validateType;
  final ProcessType? processType;
  final ProfileStatus status;
  final String? errorMsg;

  const ProfileState.init({
    this.profileList,
    this.profile,
    this.profileFormState = const ProfileFormState.pure(),
    this.tempGender = Gender.male,
    this.validateType = ValidateType.none,
    this.processType = ProcessType.create,
    this.status = ProfileStatus.loading,
    this.errorMsg,
  });

  @override
  List<Object?> get props {
    return [
      profileList,
      profile,
      profileFormState,
      tempGender,
      validateType,
      processType,
      status,
      errorMsg,
    ];
  }

  const ProfileState({
    this.profileList,
    this.profile,
    this.profileFormState = const ProfileFormState.pure(),
    this.tempGender = Gender.male,
    this.validateType = ValidateType.none,
    this.processType = ProcessType.create,
    required this.status,
    this.errorMsg,
  });

  ProfileState copyWith({
    List<ProfileModel>? profileList,
    ProfileModel? profile,
    ProfileFormState? profileFormState,
    Gender? tempGender,
    ValidateType? validateType,
    ProcessType? processType,
    ProfileStatus? status,
    String? errorMsg,
  }) {
    return ProfileState(
      profileList: profileList ?? this.profileList,
      profile: profile ?? this.profile,
      profileFormState: profileFormState ?? this.profileFormState,
      tempGender: tempGender ?? this.tempGender,
      validateType: validateType ?? this.validateType,
      processType: processType ?? this.processType,
      status: status ?? this.status,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  Map<String, dynamic> toMapJson() {
    return {
      'profileList': profileList?.map((x) => x.toMap()).toList(),
      'profile': profile?.toMap(),
      'profileFormState': profileFormState,
      'tempGender': tempGender,
      'validateType': validateType,
      'processType': processType,
      'status': status,
      'errorMsg': errorMsg,
    };
  }

  factory ProfileState.fromMapJson(Map<String, dynamic> map) {
    return ProfileState(
      profileList: List<ProfileModel>.from(map['profileList']?.map((x) => ProfileModel.fromMap(x))),
      profile: ProfileModel.fromMap(map['profile']),
      profileFormState: map['profileFormState'] as ProfileFormState,
      validateType: map['validateType'] as ValidateType,
      processType: map['processType'] as ProcessType,
      status: map['status'] as ProfileStatus,
      errorMsg: map['errorMsg'] as String,
    );
  }
}
