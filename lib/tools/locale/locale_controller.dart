import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../main.dart';

class MyLocaleController extends GetxController {
  Locale initLocale =
      box.read('langCode') == 'ar' ? const Locale('ar') : const Locale('en');

  String? selectedLang ;




  @override
  void onReady() {
    updateSelectedLang(initLocale.languageCode);
  }

  updateSelectedLang(String languageCode){
    if(languageCode == 'ar'){
      selectedLang = 'العربية';
    }
    if(languageCode == 'en'){
      selectedLang = 'English';
    }
    update();
  }
  void changeLocale(String languageCode) {
    updateSelectedLang(languageCode);
    Locale locale = Locale(languageCode);
    box.write('langCode', languageCode);
    Get.updateLocale(locale);
  }
}
