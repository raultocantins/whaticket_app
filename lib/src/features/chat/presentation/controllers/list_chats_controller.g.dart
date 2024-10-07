// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_chats_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListChatsController on _ListChatsController, Store {
  late final _$listChatsOpenAtom =
      Atom(name: '_ListChatsController.listChatsOpen', context: context);

  @override
  ListChatsModel get listChatsOpen {
    _$listChatsOpenAtom.reportRead();
    return super.listChatsOpen;
  }

  @override
  set listChatsOpen(ListChatsModel value) {
    _$listChatsOpenAtom.reportWrite(value, super.listChatsOpen, () {
      super.listChatsOpen = value;
    });
  }

  late final _$listChatsPendingAtom =
      Atom(name: '_ListChatsController.listChatsPending', context: context);

  @override
  ListChatsModel get listChatsPending {
    _$listChatsPendingAtom.reportRead();
    return super.listChatsPending;
  }

  @override
  set listChatsPending(ListChatsModel value) {
    _$listChatsPendingAtom.reportWrite(value, super.listChatsPending, () {
      super.listChatsPending = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ListChatsController.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$_ListChatsControllerActionController =
      ActionController(name: '_ListChatsController', context: context);

  @override
  void setListChatsOpen(ListChatsModel value) {
    final _$actionInfo = _$_ListChatsControllerActionController.startAction(
        name: '_ListChatsController.setListChatsOpen');
    try {
      return super.setListChatsOpen(value);
    } finally {
      _$_ListChatsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListChatsPending(ListChatsModel value) {
    final _$actionInfo = _$_ListChatsControllerActionController.startAction(
        name: '_ListChatsController.setListChatsPending');
    try {
      return super.setListChatsPending(value);
    } finally {
      _$_ListChatsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_ListChatsControllerActionController.startAction(
        name: '_ListChatsController.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_ListChatsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listChatsOpen: ${listChatsOpen},
listChatsPending: ${listChatsPending},
isLoading: ${isLoading}
    ''';
  }
}
