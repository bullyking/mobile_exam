import 'package:formz/formz.dart';
import 'package:mobile_exam/core/constant/form_constant.dart';
import 'package:mobile_exam/core/widgets/input_validation.dart';

enum StateFieldValidationError { invalid, require }

extension StateFieldValidationErrorX on StateFieldValidationError {
  String? get describe {
    switch (this) {
      case StateFieldValidationError.invalid:
        return FormConstant.incorrectField;
      case StateFieldValidationError.require:
        return FormConstant.require;
    }
  }
}

class StateField extends FormzInput<String?, StateFieldValidationError> with InputValidationMixin {
  final bool isRequired;
  const StateField.pure({String? value, this.isRequired = true}) : super.pure(value);
  const StateField.dirty({String? value, this.isRequired = true}) : super.dirty(value);

  @override
  StateFieldValidationError? validator(String? value) {
    // if ((value == null) || (value.isEmpty)) {
    //   return StateFieldValidationError.require;
    // }
    return null;
  }
}
