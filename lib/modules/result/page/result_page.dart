import 'package:calorias_diaria/core/widgets/buttons/button_primary.dart';
import 'package:calorias_diaria/modules/dashboard/controller/dashboard_controller.dart';
import 'package:calorias_diaria/modules/result/controller/result_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultPage extends GetView<ResultController> {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.find<DashboardController>();
    return Scaffold(
      body: controller.obx(
        (state) => Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Taxa Metabólica Basal',
                              style: Get.textTheme.bodyLarge,
                            ),
                            IconButton(
                              icon: const Icon(Icons.question_mark_rounded),
                              onPressed: () {
                                controller.showDialogInfo();
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text.rich(
                          TextSpan(
                            text: state?.taxaMetabolicaBasal.toStringAsFixed(2),
                            style: Get.textTheme.headlineLarge,
                            children: [
                              TextSpan(
                                text: ' cal/dia',
                                style: Get.textTheme.headlineSmall,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        onEmpty: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Seja bem vindo!', style: Get.textTheme.headlineSmall),
              Padding(
                padding: const EdgeInsets.all(32),
                child: ButtonPrimary(
                  onPressed: () {
                    dashboardController.goToProfile();
                  },
                  label: 'Calcular minha taxa metabólica basal',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
