import 'package:formz/formz.dart';
import 'package:mobile_exam/core/constant/form_constant.dart';
import 'package:mobile_exam/core/widgets/input_validation.dart';

enum PinCodeFieldValidationError { invalid, require }

extension PinCodeFieldValidationErrorX on PinCodeFieldValidationError {
  String? get describe {
    switch (this) {
      case PinCodeFieldValidationError.invalid:
        return FormConstant.incorrectField;
      case PinCodeFieldValidationError.require:
        return FormConstant.require;
    }
  }
}

class PinCodeField extends FormzInput<String?, PinCodeFieldValidationError> with InputValidationMixin {
  final bool isRequired;
  const PinCodeField.pure({String? value, this.isRequired = true}) : super.pure(value);
  const PinCodeField.dirty({String? value, this.isRequired = true}) : super.dirty(value);

  @override
  PinCodeFieldValidationError? validator(String? value) {
    // if ((value == null) || (value.isEmpty)) {
    //   return PinCodeFieldValidationError.require;
    // }
    return null;
  }
}
