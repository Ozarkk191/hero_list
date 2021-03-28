import 'dart:developer';

import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    forTest();

    super.initState();
  }

  forTest() {
    int input = 4;
    int length = 100;
    log("input : $input");
    log("length : $length");
    log("-------------------------------");
    var check =
        calculate(input, length).where((element) => element == true).toList();

    if (check.length == 2) {
      log("Pirme : $input");
    } else {
      int down = input - 1;
      int up = input + 1;
      for (var i = down; i >= 0; i--) {
        var check =
            calculate(i, length).where((element) => element == true).toList();
        if (check.length == 2) {
          down = i;
          i = 0;
        }
      }
      for (var i = up; i <= length; i++) {
        var check =
            calculate(i, length).where((element) => element == true).toList();
        if (check.length == 2) {
          up = i;
          i = length;
        }
      }
      log("Pirme : $down และ $up");
    }
  }

  List<bool> calculate(int input, int length) {
    List<bool> checkPirmeNumber = <bool>[];
    for (var i = 1; i <= length; i++) {
      if (input % i == 0) {
        checkPirmeNumber.add(true);
      } else {
        checkPirmeNumber.add(false);
      }
    }
    return checkPirmeNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
