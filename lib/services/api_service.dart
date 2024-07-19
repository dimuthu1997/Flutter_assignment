import 'package:assessment/services/api_provider.dart';
import 'package:assessment/services/dio_api_provider.dart';

class ApiService implements ApiProvider {
  final ApiProvider provider;
  const ApiService(this.provider);

  factory ApiService.dio() => ApiService(DioApiProvider());

  @override
  Future<dynamic> get(String url, {Map<String, dynamic>? params}) =>
      provider.get(url, params: params);
}
