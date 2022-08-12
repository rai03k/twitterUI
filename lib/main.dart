import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_ui/dm.dart';
import 'package:twitter_ui/notification.dart';
import 'package:twitter_ui/search.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TwitterUI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTap,
        iconSize: 30,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'home',
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_sharp),
              label: 'search',
              activeIcon: Icon(Icons.search)),
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
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static List<String> tweets = [];
  static List<String> reversetweets = [];
  static List dates = [];
  static List reversedates = [];
  var now = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FaIcon(
          FontAwesomeIcons.twitter,
          color: Colors.blue,
          size: 28,
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
              Icons.auto_awesome_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(0),
        child: ListView.builder(
          itemCount: tweets.length,
          itemBuilder: (context, index) {
            final tweet = reversetweets[index];
            final date = reversedates[index];
            return Container(
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      twitterAvater(),
                      tweetBody(tweet, date),
                    ],
                  ),
                  Divider(),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newtweet = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return EditTweet();
              },
            ),
          );
          if (newtweet != null) {
            setState(() {
              tweets.add(newtweet.toString());
              now = DateTime.now();
              dates.add(now);
              reversetweets = tweets.reversed.toList();
              reversedates = dates.reversed.toList();
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget twitterAvater() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      width: 56,
      height: 56,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
                '/Users/raizo/AppProjects/twitter_ui/lib/images/rai.jpeg')),
      ),
    );
  }

  Widget tweetBody(tweet, date) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          tweetHeader(date),
          tweetText(tweet),
          tweetIcon(),
        ],
      ),
    );
  }

  Widget tweetHeader(date) {
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
          '@RaiAppDev・',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        tweetTime(date),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_horiz,
          ),
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget tweetTime(date) {
    var n = DateTime.now();
    var d = n.difference(date);
    if (d.inSeconds <= 60) {
      return tT(d.inSeconds.toString(), "秒");
    } else if (d.inMinutes <= 60) {
      return tT(d.inMinutes.toString(), "分");
    } else if (d.inHours < 24) {
      return tT(d.inHours.toString(), "時間");
    } else {
      return tT(d.inDays.toString(), "日");
    }
  }

  Widget tT(time, tanni) {
    return Text(
      "$time" + tanni,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 16,
      ),
    );
  }

  Widget tweetText(tweet) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(right: 10.0),
          child: Text(
            tweet,
            style: TextStyle(fontSize: 16, overflow: TextOverflow.clip),
          ),
        ),
      ],
    );
  }

  Widget tweetIcon() {
    return Container(
      margin: EdgeInsets.only(top: 10, right: 62, bottom: 10),
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

  Widget tweetIconButton(icon) {
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

class EditTweet extends StatefulWidget {
  const EditTweet({Key? key}) : super(key: key);

  @override
  State<EditTweet> createState() => _EditTweetState();
}

class _EditTweetState extends State<EditTweet> {
  var a = _HomeScreenState();
  String _text = "";
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<void> addFirestoreUser() {
    return users
        .add({
          'name': "Rai",
          'tweet': _text,
          'date': DateTime.now(),
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            editAppbar(context),
            editTweet(),
          ],
        ),
      ),
    );
  }

  Widget editAppbar(context) {
    return Container(
      padding: EdgeInsets.only(top: 48.0, left: 12.0, right: 12.0),
      child: Row(
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'キャンセル',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          Spacer(),
          Container(
            child: ElevatedButton(
              onPressed: () {
                addFirestoreUser();
                Navigator.of(context).pop(_text);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                elevation: 0,
                shape: StadiumBorder(),
              ),
              child: const Text(
                'ツイートする',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget editTweet() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        a.twitterAvater(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 10.0, right: 5.0),
            child: TextField(
              onChanged: (String value) {
                setState(() {
                  _text = value;
                });
              },
              autofocus: true,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'いまどうしてる？',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
