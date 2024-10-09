import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:whaticket_app/src/core/constants/api_url.dart';
import 'package:whaticket_app/src/features/auth/controllers/auth_controller.dart';
import 'package:whaticket_app/src/features/chat/presentation/controllers/list_chats_controller.dart';
import 'package:whaticket_app/src/services/auth_service.dart';
import 'package:whaticket_app/src/services/list_chats_service.dart';
import 'package:dio/dio.dart' as dio_options;

class GetItSetup {
  final getIt = GetIt.instance;

  void setup() {
    clientHttp();
    services();
    controllers();
  }

  void services() {
    getIt.registerLazySingleton<Authentication>(
        () => Authentication(dio: getIt(), st: getIt()));
    getIt.registerLazySingleton<ListChatsService>(
        () => ListChatsService(dio: getIt(), st: getIt()));
  }

  void controllers() {
    getIt.registerLazySingleton<AuthController>(() => AuthController(getIt()));
    getIt.registerLazySingleton<ListChatsController>(
        () => ListChatsController(getIt(), getIt()));
  }

  void clientHttp() async {
    final dio = Dio(BaseOptions(
      baseUrl: apiUrl,
      validateStatus: (status) => status! < 500,
    ));
    const st = FlutterSecureStorage();

    dio.interceptors.add(InterceptorsWrapper(
      onResponse: (response, handler) async {
        final originalRequest = response.requestOptions;
        if (response.statusCode == 403 &&
            !(originalRequest.extra['retry'] ?? false)) {
          originalRequest.extra['retry'] = true;
          try {
            final jrtCookie = await st.read(key: 'jrt');
            final refreshResponse = await dio.post(
              '/auth/refresh_token',
              options: dio_options.Options(
                headers: {
                  'Cookie': jrtCookie,
                },
              ),
            );
            if (refreshResponse.statusCode == 200) {
              final data = refreshResponse.data;
              final newToken = data['token'];
              await st.write(key: 'token', value: newToken);
              dio.options.headers['Authorization'] = 'Bearer $newToken';
              return handler.resolve(await dio.fetch(originalRequest));
            } else {
              throw Exception();
            }
          } catch (e) {
            await st.delete(key: 'token');
            await st.delete(key: 'user');
            await st.delete(key: 'jrt');
            dio.options.headers.remove('Authorization');
            getIt<AuthController>().setAuth(null);
          }
        } else if (response.statusCode == 401) {
          await st.delete(key: 'token');
          await st.delete(key: 'user');
          dio.options.headers.remove('Authorization');
          getIt<AuthController>().setAuth(null);
        }
        return handler.next(response);
      },
    ));
    getIt.registerLazySingleton<FlutterSecureStorage>(() => st);
    getIt.registerLazySingleton<Dio>(() => dio);
  }
}
