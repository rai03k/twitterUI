import 'package:flutter/material.dart';
import 'package:twitter_ui/model/article_model.dart';
import 'package:twitter_ui/services/api_service.dart';

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

  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
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
        body: FutureBuilder(
          future: client.getArticle(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData) {
              List<Article>? articles = snapshot.data;
              return ListView.builder(
                  itemCount: articles!.length,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Stack(
                        alignment: AlignmentDirectional.bottomStart,
                        children: [
                          Container(
                            height: deviceHeight * 0.3,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              image: DecorationImage(
                                image: NetworkImage(
                                    articles[0].urlToImage.toString()),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              articles[0].title.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      );
                    }
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: ListTile(
                            title: Text(articles[index].title.toString()),
                          ),
                        ),
                        Divider(),
                      ],
                    );
                  });
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
