import 'package:assessment/services/api_service.dart';

class ExCouponService {
  final ApiService _apiService;
  ExCouponService() : _apiService = ApiService.dio();

  Future<dynamic> exCoupon(String id) async {
    return _apiService.get('/get-public-coupons-by-category/4');
  }
}
