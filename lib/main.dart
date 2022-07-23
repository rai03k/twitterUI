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
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Container();
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

