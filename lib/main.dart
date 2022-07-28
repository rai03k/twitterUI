import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TwitterUI',
      home: TwitterUI(),
    );
  }
}

class TwitterUI extends StatefulWidget {
  const TwitterUI({Key? key}) : super(key: key);

  @override
  State<TwitterUI> createState() => _TwitterUIState();
}

class _TwitterUIState extends State<TwitterUI> {
  static final List<Widget> _screen = [
    HomeScreen(),
    SearchScreen(),
    NotificationScreen(),
    DmScreen()
  ];
  int _selectedIndex = 0;

  @override
  void _onTap(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('ホーム'),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: _screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTap,
        iconSize: 30,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const<BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'home',
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_sharp),
            label: 'search',
            activeIcon: Icon(Icons.search)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none_sharp),
            label: 'tuuti',
            activeIcon: Icon(Icons.notifications),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline_sharp),
            label: 'dm',
            activeIcon: Icon(Icons.mail),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  List<String> text = [
    "mainAxisAlignmentやcrossAxisAlignmentについて詳しく学習できた",
    "Flutter楽しい"
  ];

  @override
  Widget build(BuildContext context){
    return ListView(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            twitterAvater(),
            tweetBody(text[0]),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            twitterAvater(),
            tweetBody(text[1]),
          ],
        ),
      ],
    );
  }

  Widget twitterAvater() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(10.0),
          width: 52,
          height: 52,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('/Users/raizo/AppProjects/twitter_ui/lib/images/rai.jpeg')
            )
          ),
        ),
      ],
    );
  }

  Widget tweetBody(tweet) {
    return Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            tweetHeader(),
            tweetText(tweet),
            tweetIcon(),
          ],
        ),
    );
  }

  Widget tweetHeader(){
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 5.0),
          child: Text(
            'Rai',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Text(
          '@RaiAppDev・5時間',
          style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        Spacer(),
        IconButton(
          onPressed: (){},
          icon: Icon(
            Icons.more_horiz,
          ),
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget tweetText(tweet){
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(right: 10.0),
          child: Text(
            tweet,
            style: TextStyle(
                fontSize: 16,
                overflow: TextOverflow.clip
            ),
          ),
        ),
      ],
    );
  }

  Widget tweetIcon() {
    return Container(
      margin: EdgeInsets.only(top: 10,right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          tweetIconButton(Icons.chat_bubble_outline),
          tweetIconButton(Icons.cached),
          tweetIconButton(Icons.favorite_border),
          tweetIconButton(Icons.ios_share),
        ],
      ),
    );
  }

  Widget tweetIconButton(icon){
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.grey,
          size: 20,
        ),
      ],
    );
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Container();
  }
}

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Container();
  }
}class DmScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Container();
  }
}

