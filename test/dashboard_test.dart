import 'package:calorias_diaria/modules/dashboard/controller/dashboard_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DashboardController', () {
    late DashboardController dashboardController;

    setUp(() {
      dashboardController = DashboardController();
    });

    test('Initial page index should be 0', () {
      expect(dashboardController.selectedIndex, 0);
    });

    test('Should change page index', () {
      dashboardController.changeIndex(1);
      expect(dashboardController.selectedIndex, 1);

      dashboardController.changeIndex(2);
      expect(dashboardController.selectedIndex, 2);
    });

    test('Should not change page index to invalid value', () {
      dashboardController.changeIndex(-1);
      expect(dashboardController.selectedIndex, 0);
    });
  });
}
