enum ProcessType { create, update }

enum DialogStatus { success, error, invalid, info }

enum ValidateType { none, validate }

extension ProcessTypeXCompare on ProcessType {
  bool get isCreate => this == ProcessType.create;
  bool get isUpdate => this == ProcessType.update;
}

extension DialogStatusXCompare on DialogStatus {
  bool get isSuccess => this == DialogStatus.success;
  bool get isError => this == DialogStatus.error;
  bool get isInvalid => this == DialogStatus.invalid;
  bool get isInfo => this == DialogStatus.info;
}

extension ValidateTypeXCompare on ValidateType {
  bool get isNone => this == ValidateType.none;
  bool get isValidate => this == ValidateType.validate;
}
