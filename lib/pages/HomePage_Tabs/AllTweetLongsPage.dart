import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tp_widgets_2/bo/tweet.dart';

import '../../bo/tweetLong.dart';
import '../../widgets/customWidgets.dart';
import 'package:http/http.dart' as http;


Widget pageTweetLongPage(List<TweetLong> tweetDB, BuildContext context, Function(List<TweetLong> tweetListAPI) replaceTweetDB){

  callAPI() async {
    const url = 'https://raw.githubusercontent.com/Chocolaterie/EniWebService/main/api/tweets.json';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // print(jsonDecode(response.body) as List<dynamic>);
      var tweetList = TweetLong.fromJsonList(jsonDecode(response.body) as List<dynamic>);
      replaceTweetDB(tweetList);
    } else {
      throw Exception('API did not return 200');
    }
  }

  // ListView is scrollable, Column isn't
  return Column(
    children: [
      ElevatedButton(onPressed: callAPI, child: Text('Call API')),
      Expanded(
        child: ListView(
          children: [
            myHeader(),
            Column(children: myAllTweetLongs(tweetDB, context)),
          ],
        ),
      ),
    ],
  );


}