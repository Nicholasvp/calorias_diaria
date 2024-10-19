import 'package:calorias_diaria/core/widgets/buttons/button_primary.dart';
import 'package:calorias_diaria/core/widgets/fields/text_field_primary.dart';
import 'package:calorias_diaria/modules/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: ListView(
          children: [
            TextFieldPrimary(
              controller: controller.nameController,
              label: 'Nome',
            ),
            const SizedBox(height: 20),
            TextFieldPrimary(
              controller: controller.weightController,
              label: 'Peso (em kg)',
            ),
            const SizedBox(height: 20),
            TextFieldPrimary(
              controller: controller.heightController,
              label: 'Altura (em cm)',
            ),
            const SizedBox(height: 20),
            TextFieldPrimary(
              controller: controller.ageController,
              label: 'Idade',
            ),
            const SizedBox(height: 20),
            GetBuilder<ProfileController>(
              builder: (context) {
                return ButtonPrimary(
                  label: 'SALVAR',
                  onPressed: controller.saveProfile,
                  isLoading: controller.status.isLoading,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
