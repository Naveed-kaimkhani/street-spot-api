import 'package:StreetSpot/components/menuItem_shimmer.dart'
    show MenuItemShimmer;

import 'package:StreetSpot/constants/api_endpoints.dart';
import 'package:StreetSpot/controller/dashboard_controller.dart';
import 'package:StreetSpot/views/user/detailpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // If using .sp/.h etc., otherwise remove

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late final int truckId;
  late final int categoryId;

  late final String categoryName;
  final DashboardController controller = Get.find<DashboardController>();

  @override
  void initState() {
    super.initState();
    final args = Get.arguments as Map<String, dynamic>;
    truckId = args['truck_id'] as int;
    categoryId = args['category_id'] as int;

    categoryName = args['category_name'] as String;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchMenuItems(truckId, categoryId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const MenuItemShimmer();
      }

      final items = controller.menuItems;
      return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[100],
          title: Text(
            categoryName, // Changed from "Favorites List" for relevance
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: items.isEmpty
            ? const Center(child: Text("No items available"))
            : Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 items per row
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    final fullImageUrl =
                        '${ApiEndpoints.image}${item.imageUrl}'; // Adjust path if needed
                    return InkWell(
                      onTap: () =>
                          Get.to(() => BurgerDetailsPage(menuItem: item)),
                      child: Container(
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
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(16)),
                                  child: Image.network(
                                    fullImageUrl,
                                    height: 120,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Container(
                                      height: 120,
                                      width: double.infinity,
                                      color: Colors.grey[300],
                                      child:
                                          const Icon(Icons.image_not_supported),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 8,
                                  left: 8,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      "\$${item.unitPrice.toStringAsFixed(2)}",
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 6),
                              child: Text(
                                item.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.star,
                                      color: Colors.orange, size: 14),
                                  const SizedBox(width: 4),
                                  Text(
                                    "6",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey[700]),
                                  ),
                                  const Spacer(),
                                  Icon(Icons.shopping_cart_outlined,
                                      size: 16, color: Colors.grey[700]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
      );
    });
  }
}
