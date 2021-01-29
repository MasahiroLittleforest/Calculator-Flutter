import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'output.freezed.dart';

@freezed
abstract class Output with _$Output {
  const factory Output({
    @Default('') String equationText,
    @Default('') String resultText,
    @Default(0) double resultNum,
    @Default(false) bool isTypingAfterDecimalPoint,
  }) = _Output;
}
