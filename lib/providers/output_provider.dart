import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:math_expressions/math_expressions.dart';

import '../models/output/output.dart';

class OutputProvider extends StateNotifier<Output> {
  OutputProvider() : super(const Output());

  static final NumberFormat _numberFormat = NumberFormat('#,###');

  String get equationLastCharacter => getEquationLastCharacter();
  String getEquationLastCharacter() {
    if (state.equationText == '') {
      return '';
    } else {
      return state.equationText[state.equationText.length - 1];
    }
  }

  void enter() {
    if (state.resultText == '') {
      return;
    }
    state = state.copyWith(
      equationText: state.resultText,
      resultNum: double.tryParse(state.resultText),
      resultText: '',
      isTypingAfterDecimalPoint: false,
    );
  }

  String dropZero({@required String value}) {
    if (value.contains('.') && (value.endsWith('0') || value.endsWith('.'))) {
      final String _substr = value.substring(0, value.length - 1);
      return dropZero(value: _substr);
    } else {
      return value;
    }
  }

  String _convertOperators() {
    return state.equationText.replaceAll('×', '*').replaceAll('÷', '/');
  }

  void autoCalculate() {
    String _formattedEquation = _convertOperators();
    print('Formatted equation: $_formattedEquation');
    if (checkIfTextIsOperator(text: equationLastCharacter)) {
      _formattedEquation =
          _formattedEquation.substring(0, _formattedEquation.length - 1);
    }
    if (!checkIfEquationContainsOperator(equation: _formattedEquation)) {
      state = state.copyWith(resultText: '');
      return;
    }
    try {
      final Parser _parser = Parser();
      final Expression _expression = _parser.parse(_formattedEquation);
      final ContextModel _contextModel = ContextModel();
      double _evaluationResult =
          _expression.evaluate(EvaluationType.REAL, _contextModel) as double;
      final int _precision = pow(10, 10) as int;
      _evaluationResult = (_evaluationResult * _precision).round() / _precision;
      state = state.copyWith(
        resultText: dropZero(value: _numberFormat.format(_evaluationResult)),
      );
    } catch (e) {
      debugPrint('$e');
    }
  }

  void clearAll() {
    state = state.copyWith(
      equationText: '',
      resultText: '',
      resultNum: 0,
      isTypingAfterDecimalPoint: false,
    );
  }

  void delete() {
    if (state.equationText.length <= 1) {
      clearAll();
      return;
    }
    if (state.equationText == null || state.equationText.isEmpty) {
      return;
    }
    if (state.equationText == 'Error' || state.equationText == 'NaN') {
      clearAll();
      return;
    }
    state = state.copyWith(
      equationText:
          state.equationText.substring(0, state.equationText.length - 1),
    );
    autoCalculate();
  }

  bool checkIfTextIsOperator({@required String text}) {
    if (text == '+' ||
        text == '-' ||
        text == '×' ||
        text == '÷' ||
        text == '=') {
      return true;
    } else {
      return false;
    }
  }

  bool checkIfEquationContainsOperator({@required String equation}) {
    if (equation.contains('+') ||
        equation.contains('-') ||
        equation.contains('*') ||
        equation.contains('/')) {
      return true;
    } else {
      return false;
    }
  }

  bool checkIfLastCharacterIsDot() {
    if (state.equationText == '') {
      return false;
    }
    if (state.equationText[state.equationText.length - 1] == '.') {
      return true;
    } else {
      return false;
    }
  }

  void onTapped({@required String buttonText}) {
    if (buttonText == 'DEL') {
      delete();
    } else if (buttonText == '=') {
      enter();
    } else if (buttonText == '.') {
      state = state.copyWith(isTypingAfterDecimalPoint: true);
      if (checkIfLastCharacterIsDot()) {
        return;
      } else {
        state = state.copyWith(equationText: state.equationText + buttonText);
      }
    } else {
      if (state.equationText.isNotEmpty &&
          (checkIfTextIsOperator(
                  text: state.equationText[state.equationText.length - 1]) ||
              state.isTypingAfterDecimalPoint) &&
          buttonText == '0') {
        state = state.copyWith(equationText: state.equationText + buttonText);
        return;
      }
      // 頭に0が2つ以上並ばないようにする
      if (state.resultText == '0' && buttonText == '0') {
        state = state.copyWith(equationText: buttonText);
      } else if (checkIfTextIsOperator(text: buttonText)) {
        // 1つ前が演算子の時
        if (checkIfTextIsOperator(text: equationLastCharacter)) {
          delete();
        }
        state = state.copyWith(equationText: state.equationText + buttonText);
        autoCalculate();
      } else {
        state = state.copyWith(equationText: state.equationText + buttonText);
        autoCalculate();
      }
    }
    print('Equation text: ${state.equationText}');
    print('Result text: ${state.resultText}');
    print('result: ${state.resultNum}');
  }
}
