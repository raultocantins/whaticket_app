import 'package:mobx/mobx.dart';
import 'package:whaticket_app/src/models/list_chats_model.dart';
import 'package:whaticket_app/src/services/list_chats_service.dart';

part 'list_chats_controller.g.dart';

class ListChatsController = _ListChatsController with _$ListChatsController;

abstract class _ListChatsController with Store {
  final ListChatsService service;
  _ListChatsController(this.service);

  @observable
  ListChatsModel listChatsOpen = ListChatsModel();

  @observable
  ListChatsModel listChatsPending = ListChatsModel();

  @observable
  bool isLoading = false;

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

  Future<void> getChatsOpen() async {
    setLoading(true);
    try {
      final r = await service.getChats();
      setListChatsOpen(r);
    } catch (e) {
      // print(e);
      //mostrar notificação de erro
    }
    setLoading(false);
  }

  Future<void> getChatsPending() async {
    setLoading(true);
    try {
      final r = await service.getChats();
      setListChatsPending(r);
    } catch (e) {
      // print(e);
      //mostrar notificação de erro
    }
    setLoading(false);
  }

  void dispose() {
    listChatsOpen = ListChatsModel();
    listChatsPending = ListChatsModel();
  }
}
