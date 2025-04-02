import 'package:flutter/material.dart';
import 'package:tp_widgets_2/bo/tweet.dart';

Widget pageNewTweet({required Null Function(Tweet newTweet) addTweet}){
  final _formKey = GlobalKey<FormState>();

  String? _authorValue;
  String? _contentValue;

  void onSubmit(){
    _formKey.currentState!.save();
    print(_authorValue);
    print(_contentValue);
    var newTweet = Tweet(_authorValue!, _contentValue!, DateTime.now());
    addTweet(newTweet);
  }

  return Column(
    children: [
      Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Author Name'),
              onSaved: (value){_authorValue = value;}
            ),
            TextFormField(
                decoration: InputDecoration(labelText: 'Tweet Content'),
                onSaved: (value){_contentValue = value;}
            ),
            ElevatedButton(onPressed: onSubmit, child: Text('Create Tweet'))
          ],
        )
      )
    ],
  );
}