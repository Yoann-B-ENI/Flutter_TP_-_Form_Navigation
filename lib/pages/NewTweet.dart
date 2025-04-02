import 'package:flutter/material.dart';
import 'package:tp_widgets_2/bo/tweet.dart';

Widget pageNewTweet({required Null Function(Tweet newTweet) addTweet}){
  final _formKey = GlobalKey<FormState>();

  String? _authorValue;
  String? _contentValue;

  void onSubmit(){
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(_authorValue);
      print(_contentValue);
      var newTweet = Tweet(_authorValue!, _contentValue!, DateTime.now());
      addTweet(newTweet);
    }
  }

  String? authorValidate(newVal){
    if (newVal == null || newVal.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }
  String? contentValidate(newVal){
    if (newVal == null || newVal.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  return Column(
    children: [
      Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Author Name'),
              onSaved: (value){_authorValue = value;},
              validator: authorValidate
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Tweet Content'),
              onSaved: (value){_contentValue = value;},
              validator: contentValidate,
            ),
            ElevatedButton(onPressed: onSubmit, child: Text('Create Tweet'))
          ],
        )
      )
    ],
  );


}