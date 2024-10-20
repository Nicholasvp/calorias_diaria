import 'package:dio/dio.dart';
import 'package:get/get_utils/get_utils.dart';

class ApiService {
  final Dio dio = Dio();
  final String baseUrl = 'https://api.npoint.io/cd5cc92e412c4058c90d';

  Future<Response?> getAll() async {
    try {
      return await dio.get(baseUrl);
    } catch (e) {
      printInfo(info: e.toString());
      return null;
    }
  }
}
