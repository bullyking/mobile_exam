import 'package:formz/formz.dart';
import 'package:mobile_exam/core/constant/form_constant.dart';
import 'package:mobile_exam/core/widgets/input_validation.dart';

enum SexFieldValidationError { invalid, require }

extension SexFieldValidationErrorX on SexFieldValidationError {
  String? get describe {
    switch (this) {
      case SexFieldValidationError.invalid:
        return FormConstant.incorrectField;
      case SexFieldValidationError.require:
        return FormConstant.require;
    }
  }
}

class SexField extends FormzInput<String?, SexFieldValidationError> with InputValidationMixin {
  final bool isRequired;
  const SexField.pure({String? value, this.isRequired = true}) : super.pure(value);
  const SexField.dirty({String? value, this.isRequired = true}) : super.dirty(value);

  @override
  SexFieldValidationError? validator(String? value) {
    // if ((value == null) || (value.isEmpty)) {
    //   return SexFieldValidationError.require;
    // }
    return null;
  }
}
