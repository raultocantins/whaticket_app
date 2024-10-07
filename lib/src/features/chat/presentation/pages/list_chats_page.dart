import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:whaticket_app/src/core/utils/date_utils.dart';
import 'package:whaticket_app/src/core/utils/navigator_utils.dart';
import 'package:whaticket_app/src/features/chat/presentation/controllers/list_chats_controller.dart';

class ChatsListPage extends StatefulWidget {
  const ChatsListPage({super.key});

  @override
  State<ChatsListPage> createState() => _ChatsListPageState();
}

class _ChatsListPageState extends State<ChatsListPage>
    with TickerProviderStateMixin {
  ListChatsController? _controller;
  TabController? _tabController;
  int selectedBottomNavIndex = 0;

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    _controller = GetIt.I.get<ListChatsController>();
    _controller?.getChatsOpen();
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

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
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
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
      body: Observer(builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
          child: Column(
            children: [
              TabBar(
                controller: _tabController,
                onTap: (value) => value == 0
                    ? _controller?.getChatsOpen()
                    : _controller?.getChatsPending(),
                tabs: [
                  Tab(
                    text: 'Atendendo',
                    icon: Badge.count(
                      count: _controller?.listChatsOpen.tickets?.length ?? 0,
                      child: const Icon(Icons.person_outline),
                    ),
                  ),
                  Tab(
                    text: 'Aguardando',
                    icon: Badge.count(
                      count: _controller?.listChatsPending.tickets?.length ?? 0,
                      child: const Icon(Icons.inbox),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              (_controller?.isLoading ?? false)
                  ? const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: _tabController?.index == 0
                            ? _controller?.listChatsOpen.tickets?.length ?? 0
                            : _controller?.listChatsPending.tickets?.length ??
                                0,
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
            ],
          ),
        );
      }),
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
