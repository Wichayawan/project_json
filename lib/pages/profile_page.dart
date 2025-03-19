import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import ' product_page.dart';
import 'cart_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        backgroundColor: const Color(0xFFF8BBD0),
      ),
      body: const Center(
        child: Text(
          'This is the Profile Page',
          style: TextStyle(color: Colors.black),
        ),
      ),
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
}