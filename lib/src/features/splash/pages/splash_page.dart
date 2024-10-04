import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:whaticket_app/src/core/utils/navigator_utils.dart';
import 'package:whaticket_app/src/features/auth/controllers/auth_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    checkIsLogged();
    super.initState();
  }

  Future<void> checkIsLogged() async {
    final AuthController authController = GetIt.I.get<AuthController>();
    await authController.verifyAuth();
    if (authController.isLogged) {
      NavigationService.navigateAndReplaceTo('chat_list');
    } else {
      NavigationService.navigateAndReplaceTo('login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
