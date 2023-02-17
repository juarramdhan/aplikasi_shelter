import 'package:get/get.dart';

class AdminController extends GetxController {
  //TODO: Implement AdminController

  final count = 0.obs;

  int selectedIndex = 0;

  void onItemTapped(int index) {
    selectedIndex = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
