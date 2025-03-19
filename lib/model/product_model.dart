// model/product_model.dart
class ProductModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final String imageUrl;
  final double price;
  final double rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      imageUrl: json['thumbnail'], // สมมติว่ารูปภาพอยู่ในฟิลด์ 'thumbnail'
      price: json['price'].toDouble(),
      rating: json['rating'].toDouble(),
    );
  }
}
