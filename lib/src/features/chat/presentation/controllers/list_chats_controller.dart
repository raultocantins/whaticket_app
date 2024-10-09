import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:whaticket_app/src/features/auth/controllers/auth_controller.dart';
import 'package:whaticket_app/src/models/list_chats_model.dart';
import 'package:whaticket_app/src/services/list_chats_service.dart';

part 'list_chats_controller.g.dart';

class ListChatsController = _ListChatsController with _$ListChatsController;

abstract class _ListChatsController with Store {
  final AuthController _authController;
  final ListChatsService service;
  _ListChatsController(this.service, this._authController);

  @observable
  ListChatsModel listChatsOpen = ListChatsModel();

  @observable
  ListChatsModel listChatsPending = ListChatsModel();

  @observable
  bool isLoading = false;

  @observable
  bool showAll = true;

  @observable
  String searchParam = '';

  @action
  void setListChatsOpen(ListChatsModel value) {
    listChatsOpen = value;
  }

  @action
  void setListChatsPending(ListChatsModel value) {
    listChatsPending = value;
  }

  @action
  void setLoading(bool value) {
    isLoading = value;
  }

  @action
  void setSearchParam(String value, bool isOpen) {
    searchParam = value;
    if (isOpen) {
      getChatsOpen();
    } else {
      getChatsPending();
    }
  }

  @action
  void toggleShowAll(bool value) {
    showAll = value;
  }

  Future<void> getChatsOpen() async {
    setLoading(true);
    try {
      final r = await service.getChats(
          status: 'open',
          queueIds: jsonEncode(_authController.auth?.user?.queues
              ?.map((e) => e.id.toString())
              .toList()),
          showAll: showAll.toString(),
          searchParam: searchParam);
      setListChatsOpen(r);
    } catch (e) {
      print(e);
      //mostrar notificação de erro
    }
    setLoading(false);
  }

  Future<void> getChatsPending() async {
    setLoading(true);
    try {
      final r = await service.getChats(
          status: 'pending',
          queueIds: jsonEncode(_authController.auth?.user?.queues
              ?.map((e) => e.id.toString())
              .toList()),
          showAll: showAll.toString(),
          searchParam: searchParam);
      setListChatsPending(r);
    } catch (e) {
      print(e);
      //mostrar notificação de erro
    }
    setLoading(false);
  }

  void dispose() {
    listChatsOpen = ListChatsModel();
    listChatsPending = ListChatsModel();
    searchParam = '';
  }
}
