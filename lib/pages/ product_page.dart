// pages/product_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_json/pages/profile_page.dart';
import '../controller/Cart_Controller.dart';
import '../controller/product_controller.dart';
import '../model/product_model.dart';
import 'cart_page.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final ProductController myProductController = Get.put(ProductController());
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Page'),
        backgroundColor: const Color(0xFFF8BBD0), // Pastel Pink Primary
      ),
      body: Obx(() {
        if (myProductController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: myProductController.products.length,
            itemBuilder: (context, index) {
              final ProductModel product = myProductController.products[index] as ProductModel;
              return Card(
                color: index.isEven ? const Color(0xFFFCE4EC) : const Color(0xFFF8BBD0), // Pastel Pink Shades
                child: ListTile(
                  leading: Image.network(product.imageUrl),
                  title: Text(product.title),
                  subtitle: Text('\$${product.price}'),
                  onTap: () {
                    // Show product details using Get.defaultDialog()
                    Get.defaultDialog(
                      title: "Product Detail",
                      content: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              product.title,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            Image.network(
                              product.imageUrl,
                              height: 150,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              product.description,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            Text('Category: ${product.category}'),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Rating: ${product.rating}'),
                                const SizedBox(width: 5),
                                ...List.generate(
                                  5,
                                      (starIndex) => Icon(
                                    Icons.star,
                                    color: starIndex < product.rating ? Colors.yellow : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        ElevatedButton.icon(
                          onPressed: () {
                            // Add product to the cart
                            cartController.addToCart(product);
                          },
                          icon: const Icon(Icons.add_shopping_cart),
                          label: const Text('Add to Cart'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF48FB1), // Pastel Pink Accent
                            foregroundColor: Colors.black,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.back(); // Close dialog
                          },
                          child: const Text('Close'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF8BBD0), // Pastel Pink Primary
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          );
        }
      }),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFF8BBD0), // Pastel Pink Primary
        selectedItemColor: const Color(0xFFEC407A), // Consistent pastel color for selected items
        unselectedItemColor: const Color(0xFFEC407A),
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
            // Stay on ProductPage
            Get.off(() => ProductPage());
          } else if (index == 1) {
            // Navigate to CartPage
            Get.to(() => CartPage());
          } else if (index == 2) {
            // Navigate to ProfilePage
            Get.to(() => ProfilePage());
          }
        },
      ),
    );
  }

  void addToCart(ProductModel product) {
    // โค้ดสำหรับเพิ่มสินค้าลงในตะกร้า
    Get.snackbar(
      'Added to Cart',
      '${product.title} has been added to your cart.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}