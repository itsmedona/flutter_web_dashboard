// main_controller.dart
import 'package:get/get.dart';

class MainController extends GetxController {
  var selectedItemIndex = 0.obs;

  void selectItem(int index) {
    selectedItemIndex.value = index;
  }
}
