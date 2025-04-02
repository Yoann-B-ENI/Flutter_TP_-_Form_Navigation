import 'package:flutter/material.dart';
import 'package:tp_widgets_2/bo/tweet.dart';

List<Widget> myAllTweets(List<Tweet> tweetDB) {
  List<Widget> tempList = [];
  for (var t in tweetDB){
    tempList.add(myMessageCard(t));
  }
  return tempList;
}

BottomNavigationBar myBottomBar(){
  return BottomNavigationBar(items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Text('Fil'), label: ''),
    BottomNavigationBarItem(icon: Text('Notification'), label: ''),
    BottomNavigationBarItem(icon: Text('Messages'), label: ''),
    BottomNavigationBarItem(icon: Text('Moi'), label: ''),
  ]);
}

Widget myHeader(){
  return Container(
    color: Color(0xFF58B0F0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text('Nouveau'),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text('Accueil'),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text('Rechercher'),
        )
      ],
    ),
  );
}

Card myMessageCard(Tweet tweet){
  return Card(
    child: Column(
      children: [
        Row(
          children: [
            Image.network('https://fastly.picsum.photos/id/798/125/125.jpg?hmac=W6pRIwWSxttAWQZch7EKlxBs-ypc1FSblvBEjxoXdOA',
              fit: BoxFit.contain,),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(tweet.author),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(tweet.content),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(tweet.createdAt.toString()),
                )
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Répondre'),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Partager'),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Favoris'),
            )
          ],
        )
      ],
    ),
  );
}