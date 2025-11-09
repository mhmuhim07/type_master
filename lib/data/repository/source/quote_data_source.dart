import 'package:type_master/domain/model/quote_model.dart';

abstract class QuoteDataSource {
  Future<QuoteModel> getQuotes({required List<String> query});
}
