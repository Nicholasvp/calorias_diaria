import 'package:get/get.dart';

class DashboardController extends GetxController with StateMixin {
  final RxInt _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(int value) => _selectedIndex.value = value;

  void changeIndex(int index) {
    if (index < 0) return;
    selectedIndex = index;
    change(selectedIndex, status: RxStatus.success());
  }

  void goToProfile() {
    changeIndex(2);
  }
}
