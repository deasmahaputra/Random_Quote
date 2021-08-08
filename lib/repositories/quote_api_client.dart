import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import 'package:quote_app/models/models.dart';

class QuoteApiClient {
  final _baseUrl = 'https://quote-garden.herokuapp.com';
  final http.Client httpClient;
  QuoteApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<List<Quote>> fetchQuote() async {
    final url = '$_baseUrl/api/v3/quotes/random';
    final response = await this.httpClient.get(url);

    if (response.statusCode != 200) {
      throw new Exception('error getting quotes');
    }

    final json = await compute(jsonDecode, response.body);
    final data = json['data'];

    if(data is List){
      return data.map<Quote>((e) => Quote.fromJson(e)).toList();
    }
    return null;
  }

}
