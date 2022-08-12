import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget searchAppbar() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: <Widget>[
          Container(
            child: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          const Padding(padding: EdgeInsets.only(right: 8)),
          Expanded(
            child: TextField(
              decoration: const InputDecoration.collapsed(
                hintText: 'キーワード検索',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: searchAppbar(),
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
            isScrollable: true,
            indicatorColor: Colors.blue,
            tabs: <Widget>[
              Tab(text: "おすすめ"),
              Tab(text: "トレンド"),
              Tab(text: "ニュース"),
              Tab(text: "スポーツ"),
              Tab(text: "エンターテイメント"),
              Tab(text: "COVID-19"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text("おすすめ"),
            ),
            Center(
              child: Text("トレンド"),
            ),
            Center(
              child: Text("ニュース"),
            ),
            Center(
              child: Text("スポーツ"),
            ),
            Center(
              child: Text("エンターテイメント"),
            ),
            Center(
              child: Text("COVID-19"),
            ),
          ],
        ),
      ),
    );
  }
}
