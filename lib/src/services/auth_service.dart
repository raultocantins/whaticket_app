import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:whaticket_app/src/core/constants/api_url.dart';
import 'package:whaticket_app/src/models/auth_model.dart';

class Authentication {
  final dio = GetIt.I.get<Dio>();
  final st = GetIt.I.get<FlutterSecureStorage>();
  Future<AuthModel> login(
      {required String email, required String password}) async {
    try {
      final response = await dio.get('$apiUrl/auth/login');
      if (response.statusCode == 200) {
        final authModel = AuthModel.fromJson(response.data);
        await st.write(key: 'token', value: response.data['token']);
        await st.write(key: 'user', value: response.data['user']);
        dio.options.headers['Authorization'] = 'Bearer ${authModel.token}';
        return authModel;
      } else {
        throw Exception('Failed to load chats');
      }
    } catch (e) {
      throw Exception('Failed to load chats: ${e.toString()}');
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
          {'token': jsonDecode(token), 'user': jsonDecode(user)},
        );
        dio.options.headers['Authorization'] = 'Bearer ${jsonDecode(token)}';
        return authModel;
      } else {
        throw Exception('Failed to load chats');
      }
    } catch (e) {
      throw Exception('Failed to load chats: ${e.toString()}');
    }
  }
}
