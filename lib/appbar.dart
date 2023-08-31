import 'package:flutter/material.dart';

class AppBarDemo extends StatefulWidget {
  const AppBarDemo({Key? key}) : super(key: key);

  @override
  State<AppBarDemo> createState() => _AppBarDemoState();
}

class _AppBarDemoState extends State<AppBarDemo>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () {},
      ),
      drawer: Drawer(
        width: 300,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountEmail: Text("abc@gmail.com"),
              accountName: Text("abc"),
              currentAccountPicture: CircleAvatar(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const ListTile(
                    leading: Icon(Icons.person_outline),
                    title: Text("Profile"),
                  );
                },
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        // leading: Icon(Icons.menu),
        // leadingWidth: 0,
        // titleSpacing: 0,
        // centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: TabBar(
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 30),
            labelPadding: EdgeInsets.symmetric(vertical: 5),
            controller: tabController,
            tabs: [
              Text("Chat"),
              Text("Status"),
              Text("Calls"),
            ],
          ),
        ),
        title: const Text("WhatsApp"),
        actions: [
          const Icon(Icons.search),
          const SizedBox(width: 10),
          PopupMenuButton(
            position: PopupMenuPosition.over,
            constraints: const BoxConstraints.expand(
              width: 200,
              height: 150,
            ),
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  child: Text("New Group"),
                ),
                const PopupMenuItem(
                  child: Text("New Broadcast"),
                ),
                const PopupMenuItem(
                  child: Text("Linked Device"),
                ),
                const PopupMenuItem(
                  child: Text("Starred Messages"),
                ),
                const PopupMenuItem(
                  child: Text("Settings"),
                ),
              ];
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: TabBarView(
        children: [
          Center(
            child: Text("Chat Screen"),
          ),
          Center(
            child: Text("Status Screen"),
          ),
          Center(
            child: Text("Calls Screen"),
          ),
        ],
        controller: tabController,
      ),
    );
  }
}
