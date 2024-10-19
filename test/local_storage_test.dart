import 'package:calorias_diaria/core/models/profile_model.dart';
import 'package:calorias_diaria/core/service/local_storage_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('LocalStorageService Tests', () {
    late LocalStorageService localStorageService;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});

      localStorageService = LocalStorageService();
    });

    test('Should save data', () async {
      await localStorageService.saveData('key', 'value');
      String? value = await localStorageService.getData('key');

      expect(value, 'value');
    });

    test('Should remove data', () async {
      await localStorageService.saveData('key', 'value');
      await localStorageService.removeData('key');
      String? value = await localStorageService.getData('key');
      expect(value, '');
    });

    test('Should update data', () async {
      await localStorageService.saveData('key', 'initialValue');
      await localStorageService.saveData('key', 'updatedValue');
      String? value = await localStorageService.getData('key');

      expect(value, 'updatedValue');
    });

    test('Shloud save json data', () async {
      final profile = ProfileModel.empty();
      await localStorageService.saveData('key', profile.toJson());
      String? value = await localStorageService.getData('key');

      final profileSaved = ProfileModel.fromJson(value!);

      expect(profileSaved.name, '');
    });
  });
}
