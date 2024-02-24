import 'dart:async';
import 'dart:io';

import 'package:errors/errors.dart';
import 'package:http/http.dart';

import 'api_consts.dart';

class ApiClient {
  final baseUrl = ApiConsts.baseUrl;

  ApiClient({
    required Client client,
  }) : _client = client;

  final Client _client;

  Future<Map<String, String>> _getHeaders() async {
    return {
      'Content-Type': 'application/json',
    };
  }

  Future<Response> get({
    required String endpoint,
    String path = '',
  }) async {
    return _sendRequest(() async {
      final Map<String, String> headers = await _getHeaders();
      final uri = Uri.parse('$baseUrl$endpoint$path');

      final response = await _client.get(uri, headers: headers);
      return response;
    });
  }

  Future<Response> _sendRequest(
    Future<Response> Function() callServer,
  ) async {
    try {
      final response = await callServer();
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw ServerException(
          errorMessage: response.body,
        );
      }

      return response;
    } on TimeoutException {
      throw const ServerException(
          errorMessage: 'Timeout making request to server');
    } on SocketException {
      throw const ServerException(errorMessage: 'No internet');
    } on ServerException catch (e) {
      throw ServerException(errorMessage: e.errorMessage);
    } catch (e) {
      throw const ServerException(errorMessage: 'Unknown Error');
    }
  }
}
