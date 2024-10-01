import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:whaticket_app/src/core/constants/api_url.dart';
import 'package:whaticket_app/src/features/auth/controllers/auth_controller.dart';
import 'package:whaticket_app/src/services/auth_service.dart';

class GetItSetup {
  final getIt = GetIt.instance;

  void setup() {
    getIt.registerLazySingleton<FlutterSecureStorage>(
        () => const FlutterSecureStorage());
    getIt.registerLazySingleton<Dio>(() => Dio(BaseOptions(baseUrl: apiUrl)));
    getIt.registerLazySingleton<AuthController>(
        () => AuthController(Authentication()));
  }
}
