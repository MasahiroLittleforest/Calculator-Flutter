// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'output_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$OutputStateTearOff {
  const _$OutputStateTearOff();

  _OutputState call(
      {String equationText = '',
      String resultText = '',
      double resultNum = 0,
      bool isTypingAfterDecimalPoint = false}) {
    return _OutputState(
      equationText: equationText,
      resultText: resultText,
      resultNum: resultNum,
      isTypingAfterDecimalPoint: isTypingAfterDecimalPoint,
    );
  }
}

/// @nodoc
const $OutputState = _$OutputStateTearOff();

/// @nodoc
mixin _$OutputState {
  String get equationText => throw _privateConstructorUsedError;
  String get resultText => throw _privateConstructorUsedError;
  double get resultNum => throw _privateConstructorUsedError;
  bool get isTypingAfterDecimalPoint => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OutputStateCopyWith<OutputState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutputStateCopyWith<$Res> {
  factory $OutputStateCopyWith(
          OutputState value, $Res Function(OutputState) then) =
      _$OutputStateCopyWithImpl<$Res>;
  $Res call(
      {String equationText,
      String resultText,
      double resultNum,
      bool isTypingAfterDecimalPoint});
}

/// @nodoc
class _$OutputStateCopyWithImpl<$Res> implements $OutputStateCopyWith<$Res> {
  _$OutputStateCopyWithImpl(this._value, this._then);

  final OutputState _value;
  // ignore: unused_field
  final $Res Function(OutputState) _then;

  @override
  $Res call({
    Object? equationText = freezed,
    Object? resultText = freezed,
    Object? resultNum = freezed,
    Object? isTypingAfterDecimalPoint = freezed,
  }) {
    return _then(_value.copyWith(
      equationText: equationText == freezed
          ? _value.equationText
          : equationText // ignore: cast_nullable_to_non_nullable
              as String,
      resultText: resultText == freezed
          ? _value.resultText
          : resultText // ignore: cast_nullable_to_non_nullable
              as String,
      resultNum: resultNum == freezed
          ? _value.resultNum
          : resultNum // ignore: cast_nullable_to_non_nullable
              as double,
      isTypingAfterDecimalPoint: isTypingAfterDecimalPoint == freezed
          ? _value.isTypingAfterDecimalPoint
          : isTypingAfterDecimalPoint // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$OutputStateCopyWith<$Res>
    implements $OutputStateCopyWith<$Res> {
  factory _$OutputStateCopyWith(
          _OutputState value, $Res Function(_OutputState) then) =
      __$OutputStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String equationText,
      String resultText,
      double resultNum,
      bool isTypingAfterDecimalPoint});
}

/// @nodoc
class __$OutputStateCopyWithImpl<$Res> extends _$OutputStateCopyWithImpl<$Res>
    implements _$OutputStateCopyWith<$Res> {
  __$OutputStateCopyWithImpl(
      _OutputState _value, $Res Function(_OutputState) _then)
      : super(_value, (v) => _then(v as _OutputState));

  @override
  _OutputState get _value => super._value as _OutputState;

  @override
  $Res call({
    Object? equationText = freezed,
    Object? resultText = freezed,
    Object? resultNum = freezed,
    Object? isTypingAfterDecimalPoint = freezed,
  }) {
    return _then(_OutputState(
      equationText: equationText == freezed
          ? _value.equationText
          : equationText // ignore: cast_nullable_to_non_nullable
              as String,
      resultText: resultText == freezed
          ? _value.resultText
          : resultText // ignore: cast_nullable_to_non_nullable
              as String,
      resultNum: resultNum == freezed
          ? _value.resultNum
          : resultNum // ignore: cast_nullable_to_non_nullable
              as double,
      isTypingAfterDecimalPoint: isTypingAfterDecimalPoint == freezed
          ? _value.isTypingAfterDecimalPoint
          : isTypingAfterDecimalPoint // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_OutputState with DiagnosticableTreeMixin implements _OutputState {
  const _$_OutputState(
      {this.equationText = '',
      this.resultText = '',
      this.resultNum = 0,
      this.isTypingAfterDecimalPoint = false});

  @JsonKey(defaultValue: '')
  @override
  final String equationText;
  @JsonKey(defaultValue: '')
  @override
  final String resultText;
  @JsonKey(defaultValue: 0)
  @override
  final double resultNum;
  @JsonKey(defaultValue: false)
  @override
  final bool isTypingAfterDecimalPoint;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OutputState(equationText: $equationText, resultText: $resultText, resultNum: $resultNum, isTypingAfterDecimalPoint: $isTypingAfterDecimalPoint)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OutputState'))
      ..add(DiagnosticsProperty('equationText', equationText))
      ..add(DiagnosticsProperty('resultText', resultText))
      ..add(DiagnosticsProperty('resultNum', resultNum))
      ..add(DiagnosticsProperty(
          'isTypingAfterDecimalPoint', isTypingAfterDecimalPoint));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OutputState &&
            (identical(other.equationText, equationText) ||
                const DeepCollectionEquality()
                    .equals(other.equationText, equationText)) &&
            (identical(other.resultText, resultText) ||
                const DeepCollectionEquality()
                    .equals(other.resultText, resultText)) &&
            (identical(other.resultNum, resultNum) ||
                const DeepCollectionEquality()
                    .equals(other.resultNum, resultNum)) &&
            (identical(other.isTypingAfterDecimalPoint,
                    isTypingAfterDecimalPoint) ||
                const DeepCollectionEquality().equals(
                    other.isTypingAfterDecimalPoint,
                    isTypingAfterDecimalPoint)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(equationText) ^
      const DeepCollectionEquality().hash(resultText) ^
      const DeepCollectionEquality().hash(resultNum) ^
      const DeepCollectionEquality().hash(isTypingAfterDecimalPoint);

  @JsonKey(ignore: true)
  @override
  _$OutputStateCopyWith<_OutputState> get copyWith =>
      __$OutputStateCopyWithImpl<_OutputState>(this, _$identity);
}

abstract class _OutputState implements OutputState {
  const factory _OutputState(
      {String equationText,
      String resultText,
      double resultNum,
      bool isTypingAfterDecimalPoint}) = _$_OutputState;

  @override
  String get equationText => throw _privateConstructorUsedError;
  @override
  String get resultText => throw _privateConstructorUsedError;
  @override
  double get resultNum => throw _privateConstructorUsedError;
  @override
  bool get isTypingAfterDecimalPoint => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OutputStateCopyWith<_OutputState> get copyWith =>
      throw _privateConstructorUsedError;
}
