import 'package:type_master/data/repository/source/quote_data_source.dart';
import 'package:type_master/domain/model/quote_model.dart';
import 'package:type_master/domain/repository/quote_repository.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final QuoteDataSource _quoteDataSource;

  QuoteRepositoryImpl({required QuoteDataSource quoteDataSource})
    : _quoteDataSource = quoteDataSource;

  @override
  Future<QuoteModel> getQuotes({required List<String> query}) async {
    final quotes = await _quoteDataSource.getQuotes(query: query);
    return quotes;
  }
}
