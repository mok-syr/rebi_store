import 'package:get/get.dart';

class MyLocale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {'ar': arabicLang, 'en': englishLang};

  Map<String, String> get arabicLang => {
        'signin': 'تسجيل الدخول',
        'email': 'البريد الإلكتروني',
        'password': 'كلمة المرور',
        'dont_have_account': 'ليس لديك حساب؟',
        'create_account': 'إنشاء حساب',
        'forget_password': 'نسيت كلمة المرور؟',
        'enter_your_email': 'أدخل بريدك الإلكتروني',
        'reset_email_sent': 'تم إرسال البريد',
        'error_occurred': 'حدث خطأ',
        'continue': 'متابعة',
        'language': 'اللغة',
        'darkMode': 'الوضع الليلي',
        'logout': 'تسجيل الخروج',

        'name':'الاسم',
        'have_account':'لديك حساب؟',
        'error_try_again':'حدث خطأ, حاول مجدداً',



        'email_verification':'تأكيد البريد الإلكتروني',
        'email_sent_to':'تم إرسال الرسالة البريدية إلى',
        'verified':'تم التأكيد',
        'resend_email':'إعادة ارسال البريد',

        };

  Map<String, String> get englishLang => {
        'signin': 'Signin',
        'email': 'Email',
        'password': 'Password',
        'dont_have_account': 'Don\'t have an account?',
        'create_account': 'Create account',
        'forget_password': 'Forget Password?',
        'enter_your_email': 'Enter Your Email',
        'reset_email_sent': 'Reset Email Sent',
        'error_occurred': 'Error Occurred',
        'continue': 'Continue',
        'language': 'language',
        'darkMode': 'Dark Mode',
        'logout': 'Logout',

        'name':'Name',
        'have_account':'Have An Account?',
        'error_try_again':'Error, try again',
        'email_verification':'Email Verification',
        'email_sent_to':'Verification Email Sent To',
        'verified':'Verified',
        'resend_email':'Resend Email',

  };
}
