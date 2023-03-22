import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

List<Interceptor> interceptors = [
  InterceptorsWrapper(
    onResponse: (response, handler) {
      if (response.requestOptions.method == HttpMethod.GET) {
        response.data = jsonDecode(response.data as String);
      }
      return handler.next(response);
    },
  ),
  LogInterceptor(responseBody: true),
];
