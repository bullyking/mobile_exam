import 'package:formz/formz.dart';
import 'package:mobile_exam/core/constant/form_constant.dart';
import 'package:mobile_exam/core/extension/string_extension.dart';
import 'package:mobile_exam/core/widgets/input_validation.dart';

enum EmailFieldValidationError { invalid, require }

extension EmailFieldValidationErrorX on EmailFieldValidationError {
  String? get describe {
    switch (this) {
      case EmailFieldValidationError.invalid:
        return FormConstant.incorrectField;
      case EmailFieldValidationError.require:
        return FormConstant.require;
    }
  }
}

class EmailField extends FormzInput<String?, EmailFieldValidationError> with InputValidationMixin {
  final bool isRequired;
  const EmailField.pure({String? value, this.isRequired = true}) : super.pure(value);
  const EmailField.dirty({String? value, this.isRequired = true}) : super.dirty(value);

  @override
  EmailFieldValidationError? validator(String? value) {
    if (value.isNullOrEmpty) {
      return EmailFieldValidationError.require;
    } else if (!isEmailValid(value)) {
      return EmailFieldValidationError.invalid;
    }
    return null;
  }
}
