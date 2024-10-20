import 'package:calorias_diaria/modules/articules/controller/articles_controller.dart';
import 'package:get/get.dart';

class ArticlesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticlesController());
  }
}
