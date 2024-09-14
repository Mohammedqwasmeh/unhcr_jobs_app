import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:unhcr_jobs_app/core/constant/endpoints.dart';
import 'package:unhcr_jobs_app/core/error/server_failure.dart';
import 'package:unhcr_jobs_app/core/error/success.dart';
import 'package:unhcr_jobs_app/core/util/network_utilities/network_utilities.dart';

class NetworkBase {
  factory NetworkBase() {
    _this ??= NetworkBase._();
    return _this!;
  }

  NetworkBase._();

  static NetworkBase? _this;

  final _baseUrl = AppEndpoints.baseUrl;

  final NetworkUtils _networkUtils = NetworkUtils();

  Future<Either<ServerFailure, Success>> post({
    required String api,
    required dynamic data,
    String? apiKey,
    bool withAuth = false,
    bool isJsonHeader = false,
  }) async {
    final headers = isJsonHeader
        ? _networkUtils.makeJsonHeaders(withAuth: withAuth)
        : _networkUtils.makeHeaders(withAuth: withAuth);
    if (!await _networkUtils.isConnected()) {
      return Left(
        ServerFailure(statusCode: 0, errors: {'message': 'No Network'}),
      );
    }
    if (kDebugMode) {
      print(_baseUrl + api);
      print(data);
    }
    try {
      final result = await http.post(
        Uri.parse(_baseUrl + api),
        headers: withAuth ? await headers : null,
        body: data,
      );

      return _networkUtils.responseHandling(result);
    } catch (e) {
      return Left(
        ServerFailure(statusCode: 0, errors: {'message': e.toString()}),
      );
    }
  }

  Future<Either<ServerFailure, Success>> get({
    required String api,
    bool withAuth = false,
    String? apiKey,
    Map<String, dynamic>? params,
  }) async {
    final headers =
        _networkUtils.makeHeaders(withAuth: withAuth, apiKey: apiKey);
    if (!await _networkUtils.isConnected()) {
      return Left(
        ServerFailure(statusCode: 0, errors: {'message': 'No Network'}),
      );
    }
    if (kDebugMode) {
      print(_baseUrl + api);
      print(params);
      print(headers);
    }
    try {
      final uri = Uri.parse(_baseUrl + api).replace(queryParameters: params);
      final result = await http.get(
        uri,
        headers: await headers,
      );
      return _networkUtils.responseHandling(result);
    } catch (e) {
      return Left(
        ServerFailure(statusCode: 0, errors: {'message': e.toString()}),
      );
    }
  }
}
