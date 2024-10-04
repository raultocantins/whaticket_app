import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:whaticket_app/src/core/constants/api_url.dart';
import 'package:whaticket_app/src/models/list_chats_model.dart';

class ListChatsService {
  Dio dio;
  FlutterSecureStorage st;

  ListChatsService({required this.dio, required this.st});

  Future<ListChatsModel> getChats(
      {String? searchParam = '',
      String? pageNumber = '1',
      String? status,
      String? date,
      String? showAll,
      String? withUnreadMessages,
      String? queueIds}) async {
    try {
      final response = await dio.get('$apiUrl/tickets', queryParameters: {
        'searchParam': searchParam,
        'pageNumber': pageNumber,
        'status': status,
        'date': date,
        'showAll': showAll,
        'withUnreadMessages': withUnreadMessages,
        'queueIds': queueIds,
      });
      if (response.statusCode == 200) {
        final listChatsModel = ListChatsModel.fromJson(response.data);
        return listChatsModel;
      } else {
        throw Exception('Failed to load chats');
      }
    } catch (e) {
      throw Exception('Failed to load chats: ${e.toString()}');
    }
  }
}
