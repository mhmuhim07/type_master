import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:type_master/data/repository/source/quote_data_source.dart';
import 'package:type_master/domain/model/quote_model.dart';

class QuoteDataSourceImpl implements QuoteDataSource {
  Future<List<dynamic>> _getQuotes() async {
    final String quotes = await rootBundle.loadString('assets/db.json');
    final List<dynamic> quotesList = json.decode(quotes);
    return quotesList;
  }

  @override
  Future<QuoteModel> getQuotes({required List<String> query}) async {
    final quotes = await _getQuotes();
    final random = Random();
    final index = random.nextInt(quotes.length);
    return QuoteModel.fromJson(quotes[index]);
  }
}
