import 'package:flutter/material.dart';
import 'dart:math';

class KalkulatorFragment extends StatefulWidget {
  const KalkulatorFragment({super.key});

  @override
  State<KalkulatorFragment> createState() => _KalkulatorFragmentState();
}

class _KalkulatorFragmentState extends State<KalkulatorFragment> {
  String _output = '0';
  String _currentInput = '';
  double _num1 = 0;
  double _num2 = 0;
  String _operand = '';

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _output = '0';
        _currentInput = '';
        _num1 = 0;
        _num2 = 0;
        _operand = '';
      } else if (buttonText == '+' ||
          buttonText == '−' ||
          buttonText == '×' ||
          buttonText == '÷') {
        _num1 = double.parse(_output);
        _operand = buttonText;
        _currentInput = '';
      } else if (buttonText == '=') {
        _num2 = double.parse(_output);
        switch (_operand) {
          case '+':
            _output = (_num1 + _num2).toString();
            break;
          case '−':
            _output = (_num1 - _num2).toString();
            break;
          case '×':
            _output = (_num1 * _num2).toString();
            break;
          case '÷':
            if (_num2 != 0) {
              _output = (_num1 / _num2).toString();
            } else {
              _output = 'Error';
            }
            break;
        }
        _num1 = 0;
        _num2 = 0;
        _operand = '';
        _currentInput = _output;
      } else if (buttonText == 'x²') {
        double num = double.parse(_output);
        _output = (num * num).toString();
        _currentInput = _output;
      } else if (buttonText == '√') {
        double num = double.parse(_output);
        if (num >= 0) {
          _output = sqrt(num).toString();
        } else {
          _output = 'Error';
        }
        _currentInput = _output;
      } else if (buttonText == '.') {
        if (!_currentInput.contains('.')) {
          _currentInput += buttonText;
          _output = _currentInput;
        }
      } else {
        _currentInput += buttonText;
        _output = _currentInput;
      }

      // Format output
      if (_output.contains('.') && _output.length > 10) {
        _output = double.parse(_output).toStringAsFixed(6);
      }
      if (_output.endsWith('.0')) {
        _output = _output.substring(0, _output.length - 2);
      }
    });
  }

  Widget _buildButton(String buttonText, Color color, Color textColor) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: () => _buttonPressed(buttonText),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: textColor,
            padding: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
          ),
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple.shade700, Colors.purple.shade400],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Display
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(24),
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.purple.shade50,
                    Colors.white,
                  ],
                ),
              ),
              child: Text(
                _output,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple.shade900,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),

          // Buttons
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton('C', Colors.red.shade400, Colors.white),
                        _buildButton('÷', Colors.deepPurple.shade700, Colors.white),
                        _buildButton('×', Colors.deepPurple.shade700, Colors.white),
                        _buildButton('−', Colors.deepPurple.shade700, Colors.white),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton('7', Colors.grey.shade300, Colors.black),
                        _buildButton('8', Colors.grey.shade300, Colors.black),
                        _buildButton('9', Colors.grey.shade300, Colors.black),
                        _buildButton('+', Colors.deepPurple.shade700, Colors.white),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton('4', Colors.grey.shade300, Colors.black),
                        _buildButton('5', Colors.grey.shade300, Colors.black),
                        _buildButton('6', Colors.grey.shade300, Colors.black),
                        _buildButton('x²', Colors.orange.shade400, Colors.white),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton('1', Colors.grey.shade300, Colors.black),
                        _buildButton('2', Colors.grey.shade300, Colors.black),
                        _buildButton('3', Colors.grey.shade300, Colors.black),
                        _buildButton('√', Colors.orange.shade400, Colors.white),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton('0', Colors.grey.shade300, Colors.black),
                        _buildButton('.', Colors.grey.shade300, Colors.black),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: ElevatedButton(
                              onPressed: () => _buttonPressed('='),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green.shade600,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.all(20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 3,
                              ),
                              child: const Text(
                                '=',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

