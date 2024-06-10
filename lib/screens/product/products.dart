import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  var products = [
    {
      "id": 1,
      "name": "MacBook Pro 2024 M2 Pro",
      "in-stock": true,
      "price": "65000",
      "photo":
          "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/mba13-midnight-select-202402?wid=904&hei=840&fmt=jpeg&qlt=90&.v=1708367688034",
      "isFavorite": false
    },
    {
      "id": 2,
      "name": "Philips buharlı ütü",
      "in-stock": false,
      "price": "-",
      "photo":
          "https://images.philips.com/is/image/philipsconsumer/vrs_14e41e5c9cc99b270038ff2d19ec201cf2bbec24?&wid=960",
      "isFavorite": false
    },
    {
      "id": 3,
      "name": "Arzum Saç Düzleştirici",
      "in-stock": true,
      "price": "4000",
      "photo":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZHg7iwwUMTLeDUuMit3Q6G4WR7ZtfBx7TjQ&s",
      "isFavorite": false
    },
    {
      "id": 4,
      "name": "Schafer kahvecim otomatik Türk kahve makinesi",
      "in-stock": true,
      "price": "3500",
      "photo":
          "https://cdn.dsmcdn.com/ty35/product/media/images/20210319/17/73722794/60549831/1/1_org_zoom.jpg",
      "isFavorite": false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: SizedBox.expand(
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            var product = products[index];
            return Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45),
                  borderRadius: BorderRadius.circular(8.0)),
              margin: const EdgeInsets.all(14.0),
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: [
                  Image.network(product["photo"].toString()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product["name"].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      IconButton(
                        icon: Icon(
                          product["isFavorite"] != null
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color:
                              product["isFavorite"] != null ? Colors.red : null,
                        ),
                        onPressed: () {
                          setState(() {
                            product["isFavorite"] = product["isFavorite"]!;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  if (product["in-stock"] as bool)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.check_box, color: Colors.green),
                            const SizedBox(width: 4),
                            const Text("In Stock"),
                          ],
                        ),
                        Text(
                          "${product["price"]} TL",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      ],
                    )
                  else
                    Row(
                      children: [
                        Icon(Icons.error, color: Colors.red),
                        const SizedBox(width: 4),
                        const Text("Out of Stock"),
                      ],
                    ),
                  const Divider(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
