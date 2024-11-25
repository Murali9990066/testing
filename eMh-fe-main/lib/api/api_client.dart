import 'dart:async';
import 'dart:io';
import 'package:e_medfile/api/endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_debouncer/flutter_debouncer.dart';

class ApiClient {
  final Map<String, String> headers;
  final Duration debounceDuration;
  final Duration throttleDuration;
  http.Client _client;

  ApiClient({
    required this.headers,
    this.debounceDuration = const Duration(milliseconds: 300),
    this.throttleDuration = const Duration(seconds: 1),
  }) : _client = http.Client();

  Future<http.Response> request(
    Endpoint endpoint, {
    Map<String, dynamic>? body,
    bool debounce = false,
    bool throttle = false,
  }) async {
    String method = endpoint.requestType.name.toLowerCase();

    Future<http.Response> makeRequest() async {
      try {
        switch (method) {
          case 'get':
            Uri url = Uri.parse(endpoint.uri)
                .replace(queryParameters: endpoint.params);
            return await _client
                .get(url, headers: headers)
                .timeout(throttleDuration);
          case 'post':
            Uri url = Uri.parse(endpoint.uri);
            return await _client
                .post(url, headers: headers, body: body)
                .timeout(throttleDuration);
          default:
            throw Exception('Invalid HTTP method');
        }
      } on SocketException catch (e) {
        throw Exception('No Internet connection: $e');
      } on TimeoutException catch (e) {
        throw Exception('The connection has timed out: $e');
      } catch (e) {
        throw Exception('An unknown error occurred: $e');
      }
    }

    if (debounce) {
      // A Completer is used to create a Future that can be completed later.
      // It's useful for asynchronous operations where the result isn't immediately available.
      // Common use cases include:
      // 1. Wrapping callback-based APIs to return Futures
      // 2. Implementing timeouts
      // 3. Coordinating multiple asynchronous operations
      // 4. Creating custom Future-based APIs
      final completer = Completer<http.Response>();
      Debouncer().debounce(
        duration: debounceDuration,
        onDebounce: () async {
          try {
            final response = await makeRequest();
            completer.complete(response);
          } catch (e) {
            completer.completeError(e);
          }
        },
      );
      return completer.future;
    } else if (throttle) {
      final completer = Completer<http.Response>();
      Throttler().throttle(
        duration: throttleDuration,
        onThrottle: () async {
          try {
            final response = await makeRequest();
            completer.complete(response);
          } catch (e) {
            completer.completeError(e);
          }
        },
      );
      return completer.future;
    } else {
      return makeRequest();
    }
  }

  void cancel() {
    _client.close();
    _client = http.Client();
  }
}
