import 'package:e_medfile/features/local_storage/local_storage.dart';
import 'package:e_medfile/utils/enums/local_storage_key_type.enum.dart';

class AuthService {
  final LocalStorage _local;

  AuthService(this._local);

  // verify otp
  bool verifyOtp({required String contact, required String otp}) {
    return true;
  }

  // logout
  void logout() {
    // _local.clear();
  }

  // language
  getLanguage() => _local.getData(LocalStorageKeyType.language.name) ?? 'en';
  setLanguage(String language) => _local.setData(LocalStorageKeyType.language.name, language);

}
