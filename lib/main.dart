import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:whaticket_app/src/core/get_it/get_it.dart';
import 'package:whaticket_app/src/core/utils/navigator_utils.dart';
import 'package:whaticket_app/src/features/auth/controllers/auth_controller.dart';
import 'package:whaticket_app/src/features/chat/presentation/pages/chat_page.dart';
import 'package:whaticket_app/src/features/chat/presentation/pages/list_chats_page.dart';
import 'package:whaticket_app/src/features/login/pages/login_page.dart';
import 'package:whaticket_app/src/features/splash/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetItSetup().setup();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AuthController _authController = GetIt.I.get<AuthController>();
  late ReactionDisposer _authReaction;

  @override
  void initState() {
    super.initState();
    _authReaction = reaction((_) => _authController.isLogged, (isLogged) {
      if (!isLogged) {
        NavigationService.navigateAndReplaceTo('login');
      }
    });
  }

  @override
  void dispose() {
    _authReaction();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whaticket App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 90, 41, 188)),
        useMaterial3: true,
      ),
      navigatorKey: NavigationService.navigatorKey,
      onGenerateRoute: (settings) {
        final args = settings.arguments as Map<String, dynamic>?;
        if (settings.name == 'chat') {
          return MaterialPageRoute(
            builder: (context) => ChatPage(
              id: args?['id'],
              title: args?['title'],
              profileUrl: args?['profileUrl'],
            ),
          );
        }
        if (settings.name == 'chat_list') {
          return MaterialPageRoute(
            builder: (context) => const ChatsListPage(),
          );
        }

        if (settings.name == 'login') {
          return MaterialPageRoute(
            builder: (context) => const LoginPage(),
          );
        }

        return MaterialPageRoute(
          builder: (context) => Container(),
        );
      },
      home: const SplashPage(),
    );
  }
}
