/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twitter_ui/tweet.dart';

class MainModel extends ChangeNotifier {
  List<Tweet> tweets = [];

  Future<void> fetchTweets() async {
    final docs = await FirebaseFirestore.instance
        .collection('user')
        .get();
    final tweets = docs.docs
        .map((doc) => Tweet(doc))
        .toList();
    this.tweets = tweets;
    notifyListeners();
  }
}*/
