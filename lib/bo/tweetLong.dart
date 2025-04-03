import 'package:flutter/material.dart';


class TweetLong {

  int _id;
  String _profile;
  int _createdDate;
  String _author;
  String _message;

// ----

  TweetLong(this._id, this._profile, this._createdDate, this._author, this._message);

  static List<TweetLong> fromJsonList(List<dynamic> json) {
    List<TweetLong> tweetList = [];
    for (var item in json){
      switch (item) {
        case {'id': int id, 'profile': String profile, 'created_date': int createdDate, 'author': String author, 'message': String message}:
          tweetList.add(TweetLong(id, profile, createdDate, author, message));
        case _:
          throw const FormatException('Failed to load TweetLong.');
      }
    }
    return tweetList;
  }

// ----

  String get message => _message;

  set message(String value) {
    _message = value;
  }

  String get author => _author;

  set author(String value) {
    _author = value;
  }

  int get createdDate => _createdDate;

  set createdDate(int value) {
    _createdDate = value;
  }

  String get profile => _profile;

  set profile(String value) {
    _profile = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

// ---- Funcs

  void goToPage(BuildContext context){
    Navigator.pushNamed(
        context,
        '/tweet',
        arguments: this
    );
  }


}