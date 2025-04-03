import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tp_widgets_2/bo/tweet.dart';

import '../../bo/tweetLong.dart';
import '../../widgets/customWidgets.dart';
import 'package:http/http.dart' as http;


Widget pageTweetLongPage(Future<List<TweetLong>> tweetDB, BuildContext context){


  // ListView is scrollable, Column isn't
  return Column(
    children: [
      Expanded(
        child: ListView(
          children: [
            myHeader(),
            FutureBuilder<List<TweetLong>>(
                future: tweetDB,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                        children: myAllTweetLongs(snapshot.data!, context));
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                }
            )
          ],
        ),
      ),
    ],
  );


}