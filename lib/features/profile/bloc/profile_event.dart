part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class FetchProfileListEvent extends ProfileEvent {
  const FetchProfileListEvent();

  @override
  List<Object> get props => [];
}

class FetchProfileFormEvent extends ProfileEvent {
  const FetchProfileFormEvent({this.id, this.processType});
  final int? id;
  final ProcessType? processType;

  @override
  List<Object> get props => [];
}

class HandleEmailChangeEvent extends ProfileEvent {
  const HandleEmailChangeEvent({this.email});
  final String? email;

  @override
  List<Object> get props => [email ?? ''];
}

class HandlePasswordChangeEvent extends ProfileEvent {
  const HandlePasswordChangeEvent({this.password});
  final String? password;

  @override
  List<Object> get props => [password ?? ''];
}

class FetchGenderEvent extends ProfileEvent {
  const FetchGenderEvent();

  @override
  List<Object> get props => [];
}

class HandleGenderChangeEvent extends ProfileEvent {
  const HandleGenderChangeEvent({this.sex});
  final Gender? sex;

  @override
  List<Object> get props => [sex ?? ''];
}

class HandleSaveGenderEvent extends ProfileEvent {
  const HandleSaveGenderEvent({this.onSuccess});
  final Function? onSuccess;

  @override
  List<Object> get props => [onSuccess ?? () {}];
}

class HandlePincodeChangeEvent extends ProfileEvent {
  const HandlePincodeChangeEvent({this.pincode});
  final String? pincode;

  @override
  List<Object> get props => [pincode ?? ''];
}

class HandleAddressChangeEvent extends ProfileEvent {
  const HandleAddressChangeEvent({this.address});
  final String? address;

  @override
  List<Object> get props => [address ?? ''];
}

class HandleCityChangeEvent extends ProfileEvent {
  const HandleCityChangeEvent({this.city});
  final String? city;

  @override
  List<Object> get props => [city ?? ''];
}

class HandleStateChangeEvent extends ProfileEvent {
  const HandleStateChangeEvent({this.state});
  final String? state;

  @override
  List<Object> get props => [state ?? ''];
}

class HandleCountryChangeEvent extends ProfileEvent {
  const HandleCountryChangeEvent({this.country});
  final String? country;

  @override
  List<Object> get props => [country ?? ''];
}

class HandleBankAccountNumberChangeEvent extends ProfileEvent {
  const HandleBankAccountNumberChangeEvent({this.bankAccountNumber});
  final String? bankAccountNumber;

  @override
  List<Object> get props => [bankAccountNumber ?? ''];
}

class HandleAccountHolderNameChangeEvent extends ProfileEvent {
  const HandleAccountHolderNameChangeEvent({this.accountHolderName});
  final String? accountHolderName;

  @override
  List<Object> get props => [accountHolderName ?? ''];
}

class HandleIFSCCodeChangeEvent extends ProfileEvent {
  const HandleIFSCCodeChangeEvent({this.iFSCCode});
  final String? iFSCCode;

  @override
  List<Object> get props => [iFSCCode ?? ''];
}

class HandleInvalidFormEvent extends ProfileEvent {
  const HandleInvalidFormEvent({this.isValidate, this.onSuccess});
  final bool? isValidate;
  final Function? onSuccess;

  @override
  List<Object> get props => [isValidate ?? false, onSuccess ?? () {}];
}

class CreateOrUpdateProfileEvent extends ProfileEvent {
  const CreateOrUpdateProfileEvent({this.profile, this.onSuccess});
  final ProfileModel? profile;
  final Function? onSuccess;

  @override
  List<Object> get props => [profile ?? ProfileModel.init, onSuccess ?? () {}];
}

class DeleteProfileEvent extends ProfileEvent {
  const DeleteProfileEvent({this.profileId, this.onSuccess});

  final int? profileId;
  final Function? onSuccess;

  @override
  List<Object> get props => [profileId ?? 0, onSuccess ?? () {}];
}

class HandleMockProfileEvent extends ProfileEvent {
  const HandleMockProfileEvent();

  @override
  List<Object> get props => [];
}
