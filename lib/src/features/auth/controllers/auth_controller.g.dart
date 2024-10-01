// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthController on _AuthController, Store {
  late final _$authAtom = Atom(name: '_AuthController.auth', context: context);

  @override
  AuthModel get auth {
    _$authAtom.reportRead();
    return super.auth;
  }

  @override
  set auth(AuthModel value) {
    _$authAtom.reportWrite(value, super.auth, () {
      super.auth = value;
    });
  }

  late final _$_AuthControllerActionController =
      ActionController(name: '_AuthController', context: context);

  @override
  void setAuth(AuthModel value) {
    final _$actionInfo = _$_AuthControllerActionController.startAction(
        name: '_AuthController.setAuth');
    try {
      return super.setAuth(value);
    } finally {
      _$_AuthControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
auth: ${auth}
    ''';
  }
}
