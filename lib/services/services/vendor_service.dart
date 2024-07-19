import 'package:assessment/services/api_service.dart';

class VendorService {
  final ApiService _apiService;
  VendorService() : _apiService = ApiService.dio();

  Future<dynamic> vendor(String id) async {
    return _apiService.get('/public-company-v3/192');
  }
}
