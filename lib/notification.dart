import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "通知",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: CircleAvatar(
              backgroundImage: AssetImage(
                  '/Users/raizo/AppProjects/twitter_ui/lib/images/rai.jpeg'),
            ),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings_outlined,
                color: Colors.black,
              ),
            ),
          ],
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.black,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            indicatorColor: Colors.blue,
            tabs: <Widget>[
              Tab(text: "すべて"),
              Tab(text: "＠ツイート"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text("すべて"),
            ),
            Center(
              child: Text("＠ツイート"),
            ),
          ],
        ),
      ),
    );
  }
}
