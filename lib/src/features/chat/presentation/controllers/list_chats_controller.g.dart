// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_chats_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListChatsController on _ListChatsController, Store {
  late final _$listChatsAtom =
      Atom(name: '_ListChatsController.listChats', context: context);

  @override
  ListChatsModel get listChats {
    _$listChatsAtom.reportRead();
    return super.listChats;
  }

  @override
  set listChats(ListChatsModel value) {
    _$listChatsAtom.reportWrite(value, super.listChats, () {
      super.listChats = value;
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
  void setListChats(ListChatsModel value) {
    final _$actionInfo = _$_ListChatsControllerActionController.startAction(
        name: '_ListChatsController.setListChats');
    try {
      return super.setListChats(value);
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
listChats: ${listChats},
isLoading: ${isLoading}
    ''';
  }
}
