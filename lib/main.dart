import 'package:flutter/material.dart';
import 'package:whaticket_app/src/core/utils/navigator_utils.dart';
import 'package:whaticket_app/src/features/chat/presentation/pages/chat_page.dart';
import 'package:whaticket_app/src/features/chat/presentation/pages/chats_list_page.dart';

void main() {
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
      navigatorKey: NavigationService.navigatorKey, // Add this line
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

        return MaterialPageRoute(
          builder: (context) => Container(),
        );
      },
      home: const ChatsListPage(),
    );
  }
}
