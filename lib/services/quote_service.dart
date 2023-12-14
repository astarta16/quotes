import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/quote.dart';

class QuoteService {
  Future<List<Quote>> loadQuotes() async {
    final String response = await rootBundle.loadString('assets/data/quotes.json');
    final data = json.decode(response) as List;
    return data.map((quote) => Quote.fromJson(quote)).toList();
  }
}
