import 'package:e_medfile/features/auth/services/auth_service.dart';
import 'package:e_medfile/features/language/language.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  final AuthService _auth;
  final selectedLanguage = RxnString('');

  LanguageController(this._auth);

  @override
  void onInit() {
    super.onInit();
    selectedLanguage.value = getSelectedLanguage();
  }

  final List<Language> languages = RxList<Language>([
    Language('English', 'en'),
    Language('Telugu', 'te'),
    Language('Hindi', 'hi'),
  ]);

  void selectLanguage(String language) {
    _auth.setLanguage(language);
    selectedLanguage.value = language;
  }

  String getSelectedLanguage() {
    return _auth.getLanguage();
  }
}

