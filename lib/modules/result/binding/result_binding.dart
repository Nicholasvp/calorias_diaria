import 'package:calorias_diaria/modules/result/controller/result_controller.dart';
import 'package:get/get.dart';

class ResultBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResultController());
  }
}
