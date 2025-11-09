import 'package:type_master/domain/model/quote_model.dart';
import 'package:type_master/domain/repository/quote_repository.dart';

class GetAllQuoteUseCase {
  final QuoteRepository _quoteRepository;

  GetAllQuoteUseCase({required QuoteRepository quoteRepository})
    : _quoteRepository = quoteRepository;

  Future<QuoteModel> getAllQuotes({required List<String> query}) async {
    final quotes = await _quoteRepository.getQuotes(query: query);
    return quotes;
  }
}
