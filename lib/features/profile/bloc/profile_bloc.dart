import 'dart:async';

import 'package:mobile_exam/core/enums/main_enums.dart';
import 'package:mobile_exam/core/enums/profile_enum.dart';
import 'package:mobile_exam/core/models/profile/address_detail_model.dart';
import 'package:mobile_exam/core/models/profile/bank_account_detail_model.dart';
import 'package:mobile_exam/core/models/profile/person_detail_model.dart';
import 'package:mobile_exam/core/models/profile/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_exam/features/profile/api/collections/profile_collection.dart';
import 'package:mobile_exam/features/profile/bloc/profile_form_state.dart';
import 'package:mobile_exam/features/profile/formz/account_holder_name_field.dart';
import 'package:mobile_exam/features/profile/formz/address_field.dart';
import 'package:mobile_exam/features/profile/formz/bank_account_number_field.dart';
import 'package:mobile_exam/features/profile/formz/city_field.dart';
import 'package:mobile_exam/features/profile/formz/country_field.dart';
import 'package:mobile_exam/features/profile/formz/email_field.dart';
import 'package:mobile_exam/features/profile/formz/ifsc_code_field.dart';
import 'package:mobile_exam/features/profile/formz/password_field.dart';
import 'package:mobile_exam/features/profile/formz/pincode_field.dart';
import 'package:mobile_exam/features/profile/formz/sex_field.dart';
import 'package:mobile_exam/features/profile/formz/state_field.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc()
      : super(const ProfileState.init(
          profileFormState: ProfileFormState.pure(),
        )) {
    on<FetchProfileListEvent>(_fetchProfileListToState);
    on<FetchProfileFormEvent>(_fetchProfileFormToState);

    // form
    on<HandleEmailChangeEvent>(_handleEmailChangeToState);
    on<HandlePasswordChangeEvent>(_handlePasswordChangeToState);

    // handle gender list (fetch)
    on<FetchGenderEvent>(_fetchGenderToState);
    on<HandleGenderChangeEvent>(_handleGenderChangeToState);
    on<HandleSaveGenderEvent>(_handleSaveGenderToState);

    on<HandlePincodeChangeEvent>(_handlePincodeChangeToState);
    on<HandleAddressChangeEvent>(_handleAddressChangeToState);
    on<HandleCityChangeEvent>(_handleCityChangeToState);
    on<HandleStateChangeEvent>(_handleStateChangeToState);
    on<HandleCountryChangeEvent>(_handleCountryChangeToState);
    on<HandleBankAccountNumberChangeEvent>(_handleBankAccountNumberChangeToState);
    on<HandleAccountHolderNameChangeEvent>(_handleAccountHolderNameChangeToState);
    on<HandleIFSCCodeChangeEvent>(_handleIFSCCodeChangeToState);

    // handle save
    on<HandleInvalidFormEvent>(_handleInvalidFormToState);
    on<CreateOrUpdateProfileEvent>(_createOrUpdateProfileToState);

    // handle delete profile.
    on<DeleteProfileEvent>(_deleteProfileToState);

    // handle mock profile.
    on<HandleMockProfileEvent>(_handleMockProfileToState);
  }

  FutureOr<void> _fetchProfileListToState(FetchProfileListEvent event, Emitter emit) async {
    emit(state.copyWith(status: ProfileStatus.loading));
    try {
      final response = await ProfileCollection.instance.fetchProfileList();
      emit(state.copyWith(status: ProfileStatus.success, profileList: response));
    } catch (e) {
      debugPrint('error FetchProfileEvent => $e');
      emit(state.copyWith(status: ProfileStatus.error, errorMsg: '$e'));
    }
  }

  FutureOr<void> _fetchProfileFormToState(FetchProfileFormEvent event, Emitter emit) async {
    emit(state.copyWith(status: ProfileStatus.loading));
    try {
      if (event.processType == ProcessType.create) {
        // case create
        final profile = ProfileModel.init();
        emit(state.copyWith(
          status: ProfileStatus.mapDataSuccess,
          profile: profile,
          profileFormState: ProfileFormState().mapDataFromProfile(profileForm: profile),
          validateType: ValidateType.none,
        ));
        return;
      } else {
        // case update
        final profileLength = state.profileList?.where((item) => item.personDetail?.profileId == event.id).length;
        emit(state.copyWith(
          processType: ProcessType.update,
          validateType: ValidateType.none,
        ));
        if (profileLength == 0) {
          emit(state.copyWith(status: ProfileStatus.success));
          return;
        } else {
          final profile = await ProfileCollection.instance.getProfileById(profileId: event.id.toString());
          final profileFormState = ProfileFormState().mapDataFromProfile(profileForm: profile ?? ProfileModel.init());
          emit(state.copyWith(status: ProfileStatus.mapDataSuccess, profile: profile, profileFormState: profileFormState));
          return;
        }
      }
    } catch (e) {
      emit(state.copyWith(status: ProfileStatus.error, errorMsg: '$e'));
    }
  }

  void _handleEmailChangeToState(HandleEmailChangeEvent event, Emitter emit) {
    final profile = state.profile;
    final newProfile = profile?.copyWith(
      personDetail: profile.personDetail?.copyWith(email: event.email),
    );
    emit(state.copyWith(
        profile: newProfile,
        profileFormState: state.profileFormState.copyWith(
          emailField: EmailField.dirty(value: event.email),
        )));
  }

  void _handlePasswordChangeToState(HandlePasswordChangeEvent event, Emitter emit) {
    final profile = state.profile;
    final newProfile = profile?.copyWith(
      personDetail: profile.personDetail?.copyWith(password: event.password),
    );
    emit(state.copyWith(
      profile: newProfile,
      profileFormState: state.profileFormState.copyWith(
        passwordField: PasswordField.dirty(value: event.password),
      ),
    ));
  }

  void _fetchGenderToState(FetchGenderEvent event, Emitter emit) {
    emit(state.copyWith(status: ProfileStatus.loading));
    emit(state.copyWith(status: ProfileStatus.success, tempGender: state.profile?.personDetail?.sex));
  }

  void _handleGenderChangeToState(HandleGenderChangeEvent event, Emitter emit) {
    final sexType = event.sex ?? Gender.male;
    emit(state.copyWith(
      tempGender: sexType,
      status: ProfileStatus.success,
    ));
  }

  void _handleSaveGenderToState(HandleSaveGenderEvent event, Emitter emit) {
    final sex = state.tempGender ?? Gender.male;
    emit(state.copyWith(
      profile: state.profile?.copyWith(
        personDetail: state.profile?.personDetail?.copyWith(sex: sex),
      ),
      profileFormState: state.profileFormState.copyWith(
        sexField: SexField.dirty(value: sex.desc),
      ),
      status: ProfileStatus.mapDataSuccess,
    ));
    debugPrint('personDetail sex => ${state.profile?.personDetail?.sex}');
    if (event.onSuccess != null) event.onSuccess?.call();
  }

  void _handlePincodeChangeToState(HandlePincodeChangeEvent event, Emitter emit) {
    final profile = state.profile;
    final newProfile = profile?.copyWith(
      addressDetail: profile.addressDetail?.copyWith(pincode: event.pincode),
    );
    emit(state.copyWith(
        profile: newProfile,
        profileFormState: state.profileFormState.copyWith(
          pincodeField: PinCodeField.dirty(value: event.pincode),
        )));
  }

  void _handleAddressChangeToState(HandleAddressChangeEvent event, Emitter emit) {
    final profile = state.profile;
    final newProfile = profile?.copyWith(
      addressDetail: profile.addressDetail?.copyWith(address: event.address),
    );
    emit(state.copyWith(
        profile: newProfile,
        profileFormState: state.profileFormState.copyWith(
          addressField: AddressField.dirty(value: event.address),
        )));
  }

  void _handleCityChangeToState(HandleCityChangeEvent event, Emitter emit) {
    final profile = state.profile;
    final newProfile = profile?.copyWith(
      addressDetail: profile.addressDetail?.copyWith(city: event.city),
    );
    emit(state.copyWith(
        profile: newProfile,
        profileFormState: state.profileFormState.copyWith(
          cityField: CityField.dirty(value: event.city),
        )));
  }

  void _handleStateChangeToState(HandleStateChangeEvent event, Emitter emit) {
    final profile = state.profile;
    final newProfile = profile?.copyWith(
      addressDetail: profile.addressDetail?.copyWith(state: event.state),
    );
    emit(state.copyWith(
        profile: newProfile,
        profileFormState: state.profileFormState.copyWith(
          stateField: StateField.dirty(value: event.state),
        )));
  }

  void _handleCountryChangeToState(HandleCountryChangeEvent event, Emitter emit) {
    final profile = state.profile;
    final newProfile = profile?.copyWith(
      addressDetail: profile.addressDetail?.copyWith(country: event.country),
    );
    emit(state.copyWith(
        profile: newProfile,
        profileFormState: state.profileFormState.copyWith(
          countryField: CountryField.dirty(value: event.country),
        )));
  }

  void _handleBankAccountNumberChangeToState(HandleBankAccountNumberChangeEvent event, Emitter emit) {
    final profile = state.profile;
    final newProfile = profile?.copyWith(
      bankAccountDetail: profile.bankAccountDetail?.copyWith(bankAccountNumber: event.bankAccountNumber),
    );
    emit(state.copyWith(
        profile: newProfile,
        profileFormState: state.profileFormState.copyWith(
          bankAccountNumberField: BankAccountNumberField.dirty(value: event.bankAccountNumber),
        )));
  }

  void _handleAccountHolderNameChangeToState(HandleAccountHolderNameChangeEvent event, Emitter emit) {
    final profile = state.profile;
    final newProfile = profile?.copyWith(
      bankAccountDetail: profile.bankAccountDetail?.copyWith(accountHolderName: event.accountHolderName),
    );
    emit(state.copyWith(
        profile: newProfile,
        profileFormState: state.profileFormState.copyWith(
          accountHolderNameField: AccountHolderNameField.dirty(value: event.accountHolderName),
        )));
  }

  void _handleIFSCCodeChangeToState(HandleIFSCCodeChangeEvent event, Emitter emit) {
    final profile = state.profile;
    final newProfile = profile?.copyWith(
      bankAccountDetail: profile.bankAccountDetail?.copyWith(iFSCCode: event.iFSCCode),
    );
    emit(state.copyWith(
        profile: newProfile,
        profileFormState: state.profileFormState.copyWith(
          ifscCodeField: IFSCCodeField.dirty(value: event.iFSCCode),
        )));
  }

  void _handleInvalidFormToState(HandleInvalidFormEvent event, Emitter emit) {
    emit(state.copyWith(status: ProfileStatus.restate));
    // final contactList = state.contactList ?? [];
    final profile = state.profile ?? ProfileModel.init();
    final sex = profile.personDetail?.sex ?? Gender.male;

    final profileForm = ProfileModel(
        personDetail: PersonDetailModel(
          email: state.profileFormState.emailField.value ?? '',
          password: state.profileFormState.passwordField.value ?? '',
          sex: sex,
        ),
        addressDetail: AddressDetailModel(
          pincode: state.profileFormState.pincodeField.value ?? '',
          address: state.profileFormState.addressField.value ?? '',
          state: state.profileFormState.stateField.value ?? '',
          city: state.profileFormState.cityField.value ?? '',
          country: state.profileFormState.countryField.value ?? '',
        ),
        bankAccountDetail: BankAccountDetailModel(
          bankAccountNumber: state.profileFormState.bankAccountNumberField.value ?? '',
          accountHolderName: state.profileFormState.accountHolderNameField.value ?? '',
          iFSCCode: state.profileFormState.ifscCodeField.value ?? '',
        ));

    final profileFormState = ProfileFormState().mapDataFromProfile(profileForm: profileForm);

    emit(state.copyWith(
      profile: profileForm,
      profileFormState: profileFormState,
      status: ProfileStatus.saveError,
      validateType: ValidateType.validate,
    ));

    if (event.onSuccess != null) event.onSuccess?.call();
  }

  // create or update profile
  FutureOr<void> _createOrUpdateProfileToState(CreateOrUpdateProfileEvent event, emit) async {
    final processType = state.processType ?? ProcessType.create;
    final ProfileModel? profileRequest = state.profile;
    try {
      final jsonData = profileToJson(data: profileRequest ?? ProfileModel.init());
      if (processType.isCreate) {
        await ProfileCollection.instance.saveProfile(request: jsonData);
        emit(state.copyWith(status: ProfileStatus.createSuccess));
        add(const FetchProfileListEvent());
      } else {
        await ProfileCollection.instance.saveProfile(request: jsonData);
        emit(state.copyWith(status: ProfileStatus.updateSuccess));
        add(const FetchProfileListEvent());
      }
    } catch (e) {
      debugPrint('error createOrUpdateProfileToState => $e');
      emit(state.copyWith(status: ProfileStatus.error, errorMsg: ''));
    }
  }

  // delete selected profile.
  FutureOr<void> _deleteProfileToState(DeleteProfileEvent event, emit) async {
    try {
      await ProfileCollection.instance.deleteProfile(profileId: event.profileId.toString());
      if (event.onSuccess != null) event.onSuccess?.call();
      add(const FetchProfileListEvent());
    } catch (e) {
      debugPrint('error delete profile => $e');
      emit(state.copyWith(status: ProfileStatus.error, errorMsg: ''));
    }
  }

  void _handleMockProfileToState(HandleMockProfileEvent event, emit) async {
    emit(state.copyWith(status: ProfileStatus.restate));
    try {
      final profileForm = ProfileModel.mock();
      final profileFormState = ProfileFormState().mapDataFromProfile(profileForm: profileForm);

      emit(state.copyWith(
        profile: profileForm,
        profileFormState: profileFormState,
        status: ProfileStatus.mockSuccess,
      ));
    } catch (e) {
      debugPrint('error delete profile => $e');
      emit(state.copyWith(status: ProfileStatus.error, errorMsg: ''));
    }
  }
}
