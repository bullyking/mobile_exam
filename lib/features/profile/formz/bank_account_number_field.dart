import 'package:formz/formz.dart';
import 'package:mobile_exam/core/constant/form_constant.dart';
import 'package:mobile_exam/core/widgets/input_validation.dart';

enum BankAccountNumberFieldValidationError { invalid, require }

extension BankAccountNumberFieldValidationErrorX on BankAccountNumberFieldValidationError {
  String? get describe {
    switch (this) {
      case BankAccountNumberFieldValidationError.invalid:
        return FormConstant.incorrectField;
      case BankAccountNumberFieldValidationError.require:
        return FormConstant.require;
    }
  }
}

class BankAccountNumberField extends FormzInput<String?, BankAccountNumberFieldValidationError> with InputValidationMixin {
  final bool isRequired;
  const BankAccountNumberField.pure({String? value, this.isRequired = true}) : super.pure(value);
  const BankAccountNumberField.dirty({String? value, this.isRequired = true}) : super.dirty(value);

  @override
  BankAccountNumberFieldValidationError? validator(String? value) {
    // if ((value == null) || (value.isEmpty)) {
    //   return BankAccountNumberFieldValidationError.require;
    // }
    return null;
  }
}
