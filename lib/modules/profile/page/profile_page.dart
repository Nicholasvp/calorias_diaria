import 'package:calorias_diaria/core/enums/enums.dart';
import 'package:calorias_diaria/core/widgets/buttons/button_primary.dart';
import 'package:calorias_diaria/core/widgets/dropdown/dropdown_primary.dart';
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
      body: controller.obx(
        (state) => Padding(
          padding: const EdgeInsets.all(32),
          child: ListView(
            children: [
              TextFieldPrimary(
                controller: controller.nameController,
                label: 'Nome',
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Flexible(
                    child: TextFieldPrimary(
                      controller: controller.weightController,
                      label: 'Peso (em kg)',
                    ),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    child: TextFieldPrimary(
                      controller: controller.heightController,
                      label: 'Altura (em cm)',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Flexible(
                    child: TextFieldPrimary(
                      controller: controller.ageController,
                      label: 'Idade',
                    ),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    child: DropdownPrimary(
                      label: 'Gênero',
                      items: generoStringMap,
                      controller: controller.generoController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              DropdownPrimary(
                label: 'Nivel de Atividade Física',
                items: nivelAtividadeFisicaStringMap,
                controller: controller.nivelAtividadeFisicaController,
              ),
              const SizedBox(height: 20),
              DropdownPrimary(
                label: 'Objetivo',
                items: objetivoStringMap,
                controller: controller.objetivoController,
              ),
              const SizedBox(height: 20),
              ButtonPrimary(
                label: 'SALVAR',
                onPressed: controller.saveProfile,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
