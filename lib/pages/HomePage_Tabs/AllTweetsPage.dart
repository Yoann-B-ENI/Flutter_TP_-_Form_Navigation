import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tp_widgets_2/bo/tweet.dart';

import '../../bo/tweetLong.dart';
import '../../widgets/customWidgets.dart';
import 'package:http/http.dart' as http;


Widget pageTweetPage(List<Tweet> tweetDB, BuildContext context){

  // ListView is scrollable, Column isn't
  return Column(
    children: [
      Expanded(
        child: ListView(
          children: [
            myHeader(),
            Column(children: myAllTweets(tweetDB, context)),
          ],
        ),
      ),
    ],
  );


}