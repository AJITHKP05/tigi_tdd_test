import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt sum = 0.obs;
  TextEditingController textController = TextEditingController();

  void countString() {
    if (textController.text.isNotEmpty) {
      sum.value = 0;
      int tempSum = 0;
      List<String> subValues = convertNonDigitsToComma(
        textController.text,
      ).split(",");
      for (final value in subValues) {
        final number = int.tryParse((value).trim());
        if (number != null) {
          tempSum += number;
        }
      }
      sum.value = tempSum;
    } else {
      sum.value = 0;
    }
  }

  String convertNonDigitsToComma(String input) {
    return input.replaceAll(RegExp(r'[^0-9]'), ',');
  }
}
