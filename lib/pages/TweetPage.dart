import 'package:flutter/material.dart';
import 'package:tp_widgets_2/bo/tweet.dart';

import '../widgets/customWidgets.dart';

Widget pageTweetPage(List<Tweet> tweetDB){
  return ListView(
    children: [
      myHeader(),
      Column(children: myAllTweets(tweetDB)),
    ],
  );
}