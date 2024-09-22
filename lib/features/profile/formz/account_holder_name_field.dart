import 'package:formz/formz.dart';
import 'package:mobile_exam/core/constant/form_constant.dart';
import 'package:mobile_exam/core/widgets/input_validation.dart';

enum AccountHolderNameFieldValidationError { invalid, require }

extension AccountHolderNameFieldValidationErrorX on AccountHolderNameFieldValidationError {
  String? get describe {
    switch (this) {
      case AccountHolderNameFieldValidationError.invalid:
        return FormConstant.incorrectField;
      case AccountHolderNameFieldValidationError.require:
        return FormConstant.require;
    }
  }
}

class AccountHolderNameField extends FormzInput<String?, AccountHolderNameFieldValidationError> with InputValidationMixin {
  final bool isRequired;
  const AccountHolderNameField.pure({String? value, this.isRequired = true}) : super.pure(value);
  const AccountHolderNameField.dirty({String? value, this.isRequired = true}) : super.dirty(value);

  @override
  AccountHolderNameFieldValidationError? validator(String? value) {
    // if ((value == null) || (value.isEmpty)) {
    //   return AccountHolderNameFieldValidationError.require;
    // }
    return null;
  }
}
