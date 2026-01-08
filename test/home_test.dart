import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:tigi_tdd_test/presentation/home/controller.dart';

void main() {
  late HomeController homeController;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    homeController = HomeController();
    Get.testMode = true;
  });
  tearDown(() {
    homeController.textController.dispose();
  });
  test('should return exact sum from the input string', () {
    // Arrange
    homeController.textController.text = "1,2,3";

    // Act
    homeController.countString();

    // Assert
    expect(homeController.sum.value, 6);
  });
  test('should return exact sum from the input and avoid the empty string', () {
    // Arrange
    homeController.textController.text = "1,2,3,1,1,";

    // Act
    homeController.countString();

    // Assert
    expect(homeController.sum.value, 8);
  });
  test('should return exact sum and avoid the delimiters', () {
    // Arrange
    homeController.textController.text = "1,:2,sd3,1,1,";

    // Act
    homeController.countString();

    // Assert
    expect(homeController.sum.value, 8);
  });
  test('should return exact sum and avoid the multiple delimiters', () {
    // Arrange
    homeController.textController.text = "//;\n1;2";

    // Act
    homeController.countString();

    // Assert
    expect(homeController.sum.value, 3);
  });

  test("should show snakbar on negative input value", () {
    // Arrange
    homeController.textController.text = "//;\n1,-2";

    // Act
    homeController.countString();

    // Assert
    expect(homeController.sum.value, 0);
  });
  test("should skips values greater than 1000", () {
    // Arrange
    homeController.textController.text = "//2,3000,1";

    // Act
    homeController.countString();

    // Assert
    expect(homeController.sum.value, 3);
  });
}
