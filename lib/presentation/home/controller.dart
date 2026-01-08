import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt sum = 0.obs;
  TextEditingController textController = TextEditingController();

  /// Count the sum of all integers in a string, ignoring negative numbers.
  ///
  /// This function will take a string from the text controller, convert all non-digit
  /// characters to comma, split the string into a list of substrings, and then
  /// iterate over the list, parsing each substring into an integer. If the
  /// integer is negative, a snackbar will be shown with an error message and
  /// the function will return. Otherwise, the integer will be added to a temporary sum,
  /// which will be assigned to the sum observable at the end of the function.
  ///
  /// If the text controller's text is empty, the sum observable will be reset to 0.
  void countString() {
    if (textController.text.isNotEmpty) {
      sum.value = 0;
      int tempSum = 0;
      List<String> subValues = convertNonDigitsToComma(
        textController.text,
      ).split(",");
      List<int> negValues = [];
      for (final value in subValues) {
        final number = int.tryParse((value).trim());

        if (number != null) {
          if (number < 0) {
            negValues.add(number);
          }
          if (number > 0 && number < 1000) {
            tempSum += number;
          }
        }
      }
      if (negValues.isNotEmpty) {
        if (Get.overlayContext != null) {
          Get.snackbar(
            "Error",
            "Negative numbers (${negValues.join(",")}) is not allowed",
          );
        }
        return;
      }
      sum.value = tempSum;
    } else {
      sum.value = 0;
    }
  }

  /// A function that takes a string and replaces all non-digit characters with a comma.This allowes proper negative numbers only
  String convertNonDigitsToComma(String input) {
    return RegExp(
      r'(?<!\d)-?\d+',
    ).allMatches(input).map((m) => m.group(0)).join(',');
  }
}
