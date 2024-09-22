import 'package:formz/formz.dart';
import 'package:mobile_exam/core/constant/form_constant.dart';
import 'package:mobile_exam/core/extension/string_extension.dart';
import 'package:mobile_exam/core/widgets/input_validation.dart';

enum PasswordFieldValidationError { invalid, require }

extension PasswordFieldValidationErrorX on PasswordFieldValidationError {
  String? get describe {
    switch (this) {
      case PasswordFieldValidationError.invalid:
        return FormConstant.incorrectField;
      case PasswordFieldValidationError.require:
        return FormConstant.require;
    }
  }
}

class PasswordField extends FormzInput<String?, PasswordFieldValidationError> with InputValidationMixin {
  final bool isRequired;
  const PasswordField.pure({String? value, this.isRequired = true}) : super.pure(value);
  const PasswordField.dirty({String? value, this.isRequired = true}) : super.dirty(value);

  @override
  PasswordFieldValidationError? validator(String? value) {
    if (value.isNullOrEmpty) {
      return PasswordFieldValidationError.require;
    }
    return null;
  }
}
