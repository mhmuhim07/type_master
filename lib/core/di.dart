import 'package:get_it/get_it.dart';
import 'package:type_master/data/datasource/quote_data_source_impl.dart';
import 'package:type_master/data/repository/quote_repository_impl.dart';
import 'package:type_master/data/repository/source/quote_data_source.dart';
import 'package:type_master/domain/repository/quote_repository.dart';
import 'package:type_master/domain/usecase/quote_use_case.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<QuoteDataSource>(() => QuoteDataSourceImpl());

  getIt.registerLazySingleton<QuoteRepository>(
    () => QuoteRepositoryImpl(quoteDataSource: getIt<QuoteDataSource>()),
  );

  getIt.registerLazySingleton<GetAllQuoteUseCase>(
    () => GetAllQuoteUseCase(quoteRepository: getIt<QuoteRepository>()),
  );
}
