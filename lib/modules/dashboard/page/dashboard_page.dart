import 'package:calorias_diaria/modules/articules/page/articles_page.dart';
import 'package:calorias_diaria/modules/dashboard/controller/dashboard_controller.dart';
import 'package:calorias_diaria/modules/profile/page/profile_page.dart';
import 'package:calorias_diaria/modules/result/page/result_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.selectedIndex,
          children: const [
            ResultPage(),
            ArticlesPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex,
          onTap: controller.changeIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: 'Resultados',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Artigos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}
