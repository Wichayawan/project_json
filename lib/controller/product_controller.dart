// controller/product_controller.dart
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/product_model.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var products = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() async {
    try {
      isLoading(true);
      String url = "https://dummyjson.com/products";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(res.body);
        var productList = jsonData['products'] as List;
        products.value = productList
            .map((productJson) => ProductModel.fromJson(productJson))
            .toList();
      } else {
        print('Failed to load products');
      }
    } catch (e) {
      print("Error occurred: $e");
    } finally {
      isLoading(false);
    }
  }
}
