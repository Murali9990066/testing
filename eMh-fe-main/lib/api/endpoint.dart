import 'package:e_medfile/utils/enums/request_type.enum.dart';

class Endpoint {
  final String uri;
  final Map<String, dynamic> params;
  final RequestType requestType;
  final bool requiresAuth;
  final Map<String, dynamic> body;
  final List<String> files;

  Endpoint({
    required this.uri,
    required this.requestType,
    this.params = const {},
    this.requiresAuth = false,
    this.body = const {},
    this.files = const [],
  });
}
