class CustomValidators {
  static String? required(String? value, {String? message}) {
    if (value == null || value.isEmpty) {
      return message ?? 'هذا الحقل مطلوب';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    }

    final emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$', 
      caseSensitive: false,
    );

    if (!emailRegex.hasMatch(value)) {
      return 'بريد إلكتروني غير صحيح';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }

    if (value.length < 6) {
      return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'يجب أن تحتوي على حرف كبير واحد على الأقل';
    }

    return null;
  }

  static String? confirmPassword(String? value, String password) {
    if (value != password) {
      return 'كلمة المرور غير متطابقة';
    }
    return null;
  }
}
