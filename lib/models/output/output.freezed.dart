// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'output.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$OutputTearOff {
  const _$OutputTearOff();

// ignore: unused_element
  _Output call(
      {String equationText = '',
      String resultText = '',
      double resultNum = 0,
      bool isTypingAfterDecimalPoint = false}) {
    return _Output(
      equationText: equationText,
      resultText: resultText,
      resultNum: resultNum,
      isTypingAfterDecimalPoint: isTypingAfterDecimalPoint,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Output = _$OutputTearOff();

/// @nodoc
mixin _$Output {
  String get equationText;
  String get resultText;
  double get resultNum;
  bool get isTypingAfterDecimalPoint;

  @JsonKey(ignore: true)
  $OutputCopyWith<Output> get copyWith;
}

/// @nodoc
abstract class $OutputCopyWith<$Res> {
  factory $OutputCopyWith(Output value, $Res Function(Output) then) =
      _$OutputCopyWithImpl<$Res>;
  $Res call(
      {String equationText,
      String resultText,
      double resultNum,
      bool isTypingAfterDecimalPoint});
}

/// @nodoc
class _$OutputCopyWithImpl<$Res> implements $OutputCopyWith<$Res> {
  _$OutputCopyWithImpl(this._value, this._then);

  final Output _value;
  // ignore: unused_field
  final $Res Function(Output) _then;

  @override
  $Res call({
    Object equationText = freezed,
    Object resultText = freezed,
    Object resultNum = freezed,
    Object isTypingAfterDecimalPoint = freezed,
  }) {
    return _then(_value.copyWith(
      equationText: equationText == freezed
          ? _value.equationText
          : equationText as String,
      resultText:
          resultText == freezed ? _value.resultText : resultText as String,
      resultNum: resultNum == freezed ? _value.resultNum : resultNum as double,
      isTypingAfterDecimalPoint: isTypingAfterDecimalPoint == freezed
          ? _value.isTypingAfterDecimalPoint
          : isTypingAfterDecimalPoint as bool,
    ));
  }
}

/// @nodoc
abstract class _$OutputCopyWith<$Res> implements $OutputCopyWith<$Res> {
  factory _$OutputCopyWith(_Output value, $Res Function(_Output) then) =
      __$OutputCopyWithImpl<$Res>;
  @override
  $Res call(
      {String equationText,
      String resultText,
      double resultNum,
      bool isTypingAfterDecimalPoint});
}

/// @nodoc
class __$OutputCopyWithImpl<$Res> extends _$OutputCopyWithImpl<$Res>
    implements _$OutputCopyWith<$Res> {
  __$OutputCopyWithImpl(_Output _value, $Res Function(_Output) _then)
      : super(_value, (v) => _then(v as _Output));

  @override
  _Output get _value => super._value as _Output;

  @override
  $Res call({
    Object equationText = freezed,
    Object resultText = freezed,
    Object resultNum = freezed,
    Object isTypingAfterDecimalPoint = freezed,
  }) {
    return _then(_Output(
      equationText: equationText == freezed
          ? _value.equationText
          : equationText as String,
      resultText:
          resultText == freezed ? _value.resultText : resultText as String,
      resultNum: resultNum == freezed ? _value.resultNum : resultNum as double,
      isTypingAfterDecimalPoint: isTypingAfterDecimalPoint == freezed
          ? _value.isTypingAfterDecimalPoint
          : isTypingAfterDecimalPoint as bool,
    ));
  }
}

/// @nodoc
class _$_Output with DiagnosticableTreeMixin implements _Output {
  const _$_Output(
      {this.equationText = '',
      this.resultText = '',
      this.resultNum = 0,
      this.isTypingAfterDecimalPoint = false})
      : assert(equationText != null),
        assert(resultText != null),
        assert(resultNum != null),
        assert(isTypingAfterDecimalPoint != null);

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
    return 'Output(equationText: $equationText, resultText: $resultText, resultNum: $resultNum, isTypingAfterDecimalPoint: $isTypingAfterDecimalPoint)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Output'))
      ..add(DiagnosticsProperty('equationText', equationText))
      ..add(DiagnosticsProperty('resultText', resultText))
      ..add(DiagnosticsProperty('resultNum', resultNum))
      ..add(DiagnosticsProperty(
          'isTypingAfterDecimalPoint', isTypingAfterDecimalPoint));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Output &&
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
  _$OutputCopyWith<_Output> get copyWith =>
      __$OutputCopyWithImpl<_Output>(this, _$identity);
}

abstract class _Output implements Output {
  const factory _Output(
      {String equationText,
      String resultText,
      double resultNum,
      bool isTypingAfterDecimalPoint}) = _$_Output;

  @override
  String get equationText;
  @override
  String get resultText;
  @override
  double get resultNum;
  @override
  bool get isTypingAfterDecimalPoint;
  @override
  @JsonKey(ignore: true)
  _$OutputCopyWith<_Output> get copyWith;
}
