import 'package:flutter/material.dart';
import 'package:quote_app/models/models.dart';
import 'package:quote_app/repositories/quote_api_client.dart';

class QuoteRepository {
  final QuoteApiClient quoteApiClient;

  QuoteRepository({@required this.quoteApiClient}) : assert(quoteApiClient != null);

  Future<Quote> fetchQuote() async {
    return await quoteApiClient.fetchQuote();
  }
}