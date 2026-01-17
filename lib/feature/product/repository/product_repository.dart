import 'package:app/core/network/dio_network.dart';
import 'package:app/feature/product/model/product_model.dart';
import 'package:dio/dio.dart';

class ProductRepository {
  Future<ProductModel> fetchProducts() async {
    Response response = await DioNetwork().dio.get('https://dummyjson.com/products'); 
    if (response.statusCode == 200) {
      return ProductModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
