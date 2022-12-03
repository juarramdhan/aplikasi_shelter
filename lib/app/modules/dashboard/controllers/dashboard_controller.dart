import 'package:get/get.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController

  int selectedIndex = 0;

  void onItemTapped(int index) {
    selectedIndex = index;
    update();
  }
}
