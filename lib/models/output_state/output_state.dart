import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'output_state.freezed.dart';

@freezed
class OutputState with _$OutputState {
  const factory OutputState({
    @Default('') String equationText,
    @Default('') String resultText,
    @Default(0) double resultNum,
    @Default(false) bool isTypingAfterDecimalPoint,
  }) = _OutputState;
}
