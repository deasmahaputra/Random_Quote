import 'dart:core';

import 'package:equatable/equatable.dart';

class Quote extends Equatable{

  String id;
  String quoteText;
  String quoteAuthor;

  Quote({this.id, this.quoteText, this.quoteAuthor});

  Quote.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    quoteText = json['quoteText'];
    quoteAuthor = json['quoteAuthor'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['quoteText'] = this.quoteText;
    data['quoteAuthor'] = this.quoteAuthor;
  }

  @override
  List<Object> get props => [Quote()];


}

class QuoteList{
  int id;
  String quoteText;
  String quoteAuthor;

  QuoteList({this.id, this.quoteText, this.quoteAuthor});

  QuoteList.fromJson(Map<String, dynamic> json){
    id = json['id'];
    quoteText = json['quoteText'];
    quoteAuthor = json['quoteAuthor'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quoteText'] = this.quoteText;
    data['quoteAuthor'] = this.quoteAuthor;
  }
}