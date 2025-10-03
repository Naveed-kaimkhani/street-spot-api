import 'package:flutter/material.dart';


class FavoritesListPage extends StatelessWidget {
  final List<Map<String, dynamic>> favorites = [
    {
      "title": "Sunny Bruschetta",
      "rating": 5.0,
      "price": 15.00,
      "image": "assets/images/food1.png",
    },
    {
      "title": "Gourmet Grilled Skewers",
      "rating": 4.6,
      "price": 12.00,
      "image": "assets/images/food2.png",
    },
    {
      "title": "Barbecue tacos",
      "rating": 4.8,
      "price": 15.00,
      "image": "assets/images/food1.png",
    },
    {
      "title": "Broccoli lasagna",
      "rating": 3.6,
      "price": 12.00,
      "image": "assets/images/food1.png",
    },
    {
      "title": "Iced Coffee",
      "rating": 4.7,
      "price": 15.00,
      "image": "assets/images/food2.png",
    },
    {
      "title": "Strawberry Cake",
      "rating": 4.9,
      "price": 20.00,
      "image": "assets/images/food1.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[100],
        title: const Text(
          "Favorites List",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: favorites.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            final item = favorites[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                        child: Image.asset(
                          item['image'],
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Positioned(
                        top: 8,
                        right: 8,
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.favorite, color: Colors.red, size: 16),
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            "\$${item['price'].toStringAsFixed(2)}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                    child: Text(
                      item['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          item['rating'].toString(),
                          style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                        ),
                        const Spacer(),
                        Icon(Icons.shopping_cart_outlined, size: 16, color: Colors.grey[700]),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
     
    );
  }
}
