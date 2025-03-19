import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/product_model.dart';

class CartController extends GetxController {
  var cartItems = <ProductModel>[].obs;

  // ฟังก์ชันสำหรับเพิ่มสินค้าในตะกร้า
  void addToCart(ProductModel product) {
    Get.showOverlay(
      asyncFunction: () async {
        await Future.delayed(Duration(seconds: 2)); // จำลองการดำเนินการ เช่น รอ API หรือประมวลผล

        if (!cartItems.any((item) => item.id == product.id)) {
          cartItems.add(product);
          Get.back(); // ปิด Product Detail Dialog ถ้าเปิดอยู่

          // แจ้งว่าการเพิ่มสินค้าในตะกร้าสำเร็จ
          Get.snackbar(
            "Added to Cart",
            "${product.title} has been added to your cart.",
            icon: Icon(Icons.check_circle_outline, color: Colors.green),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.white,
            borderRadius: 10,
            margin: EdgeInsets.all(10),
            colorText: Colors.black,
            duration: Duration(seconds: 2),
          );
        } else {
          Get.back(); // ปิด Product Detail Dialog ถ้าเปิดอยู่

          // แจ้งว่าสินค้าอยู่ในตะกร้าแล้ว
          Get.snackbar(
            "Product already in Cart",
            "${product.title} is already in your cart.",
            icon: Icon(Icons.info_outline, color: Colors.orange),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.white,
            borderRadius: 10,
            margin: EdgeInsets.all(10),
            colorText: Colors.black,
            duration: Duration(seconds: 2),
          );
        }
      },
      loadingWidget: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  // ฟังก์ชันสำหรับลบสินค้าออกจากตะกร้า
  void removeFromCart(ProductModel product) {
    Get.showOverlay(
      asyncFunction: () async {
        await Future.delayed(Duration(seconds: 2)); // จำลองการประมวลผล

        cartItems.remove(product);

        // แจ้งว่าการลบสินค้าออกสำเร็จ
        Get.snackbar(
          "Removed from Cart",
          "${product.title} has been removed from your cart.",
          icon: Icon(Icons.remove_circle_outline, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          borderRadius: 10,
          margin: EdgeInsets.all(10),
          colorText: Colors.black,
          duration: Duration(seconds: 2),
        );
      },
      loadingWidget: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  int get totalItems => cartItems.length;

  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);
}
