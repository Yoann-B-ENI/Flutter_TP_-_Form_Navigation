import 'package:flutter/material.dart';
import 'package:tp_widgets_2/pages/HomePage_Tabs/Contact.dart';
import 'package:tp_widgets_2/pages/HomePage_Tabs/NewTweet.dart';
import 'package:tp_widgets_2/pages/HomePage_Tabs/AllTweetsPage.dart';
import 'package:tp_widgets_2/bo/tweet.dart';

import '../widgets/customWidgets.dart';

class TweetPage extends StatelessWidget {
  const TweetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Tweet;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Tweet Details'), elevation: 5, shadowColor: Colors.black,
      ),

        body:
            Column(
              children: [
                Text(args.author),
                Text(args.content),
                Text(args.getFormattedDate())
              ]
            )
    );
  }
}



