/// Base class representing a validation rule
/// Every new validation should extends this one.
///
abstract class ValidationRule {
  /// Name of the rule. You can use this atribute to
  /// show the name of the rule to the user, for example.
  String get name;

  /// A function that should be implemented and it represents
  /// the validation of the value. It should return [Boolean] indicating
  /// that the value passed pass the validation or not.
  bool validate(String value);
}

/// Validates that the value has at least one uppercase letter
class UppercaseValidationRule extends ValidationRule {
  @override
  String get name => 'Großbuchstaben';

  @override
  bool validate(String value) {
    return value.contains(RegExp(r'[A-Z]'));
  }
}

/// Validates that the value has at least one lowercase letter
class LowercaseValidationRule extends ValidationRule {
  @override
  String get name => 'Kleinbuchstaben';

  @override
  bool validate(String value) {
    return value.contains(RegExp(r'[a-z]'));
  }
}

/// Validates that the value has at least one digit
class DigitValidationRule extends ValidationRule {
  @override
  String get name => 'Zahlen ';

  @override
  bool validate(String value) {
    return value.contains(RegExp(r'[0-9]'));
  }
}

/// Validates that the value has at least one special character
class SpecialCharacterValidationRule extends ValidationRule {
  @override
  String get name => 'Sonderzeichen ';

  @override
  bool validate(String value) {
    return value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }
}

/// Validates that the value has at least [numberOfCharacters]
///
/// Throws [AssertionError] if numberOfCharacters <= 0.
class MinCharactersValidationRule extends ValidationRule {
  MinCharactersValidationRule(this._numberOfCharacters)
      : assert(_numberOfCharacters > 0,
            'Anzahl der Zeichen muss größer 0 sein');

  final int _numberOfCharacters;

  @override
  String get name => 'Mindestens $_numberOfCharacters Zeichen';

  @override
  bool validate(String value) {
    return value.length >= _numberOfCharacters;
  }
}

/// Validates that the value has at most [numberOfCharacters]
///
/// Throws [AssertionError] if numberOfCharacters <= 0.
class MaxCharactersValidationRule extends ValidationRule {
  MaxCharactersValidationRule(this._numberOfCharacters)
      : assert(_numberOfCharacters > 0,
            'numberOfCharacters must be greater than 0');

  final int _numberOfCharacters;

  @override
  String get name => 'Maximal $_numberOfCharacters Zeichen';

  @override
  bool validate(String value) {
    return value.length <= _numberOfCharacters;
  }
}

/// Validates that the value is at least [min] size and  at most [max]
///
/// Throws [AssertionError] if min <= 0.
/// Throws [AssertionError] if max <= 0.
/// Throws [AssertionError] if min > max.
class MinAndMaxCharactersValidationRule extends ValidationRule {
  MinAndMaxCharactersValidationRule({
    required int min,
    required int max,
  })  : assert(min > 0, 'min must be greater than 0'),
        assert(max > 0, 'max must be greater than 0'),
        assert(max >= min, 'max must be greater than min'),
        _min = min,
        _max = max;

  final int _min;
  final int _max;

  @override
  String get name => 'Min $_min und Max $_max Zeichen';

  @override
  bool validate(String value) {
    return (value.length >= _min && value.length < _max) ||
        (value.length > _min && value.length <= _max);
  }
}
