import 'package:flutter/cupertino.dart';

class Tweet {

  String _content;
  String _author;
  DateTime _createdAt;

  Tweet(this._author, this._content, this._createdAt);

  DateTime get createdAt => _createdAt;
  set createdAt(DateTime value) {
    _createdAt = value;
  }

  String get author => _author;
  set author(String value) {
    _author = value;
  }

  String get content => _content;
  set content(String value) {
    _content = value;
  }

  // custom date formatting, could try overriding toString
  String getFormattedDate(){
    return "${_createdAt.day} ${_createdAt.month} ${_createdAt.year} ${_createdAt.hour}:${_createdAt.minute}.${_createdAt.second}";
  }

  void goToPage(BuildContext context){
    Navigator.pushNamed(
        context,
        '/tweet',
        arguments: this
    );
  }




}