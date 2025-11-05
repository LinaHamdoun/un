class CustomValidators {
  static String? required(String? value, {String? message}) {
    if (value == null || value.isEmpty) {
      return message ?? 'هذا الحقل مطلوب';
    }
    return null;
  }

  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'الاسم مطلوب';
    }

    final nameRegex = RegExp(r'^[\u0600-\u06FFa-zA-Z\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'الاسم يجب أن يحتوي على أحرف فقط';
    }

    if (value.trim().split(' ').length < 2) {
      return 'الرجاء كتابة الاسم الكامل (الاسم والكنية)';
    }

    if (value.trim().length > 40) {
      return 'الاسم طويل جدًا، الرجاء إدخال اسم أقصر';
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
