import 'package:calorias_diaria/core/enums/enums.dart';
import 'package:calorias_diaria/core/models/profile_model.dart';
import 'package:calorias_diaria/core/service/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController with StateMixin<ProfileModel> {
  final localStorageService = Get.find<LocalStorageService>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  void onReady() async {
    await getProfile();
    super.onReady();
  }

  Future<void> getProfile() async {
    change(null, status: RxStatus.loading());
    final json = await localStorageService.getData(profileKey);
    if (json != null && json.isNotEmpty) {
      final profile = ProfileModel.fromJson(json);
      nameController.text = profile.name;
      weightController.text = profile.weight > 0.0 ? profile.weight.toString() : '';
      heightController.text = profile.height > 0.0 ? profile.height.toString() : '';
      ageController.text = profile.age > 0 ? profile.age.toString() : '';
      change(profile, status: RxStatus.success());
    } else {
      final profile = ProfileModel.empty();
      nameController.text = profile.name;
      weightController.text = profile.weight > 0.0 ? profile.weight.toString() : '';
      change(profile, status: RxStatus.success());
    }
  }

  void saveProfile() async {
    change(null, status: RxStatus.loading());
    final profile = ProfileModel(
      name: nameController.text,
      weight: double.tryParse(weightController.text) ?? 0.0,
      height: double.tryParse(heightController.text) ?? 0.0,
      age: int.tryParse(ageController.text) ?? 0,
      genero: '',
      nivelAtividadeFisica: '',
      objetivo: '',
    );
    await Future.delayed(const Duration(seconds: 1));
    await localStorageService.saveData(profileKey, profile.toJson());
    await getProfile();
  }
}
