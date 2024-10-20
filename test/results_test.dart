import 'dart:math';

import 'package:calorias_diaria/core/app/binding/app_binding.dart';
import 'package:calorias_diaria/core/models/profile_model.dart';
import 'package:calorias_diaria/core/models/result_model.dart';
import 'package:calorias_diaria/modules/profile/binding/profile_binding.dart';
import 'package:calorias_diaria/modules/result/binding/result_binding.dart';
import 'package:calorias_diaria/modules/result/controller/result_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('ResultController', () {
    late ResultController resultController;

    setUp(() {
      SharedPreferences.setMockInitialValues({});
      AppBinding().dependencies();
      ResultBinding().dependencies();
      ProfileBinding().dependencies();
      resultController = ResultController();
    });
    test('getResult', () async {
      await resultController.getResult();
      expect(resultController.state, isNotNull);
    });

    test('saveResult', () async {
      // Test the method saveResult
      resultController.saveResult(ResultModel.empty());
      await resultController.getResult();
      expect(resultController.state, ResultModel.empty());
    });

    test('calculateResult', () {
      // Test the method calculateResult

      // Create a profile
      resultController.profileController.change(ProfileModel(
        name: 'Test',
        weight: 70.0,
        height: 170.0,
        age: 30,
        genero: 'masculino',
        nivelAtividadeFisica: 'sedentario',
        objetivo: 'manter',
      ));

      // Calculate the result
      resultController.calculateResult();

      // Check if the result is correct
      expect(resultController.state!.taxaMetabolicaBasal, 2116.44);
    });
  });
}
