import 'package:flutter/material.dart';
import 'package:tp_widgets_2/bo/tweet.dart';

import '../../widgets/customWidgets.dart';

Widget pageTweetPage(List<Tweet> tweetDB, BuildContext context){
  // ListView is scrollable, Column isn't
  return ListView(
    children: [
      myHeader(),
      Column(children: myAllTweets(tweetDB, context)),
    ],
  );
}