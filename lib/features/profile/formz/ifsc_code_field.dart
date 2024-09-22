import 'package:formz/formz.dart';
import 'package:mobile_exam/core/constant/form_constant.dart';
import 'package:mobile_exam/core/widgets/input_validation.dart';

enum IFSCCodeFieldValidationError { invalid, require }

extension IFSCCodeFieldValidationErrorX on IFSCCodeFieldValidationError {
  String? get describe {
    switch (this) {
      case IFSCCodeFieldValidationError.invalid:
        return FormConstant.incorrectField;
      case IFSCCodeFieldValidationError.require:
        return FormConstant.require;
    }
  }
}

class IFSCCodeField extends FormzInput<String?, IFSCCodeFieldValidationError> with InputValidationMixin {
  final bool isRequired;
  const IFSCCodeField.pure({String? value, this.isRequired = true}) : super.pure(value);
  const IFSCCodeField.dirty({String? value, this.isRequired = true}) : super.dirty(value);

  @override
  IFSCCodeFieldValidationError? validator(String? value) {
    // if ((value == null) || (value.isEmpty)) {
    //   return IFSCCodeFieldValidationError.require;
    // }
    return null;
  }
}
