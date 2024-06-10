part of 'products_cubit.dart';

class ProductState {
  final List<Map<String, dynamic>> favorites;

  var x = {
    "id": 1,
    "name": "MacBook Pro 2024 M2 Pro",
    "in-stock": true,
    "photo":
        "https://www.pt.com.tr/uploads/products/big/x9nwGVNZrQakkTdEcHcweVtYkQQXvqUJmXUBC8Bl.webp"
  };

  ProductState({this.favorites = const []});
}
