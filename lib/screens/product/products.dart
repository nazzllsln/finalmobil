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
          "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/mba13-midnight-select-202402?wid=904&hei=840&fmt=jpeg&qlt=90&.v=1708367688034"
    },
    {
      "id": 2,
      "name": "Philips buharlı ütü",
      "in-stock": false,
      "price": "-",
      "photo":
          "https://images.philips.com/is/image/philipsconsumer/vrs_14e41e5c9cc99b270038ff2d19ec201cf2bbec24?&wid=960"
    },
    {
      "id": 3,
      "name": "Arzum Saç Düzleştirici",
      "in-stock": true,
      "price": "4000",
      "photo":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZHg7iwwUMTLeDUuMit3Q6G4WR7ZtfBx7TjQ&s"
    },
    {
      "id": 4,
      "name": "schafer kahvecim otomatik turk kahve makinesi",
      "in-stock": true,
      "price": "3500",
      "photo":
          "https://cdn.dsmcdn.com/ty35/product/media/images/20210319/17/73722794/60549831/1/1_org_zoom.jpg"
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
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black45),
                borderRadius: BorderRadius.circular(8.0)),
            margin: const EdgeInsets.all(14.0),
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                Image.network(products[index]["photo"].toString()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(products[index]["name"].toString()),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.favorite_border)),
                  ],
                ),
                if (products[index]["in-stock"] as bool)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.check_box),
                          Text("mevcut"),
                        ],
                      ),
                      Text(products[index]["price"].toString()),
                    ],
                  )
                else
                  const Row(children: [
                    Icon(Icons.error),
                    Text("mevcut değil"),
                  ]),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
