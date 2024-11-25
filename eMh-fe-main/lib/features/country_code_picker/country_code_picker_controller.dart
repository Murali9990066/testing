import 'package:e_medfile/features/country_code_picker/country_code.enum.dart';
import 'package:e_medfile/utils/app_logger/app_logger.dart';
import 'package:get/get.dart';

class CountryCodePickerController extends GetxController {
  RxList<CountryCode> countryCodes = <CountryCode>[].obs;
  late Rx<CountryCode> pickedCountryCode = Rx<CountryCode>(CountryCode.india);

  @override
  void onInit() {
    super.onInit();
    countryCodes.value = <CountryCode>[...CountryCode.values];
    AppLogger.log('countryCodes: ${countryCodes.map((e) => e.name).toList()}');
  }

  void pickCountryCode(CountryCode countryCode) {
    pickedCountryCode.value = countryCode;
  }
}
