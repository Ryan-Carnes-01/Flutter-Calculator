// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MainAppState(),
        child: const MaterialApp(
          title: 'Flutter Calculator',
          home: MainHomePage(),
        ));
  }
}

class MainAppState extends ChangeNotifier {
  double leftOperand = 0, rightOperand = 0, result = 0;
  int operation = -1;

  clearEvaluation() {
    leftOperand = 0;
    rightOperand = 0;
    result = 0;
    operation = -1;
    print('LEFTOPERAND: $leftOperand');
    print('RIGHTOPERAND: $rightOperand');
    print('RESULT: $result');
    print('OPERATION: $operation');
    notifyListeners();
  }

  popNum() {}

  pushNum(double num) {
    if (operation < 0) {
      if (leftOperand == 0) {
        leftOperand = num;
      } else {
        leftOperand = (leftOperand * 10) + num;
      }
    } else {
      if (rightOperand == 0) {
        rightOperand = num;
      } else {
        rightOperand = (rightOperand * 10) + num;
      }
    }
    print('LEFT OPERAND: $leftOperand');
    print('RIGHT OPERAND: $rightOperand');
    notifyListeners();
  }

  setOp(int op) {
    operation = op;
    print('OPERATION: $operation');
    notifyListeners();
  }

  performEvaluation() {
    switch (operation) {
      case 0:
        result = leftOperand + rightOperand;
        break;
      case 1:
        result = leftOperand - rightOperand;
        break;
      case 2:
        result = leftOperand * rightOperand;
        break;
      case 3:
        if (rightOperand == 0) {/*divideby0error*/}
        result = leftOperand / rightOperand;
        break;
      case 4:
        result = leftOperand * leftOperand;
        break;
    }
    print('RESULT: $result');
    notifyListeners();

    //reset stuff?
  }
}

class MainHomePage extends StatelessWidget {
  const MainHomePage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MainAppState>();

    void handleCLR() {
      appState.clearEvaluation();
    }

    void handleBACK() {
      print('BACK PRESSED');
    }

    void handleNUM(double num) {
      appState.pushNum(num);
    }

    void handleOP(int op) {
      appState.setOp(op);
    }

    void handleEVAL() {
      appState.performEvaluation();
    }

    void handleSQR() {
      appState.setOp(4);
      appState.performEvaluation();
    }

    void handleERROR() {
      print('ERROR');
    }

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1.0,
      ),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return ElevatedButton(
              onPressed: handleCLR,
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                  side: BorderSide(color: Colors.black),
                )),
              ),
              child: const Text('CLR'),
            );
          case 1:
            return ElevatedButton(
              onPressed: handleBACK,
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                  side: BorderSide(color: Colors.black),
                )),
              ),
              child: const Text('BACK'),
            );
          case 2:
            return ElevatedButton(
              onPressed: handleSQR,
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                  side: BorderSide(color: Colors.black),
                )),
              ),
              child: const Text('x^2'),
            );
          case 3:
            return ElevatedButton(
              onPressed: () => handleOP(0),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                  side: BorderSide(color: Colors.black),
                )),
              ),
              child: const Text('+'),
            );
          case 4:
            return ElevatedButton(
              onPressed: () => handleNUM(7),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                  side: BorderSide(color: Colors.black),
                )),
              ),
              child: const Text('7'),
            );
          case 5:
            return ElevatedButton(
              onPressed: () => handleNUM(8),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                  side: BorderSide(color: Colors.black),
                )),
              ),
              child: const Text('8'),
            );
          case 6:
            return ElevatedButton(
              onPressed: () => handleNUM(9),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                  side: BorderSide(color: Colors.black),
                )),
              ),
              child: const Text('9'),
            );
          case 7:
            return ElevatedButton(
              onPressed: () => handleOP(1),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                  side: BorderSide(color: Colors.black),
                )),
              ),
              child: const Text('-'),
            );
          case 8:
            return ElevatedButton(
              onPressed: () => handleNUM(4),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                  side: BorderSide(color: Colors.black),
                )),
              ),
              child: const Text('4'),
            );
          case 9:
            return ElevatedButton(
              onPressed: () => handleNUM(5),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                  side: BorderSide(color: Colors.black),
                )),
              ),
              child: const Text('5'),
            );
          case 10:
            return ElevatedButton(
              onPressed: () => handleNUM(6),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                  side: BorderSide(color: Colors.black),
                )),
              ),
              child: const Text('6'),
            );
          case 11:
            return ElevatedButton(
              onPressed: () => handleOP(2),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                  side: BorderSide(color: Colors.black),
                )),
              ),
              child: const Text('x'),
            );
          case 12:
            return ElevatedButton(
              onPressed: () => handleNUM(1),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                  side: BorderSide(color: Colors.black),
                )),
              ),
              child: const Text('1'),
            );
          case 13:
            return ElevatedButton(
              onPressed: () => handleNUM(2),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                  side: BorderSide(color: Colors.black),
                )),
              ),
              child: const Text('2'),
            );
          case 14:
            return ElevatedButton(
              onPressed: () => handleNUM(3),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                  side: BorderSide(color: Colors.black),
                )),
              ),
              child: const Text('3'),
            );
          case 15:
            return ElevatedButton(
              onPressed: () => handleOP(3),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                  side: BorderSide(color: Colors.black),
                )),
              ),
              child: const Text('/'),
            );
          case 16:
            return ElevatedButton(
              onPressed: () => handleOP(5),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                  side: BorderSide(color: Colors.black),
                )),
              ),
              child: const Text('+/-'),
            );
          case 17:
            return ElevatedButton(
              onPressed: () => handleNUM(0),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                  side: BorderSide(color: Colors.black),
                )),
              ),
              child: const Text('0'),
            );
          case 18:
            return ElevatedButton(
              onPressed: () => handleOP(6),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                  side: BorderSide(color: Colors.black),
                )),
              ),
              child: const Text('.'),
            );
          case 19:
            return ElevatedButton(
              onPressed: handleEVAL,
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                  side: BorderSide(color: Colors.black),
                )),
              ),
              child: const Text('='),
            );
          default:
            return ElevatedButton(
              onPressed: handleERROR,
              child: const Text('ERROR'),
            );
        }
      },
    );
  }
}
