import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:type_master/domain/model/quote_model.dart';
part 'state.freezed.dart';

@freezed
class HomeUiState with _$HomeUiState {
  const factory HomeUiState.loading() = HomeLoadingState;
  const factory HomeUiState.success({required QuoteModel quotes}) =
      HomeSuccessState;
  const factory HomeUiState.error(String message) = HomeErrorState;
}
