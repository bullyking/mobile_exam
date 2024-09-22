import 'package:formz/formz.dart';
import 'package:mobile_exam/core/constant/form_constant.dart';
import 'package:mobile_exam/core/widgets/input_validation.dart';

enum CountryFieldValidationError { invalid, require }

extension CountryFieldValidationErrorX on CountryFieldValidationError {
  String? get describe {
    switch (this) {
      case CountryFieldValidationError.invalid:
        return FormConstant.incorrectField;
      case CountryFieldValidationError.require:
        return FormConstant.require;
    }
  }
}

class CountryField extends FormzInput<String?, CountryFieldValidationError> with InputValidationMixin {
  final bool isRequired;
  const CountryField.pure({String? value, this.isRequired = true}) : super.pure(value);
  const CountryField.dirty({String? value, this.isRequired = true}) : super.dirty(value);

  @override
  CountryFieldValidationError? validator(String? value) {
    // if ((value == null) || (value.isEmpty)) {
    //   return CountryFieldValidationError.require;
    // }
    return null;
  }
}
