import 'package:flutter/material.dart';
import 'package:tp_widgets_2/pages/Contact.dart';
import 'package:tp_widgets_2/pages/NewTweet.dart';
import 'package:tp_widgets_2/pages/TweetPage.dart';
import 'package:tp_widgets_2/bo/tweet.dart';

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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: buildAppBar(),
        body: TabBarView(children: [
            pageTweetPage(tweetDB),
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



