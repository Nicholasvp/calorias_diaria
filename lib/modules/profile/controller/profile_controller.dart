import 'package:calorias_diaria/core/enums/enums.dart';
import 'package:calorias_diaria/core/models/profile_model.dart';
import 'package:calorias_diaria/core/routes/routes.dart';
import 'package:calorias_diaria/core/service/local_storage_service.dart';
import 'package:calorias_diaria/modules/articules/controller/articles_controller.dart';
import 'package:calorias_diaria/modules/result/controller/result_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController with StateMixin<ProfileModel> {
  final localStorageService = Get.find<LocalStorageService>();

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController generoController = TextEditingController();
  final TextEditingController nivelAtividadeFisicaController = TextEditingController();
  final TextEditingController objetivoController = TextEditingController();

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
      generoController.text = profile.genero;
      nivelAtividadeFisicaController.text = profile.nivelAtividadeFisica;
      objetivoController.text = profile.objetivo;
      change(profile, status: RxStatus.success());
    } else {
      final profile = ProfileModel.empty();
      nameController.text = profile.name;
      weightController.text = profile.weight > 0.0 ? profile.weight.toString() : '';
      change(profile, status: RxStatus.success());
    }
  }

  void saveProfile() async {
    if (!formKey.currentState!.validate()) return;

    change(null, status: RxStatus.loading());
    final profile = ProfileModel(
      name: nameController.text,
      weight: double.tryParse(weightController.text) ?? 0.0,
      height: double.tryParse(heightController.text) ?? 0.0,
      age: int.tryParse(ageController.text) ?? 0,
      genero: generoController.text,
      nivelAtividadeFisica: nivelAtividadeFisicaController.text,
      objetivo: objetivoController.text,
    );
    await Future.delayed(const Duration(seconds: 1));
    await localStorageService.saveData(profileKey, profile.toJson());

    change(profile, status: RxStatus.loading());

    final resultController = Get.find<ResultController>();
    resultController.calculateResult();

    final articlesController = Get.find<ArticlesController>();
    articlesController.getAll();
    await getProfile();
  }

  void clearProfile() async {
    //abrir modal de confirmação
    await Get.defaultDialog(
      title: 'Atenção',
      middleText: 'Deseja realmente limpar o perfil?',
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () async {
            Get.back();
            change(null, status: RxStatus.loading());
            await localStorageService.removeData(profileKey);
            await localStorageService.removeData(resultKey);
            Get.offAllNamed(Routes.dashboard);
          },
          child: const Text('Limpar'),
        ),
      ],
    );
  }
}
