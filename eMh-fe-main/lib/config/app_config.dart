import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static late String baseUrl;
  static late String apiVersion;
  static late bool enableLogging;
  static late bool enablePrint;
  static late bool debugMode;
  static late String appName;

  static Future<void> initialize() async {
    // The .env file is already loaded in the environment-specific main files
    // So we don't need to load it again here

    baseUrl = dotenv.env['API_URL'] ?? '';
    apiVersion = dotenv.env['API_VERSION'] ?? '';
    enableLogging = dotenv.env['ENABLE_LOGGING']?.toLowerCase() == 'true';
    enablePrint = dotenv.env['ENABLE_PRINT']?.toLowerCase() == 'true';
    debugMode = dotenv.env['DEBUG_MODE']?.toLowerCase() == 'true';
    appName = dotenv.env['APP_NAME'] ?? '';
  }
}