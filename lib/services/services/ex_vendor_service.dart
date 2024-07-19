import 'package:assessment/services/api_service.dart';

class ExVendorService {
  final ApiService _apiService;
  ExVendorService() : _apiService = ApiService.dio();

  Future<dynamic> exVendor(String id) async {
    return _apiService.get('/get-company-by-category/4');
  }
}
