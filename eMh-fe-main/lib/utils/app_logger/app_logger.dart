import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:developer' as developer;

class AppLogger {
  static void log(String message) {
    final bool enableLogging = dotenv.env['ENABLE_LOGGING']?.toLowerCase() == 'true';
    final bool enablePrint = dotenv.env['ENABLE_PRINT']?.toLowerCase() == 'true';
    
    if (enableLogging) {
      developer.log('[LOG] $message');
    }
    if(enablePrint){
      print('[PRINT] $message');
    }
  }
}
