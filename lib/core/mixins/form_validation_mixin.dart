import 'dart:async';
import 'package:flutter/material.dart';
import '../constants/app_strings.dart';
import '../extensions/string_extensions.dart';

mixin FormValidationMixin<T extends StatefulWidget> on State<T> {
  final Map<String, String?> _errors = {};
  final Map<String, bool> _touched = {};
  final Map<String, Timer?> _validationTimers = {};
  
  bool get isFormValid => _errors.values.every((error) => error == null);
  
  String? getError(String fieldName) => _errors[fieldName];
  
  bool isFieldTouched(String fieldName) => _touched[fieldName] ?? false;
  
  void touchField(String fieldName) {
    _touched[fieldName] = true;
  }
  
  void validateFieldWithTimer(String fieldName, String? value, List<ValidationRule> rules) {
    _validationTimers[fieldName]?.cancel();
    
    _validationTimers[fieldName] = Timer(const Duration(milliseconds: 500), () {
      if (_touched[fieldName] == true) {
        validateField(fieldName, value, rules);
      }
    });
  }
  
  void validateField(String fieldName, String? value, List<ValidationRule> rules) {
    String? error;
    
    for (final rule in rules) {
      error = rule.validate(value);
      if (error != null) break;
    }
    
    if (_errors[fieldName] != error) {
      setState(() {
        _errors[fieldName] = error;
      });
    }
  }
  
  void validateAllFields(Map<String, ValidationConfig> configs) {
    for (final entry in configs.entries) {
      final fieldName = entry.key;
      final config = entry.value;
      touchField(fieldName);
      validateField(fieldName, config.controller.text, config.rules);
    }
  }
  
  void clearErrors() {
    for (final timer in _validationTimers.values) {
      timer?.cancel();
    }
    _validationTimers.clear();
    
    setState(() {
      _errors.clear();
      _touched.clear();
    });
  }
  
  @override
  void dispose() {
    for (final timer in _validationTimers.values) {
      timer?.cancel();
    }
    super.dispose();
  }
}

class ValidationConfig {
  final TextEditingController controller;
  final List<ValidationRule> rules;
  
  ValidationConfig({
    required this.controller,
    required this.rules,
  });
}

abstract class ValidationRule {
  String? validate(String? value);
}

class RequiredRule extends ValidationRule {
  final String message;
  
  RequiredRule(this.message);
  
  @override
  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    return null;
  }
}

class EmailRule extends ValidationRule {
  final String message;
  
  EmailRule(this.message);
  
  @override
  String? validate(String? value) {
    if (value != null && value.isNotEmpty && !value.isEmail) {
      return message;
    }
    return null;
  }
}

class MinLengthRule extends ValidationRule {
  final int minLength;
  final String message;
  
  MinLengthRule(this.minLength, this.message);
  
  @override
  String? validate(String? value) {
    if (value != null && value.isNotEmpty && value.length < minLength) {
      return message;
    }
    return null;
  }
}

class MatchRule extends ValidationRule {
  final String otherValue;
  final String message;
  
  MatchRule(this.otherValue, this.message);
  
  @override
  String? validate(String? value) {
    if (value != null && value.isNotEmpty && value != otherValue) {
      return message;
    }
    return null;
  }
}

// Validation rule factory
class ValidationRules {
  static RequiredRule required(String message) => RequiredRule(message);
  static EmailRule email(String message) => EmailRule(message);
  static MinLengthRule minLength(int length, String message) => MinLengthRule(length, message);
  static MatchRule match(String otherValue, String message) => MatchRule(otherValue, message);
  
  static List<ValidationRule> get nameRules => [
    required(AppStrings.pleaseEnterYourName),
    minLength(2, AppStrings.nameMustBeAtLeast2Characters),
  ];
  
  static List<ValidationRule> get emailRules => [
    required(AppStrings.pleaseEnterYourEmail),
    email(AppStrings.pleaseEnterValidEmail),
  ];
  
  static List<ValidationRule> get passwordRules => [
    required(AppStrings.pleaseEnterYourPassword),
    minLength(6, AppStrings.passwordMustBeAtLeast6Characters),
  ];
  
  static List<ValidationRule> confirmPasswordRules(String password) => [
    required(AppStrings.pleaseConfirmYourPassword),
    match(password, AppStrings.passwordsDoNotMatch),
  ];
} 