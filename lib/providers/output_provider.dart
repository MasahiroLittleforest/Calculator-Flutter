import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Output with ChangeNotifier {
  String _equationText = '';
  String _resultText = '';
  double _resultNum = 0;

  String get equationText => _equationText;
  String get resultText => _resultText;

  String get equationLastCharacter => getEquationLastCharacter();

  set equationText(String value) {
    _equationText = value;
    _resultNum = double.tryParse(value);
    notifyListeners();
  }

  String getEquationLastCharacter() {
    if (_equationText == '') {
      return '';
    } else {
      return _equationText[_equationText.length - 1];
    }
  }

  void enter() {
    if (_resultText == '') {
      return;
    }
    _equationText = _resultText;
    _resultText = '';
    _resultNum = double.tryParse(_resultText);
    notifyListeners();
  }

  void autoCalculate() {
    String _formattedEquation =
        _equationText.replaceAll('×', '*').replaceAll('÷', '/');
    print('Formatted equation: $_formattedEquation');
    if (checkIfTextIsOperator(text: equationLastCharacter)) {
      _formattedEquation =
          _formattedEquation.substring(0, _formattedEquation.length - 1);
    }
    if (!checkIfEquationContainsOperator(equation: _formattedEquation)) {
      _resultText = '';
      return;
    }
    try {
      final Parser _parser = Parser();
      final Expression _expression = _parser.parse(_formattedEquation);
      final ContextModel _contextModel = ContextModel();
      _resultNum = _expression.evaluate(EvaluationType.REAL, _contextModel);
      final String _result = _resultNum.toString();
      if (_result.split('.')[1] == '0') {
        _resultText = _result.split('.')[0];
      } else {
        _resultText = _result;
      }
    } catch (error) {
      _resultText = 'Error';
      print('Error: $error');
    }
  }

  void clear() {
    _equationText = '';
    _resultText = '';
    notifyListeners();
  }

  void delete() {
    if (_equationText == null || _equationText.length == 0) {
      return;
    }
    if (_equationText == 'Error') {
      clear();
      return;
    }
    _equationText = _equationText.substring(0, _equationText.length - 1);
    autoCalculate();
    notifyListeners();
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
    if (_equationText == '') {
      return false;
    }
    if (_equationText[_equationText.length - 1] == '.') {
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
      if (checkIfLastCharacterIsDot()) {
        return;
      } else {
        equationText += buttonText;
      }
    } else {
      // 頭に0が2つ以上並ばないようにする
      if (resultText == '0' && buttonText == '0') {
        equationText = buttonText;
      } else if (checkIfTextIsOperator(text: buttonText)) {
        // 1つ前が演算子の時
        if (checkIfTextIsOperator(text: equationLastCharacter)) {
          delete();
        }
        equationText += buttonText;
        autoCalculate();
      } else {
        equationText += buttonText;
        autoCalculate();
      }
    }
    print('Equation text: $equationText');
    print('Result text: $resultText');
  }
}
