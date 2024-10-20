import 'package:calorias_diaria/core/enums/enums.dart';
import 'package:calorias_diaria/core/models/result_model.dart';
import 'package:calorias_diaria/core/service/local_storage_service.dart';
import 'package:calorias_diaria/modules/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ResultController extends GetxController with StateMixin<ResultModel> {
  final localStorageService = Get.find<LocalStorageService>();
  final profileController = Get.find<ProfileController>();

  get profile => profileController.state;

  @override
  void onReady() async {
    await getResult();
    super.onReady();
  }

  Future<void> getResult() async {
    change(null, status: RxStatus.loading());
    final json = await localStorageService.getData(resultKey);
    if (json != null && json.isNotEmpty) {
      final result = ResultModel.fromJson(json);
      change(result, status: RxStatus.success());
    } else {
      final result = ResultModel.empty();
      change(result, status: RxStatus.empty());
    }
  }

  void saveResult(ResultModel result) async {
    change(null, status: RxStatus.loading());
    await Future.delayed(const Duration(seconds: 1));
    await localStorageService.saveData(resultKey, result.toJson());
    await getResult();
  }

  void calculateResult() {
    final genero = generoEnumMap[profile.genero];
    final objetivo = objetivoEnumMap[profile.objetivo];
    final nivelAtividadeFisica = nivelAtividadeFisicaEnumMap[profile.nivelAtividadeFisica];

    double taxaMetabolicaBasal = 0.0;

    // TMB (homens) = 88,362 + (13,397 x peso em kg) + (4,799 x altura em cm) - (5,677 x idade em anos).
    // TMB (mulheres) = 447,593 + (9,247 x peso em kg) + (3,098 x altura em cm) - (4,330 x idade em anos)

    if (genero == Genero.masculino) {
      taxaMetabolicaBasal = 88.362 + (13.397 * profile.weight) + (4.799 * profile.height) - (5.677 * profile.age);
    } else {
      taxaMetabolicaBasal = 447.593 + (9.247 * profile.weight) + (3.098 * profile.height) - (4.330 * profile.age);
    }

    // 2. Fator de Atividade Física:
    // Para calcular as calorias diárias totais, a TMB é multiplicada por um fator que representa o
    // nível de atividade física do usuário:
    // ● Sedentário: TMB × 1.2
    // ● Levemente ativo: TMB × 1.375
    // ● Moderadamente ativo: TMB × 1.55
    // ● Muito ativo: TMB × 1.725

    switch (nivelAtividadeFisica) {
      case NivelAtividadeFisica.sedentario:
        taxaMetabolicaBasal *= 1.2;
        break;
      case NivelAtividadeFisica.leve:
        taxaMetabolicaBasal *= 1.375;
        break;
      case NivelAtividadeFisica.moderado:
        taxaMetabolicaBasal *= 1.55;
        break;
      case NivelAtividadeFisica.ativo:
        taxaMetabolicaBasal *= 1.725;
        break;
      case NivelAtividadeFisica.muitoIntenso:
        taxaMetabolicaBasal *= 1.9;
        break;
      case null:
        break;
    }

    // 3. Calorias para Ganho ou Perda de Peso:
    // Com base no objetivo do usuário, o cálculo das calorias diárias é ajustado:
    // ● Perda de peso: reduzir 20% das calorias diárias totais.
    // ● Ganho de peso: aumentar 15% das calorias diárias totais.

    switch (objetivo) {
      case Objetivo.perderPeso:
        taxaMetabolicaBasal *= 0.8;
        break;
      case Objetivo.ganharPeso:
        taxaMetabolicaBasal *= 1.15;
        break;
      case null:
        break;
    }

    final result = ResultModel(taxaMetabolicaBasal: taxaMetabolicaBasal.toPrecision(2));

    saveResult(result);
  }

  void showDialogInfo() {
    Get.defaultDialog(
      title: 'Taxa Metabólica Basal',
      titlePadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.all(16),
      content: const Column(
        children: [
          Text(
            'A Taxa Metabólica Basal (TMB) é a quantidade mínima de energia que o organismo necessita para manter as funções vitais em repouso.',
          ),
          SizedBox(height: 10),
          Text(
            'O cálculo da TMB é baseado no gênero, idade, peso, altura e nível de atividade física do indivíduo.',
          ),
        ],
      ),
      textConfirm: 'OK',
      confirmTextColor: Colors.white,
      onConfirm: () => Get.back(),
    );
  }
}
