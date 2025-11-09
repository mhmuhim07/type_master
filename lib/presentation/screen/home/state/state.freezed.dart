// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeUiState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(QuoteModel quotes) success,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(QuoteModel quotes)? success,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(QuoteModel quotes)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeLoadingState value) loading,
    required TResult Function(HomeSuccessState value) success,
    required TResult Function(HomeErrorState value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeLoadingState value)? loading,
    TResult? Function(HomeSuccessState value)? success,
    TResult? Function(HomeErrorState value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeLoadingState value)? loading,
    TResult Function(HomeSuccessState value)? success,
    TResult Function(HomeErrorState value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeUiStateCopyWith<$Res> {
  factory $HomeUiStateCopyWith(
    HomeUiState value,
    $Res Function(HomeUiState) then,
  ) = _$HomeUiStateCopyWithImpl<$Res, HomeUiState>;
}

/// @nodoc
class _$HomeUiStateCopyWithImpl<$Res, $Val extends HomeUiState>
    implements $HomeUiStateCopyWith<$Res> {
  _$HomeUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeUiState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$HomeLoadingStateImplCopyWith<$Res> {
  factory _$$HomeLoadingStateImplCopyWith(
    _$HomeLoadingStateImpl value,
    $Res Function(_$HomeLoadingStateImpl) then,
  ) = __$$HomeLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeLoadingStateImplCopyWithImpl<$Res>
    extends _$HomeUiStateCopyWithImpl<$Res, _$HomeLoadingStateImpl>
    implements _$$HomeLoadingStateImplCopyWith<$Res> {
  __$$HomeLoadingStateImplCopyWithImpl(
    _$HomeLoadingStateImpl _value,
    $Res Function(_$HomeLoadingStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeUiState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HomeLoadingStateImpl implements HomeLoadingState {
  const _$HomeLoadingStateImpl();

  @override
  String toString() {
    return 'HomeUiState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(QuoteModel quotes) success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(QuoteModel quotes)? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(QuoteModel quotes)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeLoadingState value) loading,
    required TResult Function(HomeSuccessState value) success,
    required TResult Function(HomeErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeLoadingState value)? loading,
    TResult? Function(HomeSuccessState value)? success,
    TResult? Function(HomeErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeLoadingState value)? loading,
    TResult Function(HomeSuccessState value)? success,
    TResult Function(HomeErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class HomeLoadingState implements HomeUiState {
  const factory HomeLoadingState() = _$HomeLoadingStateImpl;
}

/// @nodoc
abstract class _$$HomeSuccessStateImplCopyWith<$Res> {
  factory _$$HomeSuccessStateImplCopyWith(
    _$HomeSuccessStateImpl value,
    $Res Function(_$HomeSuccessStateImpl) then,
  ) = __$$HomeSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({QuoteModel quotes});
}

/// @nodoc
class __$$HomeSuccessStateImplCopyWithImpl<$Res>
    extends _$HomeUiStateCopyWithImpl<$Res, _$HomeSuccessStateImpl>
    implements _$$HomeSuccessStateImplCopyWith<$Res> {
  __$$HomeSuccessStateImplCopyWithImpl(
    _$HomeSuccessStateImpl _value,
    $Res Function(_$HomeSuccessStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? quotes = null}) {
    return _then(
      _$HomeSuccessStateImpl(
        quotes: null == quotes
            ? _value.quotes
            : quotes // ignore: cast_nullable_to_non_nullable
                  as QuoteModel,
      ),
    );
  }
}

/// @nodoc

class _$HomeSuccessStateImpl implements HomeSuccessState {
  const _$HomeSuccessStateImpl({required this.quotes});

  @override
  final QuoteModel quotes;

  @override
  String toString() {
    return 'HomeUiState.success(quotes: $quotes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeSuccessStateImpl &&
            (identical(other.quotes, quotes) || other.quotes == quotes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, quotes);

  /// Create a copy of HomeUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeSuccessStateImplCopyWith<_$HomeSuccessStateImpl> get copyWith =>
      __$$HomeSuccessStateImplCopyWithImpl<_$HomeSuccessStateImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(QuoteModel quotes) success,
    required TResult Function(String message) error,
  }) {
    return success(quotes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(QuoteModel quotes)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(quotes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(QuoteModel quotes)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(quotes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeLoadingState value) loading,
    required TResult Function(HomeSuccessState value) success,
    required TResult Function(HomeErrorState value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeLoadingState value)? loading,
    TResult? Function(HomeSuccessState value)? success,
    TResult? Function(HomeErrorState value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeLoadingState value)? loading,
    TResult Function(HomeSuccessState value)? success,
    TResult Function(HomeErrorState value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class HomeSuccessState implements HomeUiState {
  const factory HomeSuccessState({required final QuoteModel quotes}) =
      _$HomeSuccessStateImpl;

  QuoteModel get quotes;

  /// Create a copy of HomeUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeSuccessStateImplCopyWith<_$HomeSuccessStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomeErrorStateImplCopyWith<$Res> {
  factory _$$HomeErrorStateImplCopyWith(
    _$HomeErrorStateImpl value,
    $Res Function(_$HomeErrorStateImpl) then,
  ) = __$$HomeErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$HomeErrorStateImplCopyWithImpl<$Res>
    extends _$HomeUiStateCopyWithImpl<$Res, _$HomeErrorStateImpl>
    implements _$$HomeErrorStateImplCopyWith<$Res> {
  __$$HomeErrorStateImplCopyWithImpl(
    _$HomeErrorStateImpl _value,
    $Res Function(_$HomeErrorStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$HomeErrorStateImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$HomeErrorStateImpl implements HomeErrorState {
  const _$HomeErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'HomeUiState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of HomeUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeErrorStateImplCopyWith<_$HomeErrorStateImpl> get copyWith =>
      __$$HomeErrorStateImplCopyWithImpl<_$HomeErrorStateImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(QuoteModel quotes) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(QuoteModel quotes)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(QuoteModel quotes)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeLoadingState value) loading,
    required TResult Function(HomeSuccessState value) success,
    required TResult Function(HomeErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeLoadingState value)? loading,
    TResult? Function(HomeSuccessState value)? success,
    TResult? Function(HomeErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeLoadingState value)? loading,
    TResult Function(HomeSuccessState value)? success,
    TResult Function(HomeErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class HomeErrorState implements HomeUiState {
  const factory HomeErrorState(final String message) = _$HomeErrorStateImpl;

  String get message;

  /// Create a copy of HomeUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeErrorStateImplCopyWith<_$HomeErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
