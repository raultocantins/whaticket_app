import 'package:flutter/material.dart';
import 'package:whaticket_app/src/core/get_it/get_it.dart';
import 'package:whaticket_app/src/core/utils/navigator_utils.dart';
import 'package:whaticket_app/src/features/chat/presentation/pages/chat_page.dart';
import 'package:whaticket_app/src/features/chat/presentation/pages/list_chats_page.dart';
import 'package:whaticket_app/src/features/login/pages/login_page.dart';
import 'package:whaticket_app/src/features/splash/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetItSetup().setup();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
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
