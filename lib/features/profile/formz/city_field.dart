import 'package:formz/formz.dart';
import 'package:mobile_exam/core/constant/form_constant.dart';
import 'package:mobile_exam/core/widgets/input_validation.dart';

enum CityFieldValidationError { invalid, require }

extension CityFieldValidationErrorX on CityFieldValidationError {
  String? get describe {
    switch (this) {
      case CityFieldValidationError.invalid:
        return FormConstant.incorrectField;
      case CityFieldValidationError.require:
        return FormConstant.require;
    }
  }
}

class CityField extends FormzInput<String?, CityFieldValidationError> with InputValidationMixin {
  final bool isRequired;
  const CityField.pure({String? value, this.isRequired = true}) : super.pure(value);
  const CityField.dirty({String? value, this.isRequired = true}) : super.dirty(value);

  @override
  CityFieldValidationError? validator(String? value) {
    // if ((value == null) || (value.isEmpty)) {
    //   return CityFieldValidationError.require;
    // }
    return null;
  }
}
