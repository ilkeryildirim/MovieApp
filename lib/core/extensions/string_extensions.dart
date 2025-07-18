extension StringExtensions on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  bool get isNotNullOrEmpty => !isNullOrEmpty;
  
  String get orEmpty => this ?? '';
  
  String? get nullIfEmpty {
    if (isNullOrEmpty) return null;
    return this;
  }
  
  bool get isEmail {
    if (isNullOrEmpty) return false;
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(this!);
  }
  
  bool get isPhone {
    if (isNullOrEmpty) return false;
    final phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
    return phoneRegex.hasMatch(this!.replaceAll(RegExp(r'[\s-()]'), ''));
  }
  
  bool get isUrl {
    if (isNullOrEmpty) return false;
    final urlRegex = RegExp(
      r'^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$',
    );
    return urlRegex.hasMatch(this!);
  }
  
  String? get capitalize {
    if (isNullOrEmpty) return this;
    return '${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}';
  }
  
  String? get capitalizeWords {
    if (isNullOrEmpty) return this;
    return this!.split(' ').map((word) => word.capitalize).join(' ');
  }
  
  String? removeWhitespace() {
    if (isNullOrEmpty) return this;
    return this!.replaceAll(RegExp(r'\s+'), '');
  }
  
  String? truncate(int maxLength, {String suffix = '...'}) {
    if (isNullOrEmpty) return this;
    if (this!.length <= maxLength) return this;
    return '${this!.substring(0, maxLength)}$suffix';
  }
  
  int? toIntOrNull() {
    if (isNullOrEmpty) return null;
    return int.tryParse(this!);
  }
  
  double? toDoubleOrNull() {
    if (isNullOrEmpty) return null;
    return double.tryParse(this!);
  }
  
  bool? toBoolOrNull() {
    if (isNullOrEmpty) return null;
    final lower = this!.toLowerCase();
    if (lower == 'true' || lower == '1' || lower == 'yes') return true;
    if (lower == 'false' || lower == '0' || lower == 'no') return false;
    return null;
  }
} 