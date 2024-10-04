import 'package:mobx/mobx.dart';
import 'package:whaticket_app/src/models/list_chats_model.dart';
import 'package:whaticket_app/src/services/list_chats_service.dart';

part 'list_chats_controller.g.dart';

class ListChatsController = _ListChatsController with _$ListChatsController;

abstract class _ListChatsController with Store {
  final ListChatsService service;
  _ListChatsController(this.service);

  @observable
  ListChatsModel listChats = ListChatsModel();

  @observable
  bool isLoading = false;

  @action
  void setListChats(ListChatsModel value) {
    listChats = value;
  }

  @action
  void setLoading(bool value) {
    isLoading = value;
  }

  Future<void> getChats() async {
    setLoading(true);
    try {
      final r = await service.getChats();
      setListChats(r);
    } catch (e) {
      // print(e);
      //mostrar notificação de erro
    }
    setLoading(false);
  }
}
