import 'package:flutter/material.dart';
import 'package:whaticket_app/src/core/utils/date_utils.dart';
import 'package:whaticket_app/src/core/utils/navigator_utils.dart';

class ChatsListPage extends StatefulWidget {
  const ChatsListPage({super.key});

  @override
  State<ChatsListPage> createState() => _ChatsListPageState();
}

class _ChatsListPageState extends State<ChatsListPage> {
  int selectedBottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "Conversas",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(130),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: SizedBox(
                          width: 60, height: 60, child: CircleAvatar()),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Pesquisar...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => ChatItemWidget(
            id: index.toString(),
            title: 'Maude Mckinney',
            subtitle: 'Really? That’s great..',
            updatedDate: DateTime.now(),
            profileUrl:
                'https://i.pinimg.com/236x/03/ac/c0/03acc030c6700dfd274d1ef20e70609b.jpg',
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedBottomNavIndex,
          onTap: (index) {
            setState(() {
              selectedBottomNavIndex = index;
            });
          },
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          enableFeedback: false,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.5),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble), label: 'Ínicio'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Configurações'),
          ]),
    );
  }
}

class ChatItemWidget extends StatelessWidget {
  final String id;
  final String title;
  final String subtitle;
  final String profileUrl;
  final DateTime updatedDate;
  const ChatItemWidget(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.profileUrl,
      required this.updatedDate,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => NavigationService.navigateTo('chat', arguments: {
        'id': id,
        'title': title,
        'profileUrl': profileUrl,
      }),
      title: Text(title),
      subtitle: Text(subtitle),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(profileUrl),
      ),
      trailing: Column(
        children: [
          Text(
            UtilsDate.formatToHourMinute(updatedDate),
          )
        ],
      ),
    );
  }
}
