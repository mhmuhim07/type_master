import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:type_master/domain/usecase/quote_use_case.dart';
import 'package:type_master/presentation/screen/home/state/state.dart';

class HomeNotifier extends StateNotifier<HomeUiState> {
  final GetAllQuoteUseCase _useCase;
  HomeNotifier(this._useCase) : super(const HomeUiState.loading()) {
    _init();
  }
  Future<void> _init() async {
    try {
      final quotes = await _useCase.getAllQuotes(query: []);
      state = HomeUiState.success(quotes: quotes);
    } catch (e) {
      state = HomeUiState.error(e.toString());
    }
  }

  Future<void> refresh() async {
    try {
      final quotes = await _useCase.getAllQuotes(query: []);
      state = HomeUiState.success(quotes: quotes);
    } catch (e) {
      state = HomeUiState.error(e.toString());
    }
  }
}
