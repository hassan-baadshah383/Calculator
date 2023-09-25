import 'package:flutter/material.dart';

import 'package:math_expressions/math_expressions.dart';

import 'package:calculator/widgets/oval_button.dart';
import 'package:calculator/widgets/rounded_button.dart';

const Color colorDark = Color(0xFF374352);
const Color colorLight = Color(0xFFe6eeff);

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  bool darkMode = true;
  String message = '';
  double answer = 0;

  void showMessage(String text) {
    if (message == 'Error') {
      setState(() {
        message = text;
      });
    } else {
      setState(() {
        message += text.toString();
      });
    }
  }

  void eraseInput() {
    setState(() {
      message = '';
      answer = 0;
    });
  }

  void backspaceInput() {
    if (message.isEmpty) {
      return;
    } else {
      setState(() {
        message = message.substring(0, message.length - 1);
      });
    }
  }

  void calculate() {
    final msg = message.replaceAll('x', '*');
    try {
      Parser parse = Parser();
      Expression exp = parse.parse(msg);
      ContextModel ctx = ContextModel();
      final result = exp.evaluate(EvaluationType.REAL, ctx);
      // int decimalPointIndex = result.indexOf('.');
      // for(int i = decimalPointIndex; i <=result.length; i++){

      // }
      setState(() {
        answer = result;
        message = '';
      });
    } catch (error) {
      setState(() {
        message = 'Error';
      });
    }
  }

  void switchMode() {
    setState(() {
      darkMode = !darkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: darkMode == true ? colorDark : colorLight,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          GestureDetector(
            onTap: () => switchMode(),
            child: Container(
              margin: const EdgeInsets.only(top: 40),
              padding: const EdgeInsets.all(10),
              height: 40,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: darkMode == true
                    ? const Color(0xFF374352)
                    : Colors.grey[400],
                boxShadow: [
                  BoxShadow(
                    color: darkMode ? Colors.black54 : Colors.blueGrey.shade200,
                    offset: const Offset(4.0, 4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ),
                  BoxShadow(
                      color: darkMode ? Colors.blueGrey.shade700 : Colors.white,
                      offset: const Offset(-4.0, -4.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0)
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.wb_sunny,
                    color: Colors.green,
                  ),
                  Icon(Icons.nightlight_outlined,
                      color: darkMode == true ? Colors.white : Colors.black)
                ],
              ),
            ),
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                height: 0.35 * deviceSize.height,
                width: deviceSize.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FittedBox(
                      child: Text(
                        answer.toString(),
                        style: TextStyle(
                          color: darkMode == true ? Colors.white : Colors.black,
                          fontSize: 50,
                        ),
                      ),
                    ),
                    FittedBox(
                        child: Text(
                      message.isEmpty ? '0' : message,
                      style: TextStyle(
                        color: darkMode == true ? Colors.green : Colors.grey,
                        fontSize: 25,
                      ),
                    )),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                height: 0.65 * deviceSize.height,
                width: deviceSize.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OvalButton(
                            text: 'sin',
                            onPressed: () => showMessage('sin'),
                            darkMode: darkMode,
                          ),
                          OvalButton(
                            text: 'cos',
                            onPressed: () => showMessage('cos'),
                            darkMode: darkMode,
                          ),
                          OvalButton(
                            text: 'tan',
                            onPressed: () => showMessage('tan'),
                            darkMode: darkMode,
                          ),
                          OvalButton(
                            text: '%',
                            onPressed: () => showMessage('%'),
                            darkMode: darkMode,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RoundedButton(
                            text: 'C',
                            textColor: darkMode == true
                                ? Colors.green
                                : Colors.red[900],
                            icon: null,
                            iconColor: null,
                            onPressed: () => eraseInput(),
                            darkMode: darkMode,
                          ),
                          RoundedButton(
                            text: '(',
                            textColor:
                                darkMode == true ? Colors.white : Colors.black,
                            icon: null,
                            iconColor: null,
                            onPressed: () => showMessage('('),
                            darkMode: darkMode,
                          ),
                          RoundedButton(
                            text: ')',
                            textColor:
                                darkMode == true ? Colors.white : Colors.black,
                            icon: null,
                            iconColor: null,
                            onPressed: () => showMessage(')'),
                            darkMode: darkMode,
                          ),
                          RoundedButton(
                            text: '/',
                            textColor: darkMode == true
                                ? Colors.green
                                : Colors.red[900],
                            icon: null,
                            iconColor: null,
                            onPressed: () => showMessage('/'),
                            darkMode: darkMode,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RoundedButton(
                            text: '7',
                            textColor:
                                darkMode == true ? Colors.white : Colors.black,
                            icon: null,
                            iconColor: null,
                            onPressed: () => showMessage('7'),
                            darkMode: darkMode,
                          ),
                          RoundedButton(
                            text: '8',
                            textColor:
                                darkMode == true ? Colors.white : Colors.black,
                            icon: null,
                            iconColor: null,
                            onPressed: () => showMessage('8'),
                            darkMode: darkMode,
                          ),
                          RoundedButton(
                            text: '9',
                            textColor:
                                darkMode == true ? Colors.white : Colors.black,
                            icon: null,
                            iconColor: null,
                            onPressed: () => showMessage('9'),
                            darkMode: darkMode,
                          ),
                          RoundedButton(
                            text: 'X',
                            textColor: darkMode == true
                                ? Colors.green
                                : Colors.red[900],
                            icon: null,
                            iconColor: null,
                            onPressed: () => showMessage('x'),
                            darkMode: darkMode,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RoundedButton(
                            text: '4',
                            textColor:
                                darkMode == true ? Colors.white : Colors.black,
                            icon: null,
                            iconColor: null,
                            onPressed: () => showMessage('4'),
                            darkMode: darkMode,
                          ),
                          RoundedButton(
                            text: '5',
                            textColor:
                                darkMode == true ? Colors.white : Colors.black,
                            icon: null,
                            iconColor: null,
                            onPressed: () => showMessage('5'),
                            darkMode: darkMode,
                          ),
                          RoundedButton(
                            text: '6',
                            textColor:
                                darkMode == true ? Colors.white : Colors.black,
                            icon: null,
                            iconColor: null,
                            onPressed: () => showMessage('6'),
                            darkMode: darkMode,
                          ),
                          RoundedButton(
                            text: '-',
                            textColor: darkMode == true
                                ? Colors.green
                                : Colors.red[900],
                            icon: null,
                            iconColor: null,
                            onPressed: () => showMessage('-'),
                            darkMode: darkMode,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RoundedButton(
                            text: '1',
                            textColor:
                                darkMode == true ? Colors.white : Colors.black,
                            icon: null,
                            iconColor: null,
                            onPressed: () => showMessage('1'),
                            darkMode: darkMode,
                          ),
                          RoundedButton(
                            text: '2',
                            textColor:
                                darkMode == true ? Colors.white : Colors.black,
                            icon: null,
                            iconColor: null,
                            onPressed: () => showMessage('2'),
                            darkMode: darkMode,
                          ),
                          RoundedButton(
                            text: '3',
                            textColor:
                                darkMode == true ? Colors.white : Colors.black,
                            icon: null,
                            iconColor: null,
                            onPressed: () => showMessage('3'),
                            darkMode: darkMode,
                          ),
                          RoundedButton(
                            text: '+',
                            textColor: darkMode == true
                                ? Colors.green
                                : Colors.red[900],
                            icon: null,
                            iconColor: null,
                            onPressed: () => showMessage('+'),
                            darkMode: darkMode,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RoundedButton(
                            text: '0',
                            textColor:
                                darkMode == true ? Colors.white : Colors.black,
                            icon: null,
                            iconColor: null,
                            onPressed: () => showMessage('0'),
                            darkMode: darkMode,
                          ),
                          RoundedButton(
                            text: ',',
                            textColor:
                                darkMode == true ? Colors.white : Colors.black,
                            icon: null,
                            iconColor: null,
                            onPressed: () => showMessage(','),
                            darkMode: darkMode,
                          ),
                          RoundedButton(
                            text: null,
                            textColor:
                                darkMode == true ? Colors.white : Colors.black,
                            icon: Icons.backspace_outlined,
                            iconColor: darkMode == true
                                ? Colors.green
                                : Colors.red[900],
                            onPressed: () => backspaceInput(),
                            darkMode: darkMode,
                          ),
                          RoundedButton(
                            text: '=',
                            textColor: darkMode == true
                                ? Colors.green
                                : Colors.red[900],
                            icon: null,
                            iconColor: null,
                            onPressed: () => calculate(),
                            darkMode: darkMode,
                          ),
                        ],
                      )
                    ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
