import 'package:formz/formz.dart';
import 'package:mobile_exam/core/enums/profile_enum.dart';
import 'package:mobile_exam/core/models/profile/profile_model.dart';
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

class ProfileFormState with FormzMixin {
  final EmailField emailField;
  final PasswordField passwordField;
  final SexField sexField;
  final PinCodeField pincodeField;
  final AddressField addressField;
  final CityField cityField;
  final StateField stateField;
  final CountryField countryField;
  final BankAccountNumberField bankAccountNumberField;
  final AccountHolderNameField accountHolderNameField;
  final IFSCCodeField ifscCodeField;

  const ProfileFormState.pure({
    this.emailField = const EmailField.pure(),
    this.passwordField = const PasswordField.pure(),
    this.sexField = const SexField.pure(),
    this.pincodeField = const PinCodeField.pure(),
    this.addressField = const AddressField.pure(),
    this.cityField = const CityField.pure(),
    this.stateField = const StateField.pure(),
    this.countryField = const CountryField.pure(),
    this.bankAccountNumberField = const BankAccountNumberField.pure(),
    this.accountHolderNameField = const AccountHolderNameField.pure(),
    this.ifscCodeField = const IFSCCodeField.pure(),
  });

  ProfileFormState({
    this.emailField = const EmailField.pure(),
    this.passwordField = const PasswordField.pure(),
    this.sexField = const SexField.pure(),
    this.pincodeField = const PinCodeField.pure(),
    this.addressField = const AddressField.pure(),
    this.cityField = const CityField.pure(),
    this.stateField = const StateField.pure(),
    this.countryField = const CountryField.pure(),
    this.bankAccountNumberField = const BankAccountNumberField.pure(),
    this.accountHolderNameField = const AccountHolderNameField.pure(),
    this.ifscCodeField = const IFSCCodeField.pure(),
  });

  ProfileFormState mapDataFromProfile({required ProfileModel profileForm}) {
    final sex = profileForm.personDetail?.sex ?? Gender.male;
    return ProfileFormState(
      emailField: EmailField.dirty(value: profileForm.personDetail?.email),
      passwordField: PasswordField.dirty(value: profileForm.personDetail?.password),
      sexField: SexField.dirty(value: sex.desc),
      pincodeField: PinCodeField.dirty(value: profileForm.addressDetail?.pincode),
      addressField: AddressField.dirty(value: profileForm.addressDetail?.address),
      stateField: StateField.dirty(value: profileForm.addressDetail?.state),
      cityField: CityField.dirty(value: profileForm.addressDetail?.city),
      countryField: CountryField.dirty(value: profileForm.addressDetail?.country),
      bankAccountNumberField: BankAccountNumberField.dirty(value: profileForm.bankAccountDetail?.bankAccountNumber),
      accountHolderNameField: AccountHolderNameField.dirty(value: profileForm.bankAccountDetail?.accountHolderName),
      ifscCodeField: IFSCCodeField.dirty(value: profileForm.bankAccountDetail?.iFSCCode),
    );
  }

  bool get isFormValid => FormzStatus.valid == status;

  ProfileFormState copyWith({
    EmailField? emailField,
    PasswordField? passwordField,
    SexField? sexField,
    PinCodeField? pincodeField,
    AddressField? addressField,
    CityField? cityField,
    StateField? stateField,
    CountryField? countryField,
    BankAccountNumberField? bankAccountNumberField,
    AccountHolderNameField? accountHolderNameField,
    IFSCCodeField? ifscCodeField,
  }) {
    return ProfileFormState(
      emailField: emailField ?? this.emailField,
      passwordField: passwordField ?? this.passwordField,
      sexField: sexField ?? this.sexField,
      pincodeField: pincodeField ?? this.pincodeField,
      addressField: addressField ?? this.addressField,
      cityField: cityField ?? this.cityField,
      stateField: stateField ?? this.stateField,
      countryField: countryField ?? this.countryField,
      bankAccountNumberField: bankAccountNumberField ?? this.bankAccountNumberField,
      accountHolderNameField: accountHolderNameField ?? this.accountHolderNameField,
      ifscCodeField: ifscCodeField ?? this.ifscCodeField,
    );
  }

  @override
  List<FormzInput> get inputs => [
        emailField,
        passwordField,
        sexField,
        pincodeField,
        addressField,
        cityField,
        stateField,
        countryField,
        bankAccountNumberField,
        accountHolderNameField,
        ifscCodeField,
      ];
}
