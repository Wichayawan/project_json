// pages/cart_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_json/pages/profile_page.dart';
import ' product_page.dart';
import '../controller/Cart_Controller.dart';
import '../model/product_model.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Page'),
        backgroundColor: const Color(0xFFF8BBD0), // Pastel Pink Primary
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return const Center(child: Text('No items in the cart'));
        } else {
          return ListView.builder(
            itemCount: cartController.cartItems.length,
            itemBuilder: (context, index) {
              final ProductModel product = cartController.cartItems[index];
              return Card(
                color: index.isEven ? const Color(0xFFFCE4EC) : const Color(0xFFF8BBD0), // Pastel Pink Shade
                child: ListTile(
                  leading: Image.network(product.imageUrl),
                  title: Text(product.title),
                  subtitle: Text('\$${product.price}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle),
                    onPressed: () {
                      cartController.removeFromCart(product); // ลบสินค้าออกจากตะกร้า
                    },
                  ),
                ),
              );
            },
          );
        }
      }),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFF8BBD0), // Pastel Pink Primary
        selectedItemColor: const Color(0xFFEC407A), // Consistent pastel color for selected items
        unselectedItemColor: const Color(0xFFEC407A), // Consistent pastel color for unselected items
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            // Navigate to ProductPage
            Get.off(() => ProductPage());
          } else if (index == 1) {
            // Stay on CartPage
            Get.off(() => CartPage());
          } else if (index == 2) {
            // Navigate to ProfilePage
            Get.to(() => ProfilePage());
          }
        },
      ),
    );
  }
}