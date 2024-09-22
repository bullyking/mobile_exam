import 'package:formz/formz.dart';
import 'package:mobile_exam/core/constant/form_constant.dart';
import 'package:mobile_exam/core/widgets/input_validation.dart';

enum AddressFieldValidationError { invalid, require }

extension AddressFieldValidationErrorX on AddressFieldValidationError {
  String? get describe {
    switch (this) {
      case AddressFieldValidationError.invalid:
        return FormConstant.incorrectField;
      case AddressFieldValidationError.require:
        return FormConstant.require;
    }
  }
}

class AddressField extends FormzInput<String?, AddressFieldValidationError> with InputValidationMixin {
  final bool isRequired;
  const AddressField.pure({String? value, this.isRequired = true}) : super.pure(value);
  const AddressField.dirty({String? value, this.isRequired = true}) : super.dirty(value);

  @override
  AddressFieldValidationError? validator(String? value) {
    // if ((value == null) || (value.isEmpty)) {
    //   return AddressFieldValidationError.require;
    // }
    return null;
  }
}
