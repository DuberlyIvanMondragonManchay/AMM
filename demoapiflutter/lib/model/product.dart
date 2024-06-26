// lib/model/product.dart
class Product {
  final int id;
  final String title;
  final String body;

  Product({required this.id, required this.title, required this.body});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
