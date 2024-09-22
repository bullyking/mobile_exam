enum Gender { male, female }

//extension
extension SexTypeExtension on Gender {
  String get desc {
    switch (this) {
      case Gender.male:
        return 'male';

      case Gender.female:
        return 'female';
    }
  }
}
