import 'package:e_medfile/api/endpoint.dart';
import 'package:e_medfile/config/app_config.dart';
import 'package:e_medfile/utils/enums/request_type.enum.dart';

class Endpoints {
  static String baseUrl = '${AppConfig.baseUrl}${AppConfig.apiVersion}';

  static Endpoint login() => Endpoint(
      uri: '$baseUrl/login',
      requestType: RequestType.post,
    );
}



