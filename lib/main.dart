import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tp_widgets_2/pages/HomePage_Tabs/AllTweetLongsPage.dart';
import 'package:tp_widgets_2/pages/HomePage_Tabs/Contact.dart';
import 'package:tp_widgets_2/pages/HomePage_Tabs/NewTweet.dart';
import 'package:tp_widgets_2/pages/HomePage_Tabs/AllTweetsPage.dart';
import 'package:tp_widgets_2/bo/tweet.dart';
import 'package:tp_widgets_2/pages/TweetPage.dart';

import 'bo/tweetLong.dart';
import 'widgets/customWidgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      initialRoute: '/',
      routes: {
        // we don't define '/' because of the 'home' parameter below
        '/tweet': (context) => const TweetPage(),
      },
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Tweet> tweetDB = [
    Tweet('Author 1', 'Content 1', DateTime.now()),
    Tweet('Author 2', 'Content 2', DateTime.now()),
    Tweet('Author 3', 'Content 3', DateTime.now())
  ];

  late Future<List<TweetLong>> tweetAPI;

  Future<List<TweetLong>> callAPI() async {
    const url = 'https://raw.githubusercontent.com/Chocolaterie/EniWebService/main/api/tweets.json';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var tweetList = TweetLong.fromJsonList(jsonDecode(response.body) as List<dynamic>);
      // replaceTweetDB(tweetList);
      return tweetList;
    } else {
      throw Exception('API did not return 200');
    }
  }

  @override
  void initState() {
    super.initState();
    tweetAPI = callAPI();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: buildAppBar(),
        body: TabBarView(children: [
            // pageTweetPage(tweetDB, context),
            pageTweetLongPage(tweetAPI, context),
            pageNewTweet(addTweet: addNewTweet),
            pageContact()
          ]),
        bottomNavigationBar: myBottomBar(),
      ),
    );
  }

  AppBar buildAppBar(){
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(widget.title), elevation: 5, shadowColor: Colors.black,
      bottom: TabBar(tabs: [
        Tab(icon: Icon(Icons.cloud_circle_outlined), text: 'All tweets'),
        Tab(icon: Icon(Icons.streetview_outlined), text: 'New tweet'),
        Tab(icon: Icon(Icons.animation_outlined), text: '3rd page'),
      ]),
    );
  }

  addNewTweet(Tweet tweet){
    setState(() {
      tweetDB.add(tweet);
    });
  }


}



