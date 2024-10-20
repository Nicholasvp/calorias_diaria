import 'package:calorias_diaria/core/routes/routes.dart';
import 'package:calorias_diaria/modules/dashboard/binding/dashboard_binding.dart';
import 'package:calorias_diaria/modules/dashboard/page/dashboard_page.dart';
import 'package:calorias_diaria/modules/profile/binding/profile_binding.dart';
import 'package:calorias_diaria/modules/result/binding/result_binding.dart';
import 'package:get/get.dart';

class AppPages {
  static const initial = Routes.dashboard;

  static final pages = [
    GetPage(
      name: Routes.dashboard,
      bindings: [
        DashboardBinding(),
        ProfileBinding(),
        ResultBinding(),
      ],
      page: () => const DashboardPage(),
    ),
  ];
}
