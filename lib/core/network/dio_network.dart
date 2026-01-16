import 'package:dio/dio.dart';

class DioNetwork {
  static final DioNetwork _instance = DioNetwork._internal();

  factory DioNetwork() {
    return _instance;
  }

  late final Dio dio;

  DioNetwork._internal() : dio = Dio();
}
