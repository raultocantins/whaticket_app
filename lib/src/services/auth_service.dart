import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:whaticket_app/src/core/constants/api_url.dart';
import 'package:whaticket_app/src/models/auth_model.dart';

class Authentication {
  Dio dio;
  FlutterSecureStorage st;

  Authentication({required this.dio, required this.st});

  Future<AuthModel> login(
      {required String email, required String password}) async {
    try {
      final response = await dio.post('$apiUrl/auth/login', data: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        final authModel = AuthModel.fromJson(response.data);
        await st.write(key: 'token', value: response.data['token']);
        await st.write(key: 'user', value: jsonEncode(response.data['user']));
        await st.write(
            key: 'jrt',
            value: response.headers['set-cookie']!.first.split(';')[0]);
        dio.options.headers['Authorization'] = 'Bearer ${authModel.token}';
        return authModel;
      } else {
        throw Exception('Failed to authentication');
      }
    } catch (e) {
      throw Exception('Failed to authentication: ${e.toString()}');
    }
  }

  Future<AuthModel> verifyAuth() async {
    try {
      final token = await st.read(key: 'token');
      final user = await st.read(
        key: 'user',
      );
      if (token != null && user != null) {
        final authModel = AuthModel.fromJson(
          {'token': token, 'user': jsonDecode(user)},
        );
        dio.options.headers['Authorization'] = 'Bearer $token';
        return authModel;
      } else {
        throw Exception('Failed to authentication');
      }
    } catch (e) {
      throw Exception('Failed to authentication: ${e.toString()}');
    }
  }
}
