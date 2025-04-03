import 'package:flutter/material.dart';
import 'package:tp_widgets_2/bo/tweet.dart';


class TweetPage extends StatelessWidget {
  const TweetPage({super.key}); // no tweet as argument even if we pass args to the route

  @override
  Widget build(BuildContext context) {
    // get args here
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



