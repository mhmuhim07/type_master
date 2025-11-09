import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:type_master/core/di.dart';
import 'package:type_master/domain/usecase/quote_use_case.dart';
import 'package:type_master/presentation/screen/home/notifier/home_notifier.dart';
import 'package:type_master/presentation/screen/home/state/state.dart';

final homeNotifierProvider =
    StateNotifierProvider.autoDispose<HomeNotifier, HomeUiState>((ref) {
      final getAllQuoteUseCase = getIt<GetAllQuoteUseCase>();

      return HomeNotifier(getAllQuoteUseCase);
    });
