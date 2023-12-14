import 'dart:math';
import 'package:flutter/material.dart';
import '../models/quote.dart';
import '../services/quote_service.dart';

class QuoteProvider with ChangeNotifier {
  List<Quote> _quotes = [];
  Quote? _currentQuote;
  final _random = Random();

  QuoteProvider() {
    loadQuotes();
  }

  Future<void> loadQuotes() async {
    _quotes = await QuoteService().loadQuotes();
    if (_quotes.isNotEmpty) {
      _currentQuote = _quotes[_random.nextInt(_quotes.length)]; 
      notifyListeners();
    }
  }

  Quote? get currentQuote => _currentQuote;

  void nextQuote() {
    if (_quotes.isNotEmpty) {
      _currentQuote = _quotes[
          _random.nextInt(_quotes.length)]; 
      notifyListeners();
    }
  }
}
