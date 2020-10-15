import 'package:lamanda_petshopcr/src/models/category.dart';

class Product {
  final String name;
  final String description;
  final double price;
  final String photoUrl;
  final String codeProduct;
  final List<Category> categories;
  Product(this.name, this.description, this.price, this.photoUrl,
      this.codeProduct, this.categories);
}
