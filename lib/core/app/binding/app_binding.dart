import 'package:calorias_diaria/core/service/api_service.dart';
import 'package:calorias_diaria/core/service/local_storage_service.dart';
import 'package:get/get.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      LocalStorageService(),
    );
    Get.put(
      ApiService(),
    );
  }
}
