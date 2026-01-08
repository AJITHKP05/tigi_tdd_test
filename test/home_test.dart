import 'package:flutter_test/flutter_test.dart';
import 'package:tigi_tdd_test/presentation/home/controller.dart';

void main() {
  late HomeController homeController;

  setUp(() {
    homeController = HomeController();
  });

  test('should return home message', () {
    // Arrange
    homeController.textController.text = "1,2,3";

    // Act
    homeController.countString();

    // Assert
    expect(homeController.sum.value, 6);
  });
  test('should return home message', () {
    // Arrange
    homeController.textController.text = "1,2,3,1,1,";

    // Act
    homeController.countString();

    // Assert
    expect(homeController.sum.value, 8);
  });
}
