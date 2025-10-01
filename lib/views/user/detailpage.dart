import 'package:StreetSpot/constants/api_endpoints.dart';
import 'package:StreetSpot/controller/cart_controller.dart';
import 'package:StreetSpot/model/menu_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:StreetSpot/custom_widgets/custom_button.dart';
import 'package:StreetSpot/custom_widgets/custom_text.dart';
import 'package:StreetSpot/utils/app_colors.dart';
import 'package:StreetSpot/utils/app_fonts.dart';
import 'package:get/get.dart';

import '../../routes/route_name.dart';

// Sample data model
class Recommendation {
  final String imageUrl;
  final String title;
  final String rating;
  final String distance;
  final String price;
  final String reviews;

  Recommendation({
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.distance,
    required this.price,
    required this.reviews,
  });
}

class BurgerDetailsPage extends StatefulWidget {
  final MenuItem2 menuItem; // 👈 menu item passed in constructor
  const BurgerDetailsPage({Key? key, required this.menuItem}) : super(key: key);

  @override
  State<BurgerDetailsPage> createState() => _BurgerDetailsPageState();
}

class _BurgerDetailsPageState extends State<BurgerDetailsPage> {
  // Sample recommendation list

  final cartController = Get.find<CartController>();
  final List<Recommendation> recommendations = [
    Recommendation(
      imageUrl: 'assets/images/ordinaryburger.png',
      title: 'Ordinary Burgers',
      rating: '4.9',
      distance: '190m',
      price: '\$18,230',
      reviews: '137 x 106',
    ),
    Recommendation(
      imageUrl: 'assets/images/burger2.png',
      title: 'Ordinary Burgers',
      rating: '4.9',
      distance: '190m',
      price: '\$17,230',
      reviews: '',
    ),
    Recommendation(
      imageUrl: 'assets/images/ordinaryburger.png',
      title: 'Ordinary Burgers',
      rating: '4.9',
      distance: '190m',
      price: '\$27,230',
      reviews: '137 x 106',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 300,
                    child: CachedNetworkImage(
                      imageUrl:
                          "${ApiEndpoints.image}${widget.menuItem.imageUrl}",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error, size: 40),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.menuItem.name,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ShaderMask(
                                    shaderCallback: (bounds) =>
                                        const LinearGradient(
                                      colors: [
                                        AppColors.klineargradient1,
                                        AppColors.klineargradient2
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ).createShader(bounds),
                                    child: Text(
                                      '\$${widget.menuItem.unitPrice}',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Row(children: [
                                    Image.asset(
                                      "assets/images/staricon.png",
                                      height: 19,
                                    ),
                                    const CustomText(
                                      text: "Free Delivery",
                                      fontsize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.APP_GRAY_COLOR,
                                    )
                                  ]),
                                ],
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Row(
                                children: [
                                  Row(children: [
                                    Image.asset(
                                      "assets/images/staricon.png",
                                      height: 19,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    const CustomText(
                                      text: "4.5",
                                      fontsize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.APP_GRAY_COLOR,
                                    )
                                  ]),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/clocktime.png",
                                        height: 16,
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      CustomText(
                                        text: widget.menuItem.timeToMake
                                            .toString(),
                                        fontsize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.APP_GRAY_COLOR,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 16.h),
                              const CustomText(
                                text: "Description",
                                fontsize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              CustomText(
                                text: widget.menuItem.description,
                                fontsize: 14.0,
                              ),
                              SizedBox(height: 7.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Recommended For You',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text('See All',
                                        style: TextStyle(color: Colors.orange)),
                                  ),
                                ],
                              ),
                              // Using ListView.builder for horizontal recommendations
                              SizedBox(
                                height: 210,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: recommendations.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Container(
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.vertical(
                                                      top: Radius.circular(10)),
                                              child: Image.asset(
                                                recommendations[index].imageUrl,
                                                fit: BoxFit.cover,
                                                height: 120,
                                                width: 150,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    recommendations[index]
                                                        .title,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  SizedBox(height: 6.h),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          const Icon(Icons.star,
                                                              color:
                                                                  Colors.amber,
                                                              size: 16),
                                                          Text(
                                                            recommendations[
                                                                    index]
                                                                .rating,
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        14),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                              Icons.location_on,
                                                              color:
                                                                  Colors.orange,
                                                              size: 16),
                                                          Text(
                                                            recommendations[
                                                                    index]
                                                                .distance,
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .grey),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 8.h),
                                                  ShaderMask(
                                                    shaderCallback: (bounds) =>
                                                        const LinearGradient(
                                                      colors: [
                                                        AppColors
                                                            .klineargradient1,
                                                        AppColors
                                                            .klineargradient2
                                                      ],
                                                      begin: Alignment.topLeft,
                                                      end:
                                                          Alignment.bottomRight,
                                                    ).createShader(bounds),
                                                    child: Text(
                                                      recommendations[index]
                                                          .price,
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                  ),
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
                              const SizedBox(height: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Ratings & Reviews (273)',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 12.h),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    color: Colors.white,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Summary',
                                                style: TextStyle(fontSize: 16)),
                                            Row(
                                              children: [
                                                Text(
                                                  '4.5 ',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Icon(Icons.star,
                                                    color: Colors.pink,
                                                    size: 16),
                                                SizedBox(width: 5),
                                                Text('273 Reviews',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey)),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Column(
                                          children: [
                                            _buildRatingBar(
                                                5, 0.9), // 5-star rating
                                            _buildRatingBar(
                                                4, 0.7), // 4-star rating
                                            _buildRatingBar(
                                                3, 0.5), // 3-star rating
                                            _buildRatingBar(
                                                2, 0.3), // 2-star rating
                                            _buildRatingBar(
                                                1, 0.1), // 1-star rating
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text('88% Recommended',
                                                style: TextStyle(fontSize: 16)),
                                            OutlinedButton(
                                              onPressed: () {},
                                              style: OutlinedButton.styleFrom(
                                                side: const BorderSide(
                                                    color: Colors.grey),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                              ),
                                              child: const Text(
                                                  'Write a review',
                                                  style: TextStyle(
                                                      color: Colors.black)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                      height: 60
                                          .h), // Added extra space to ensure scrollable content goes under sticky bar
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Back Arrow and Favorite Icon
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.7),
                        child:
                            const Icon(Icons.arrow_back, color: Colors.black),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Add favorite functionality here
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.7),
                        child: const Icon(Icons.favorite_border,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Sticky Add to Cart Section
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          '4',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 10),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    CustomButton(
                      buttonColor: Colors.orange,
                      onTap: () {
                        cartController.addToCart(widget.menuItem);
                      },
                      buttonText: 'Add to Cart',
                      fontSize: 14.sp,
                      borderRadius: 20,
                      fontFamily: AppFonts.plusJakartaSansRegular,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingBar(int stars, double fill) {
    return Row(
      children: [
        Text('$stars', style: const TextStyle(fontSize: 16)),
        const SizedBox(width: 10),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                widthFactor: fill,
                child: Container(
                  height: 10,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.pink, Colors.orange],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RecommendationItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;

  RecommendationItem(
      {required this.imageUrl, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(imageUrl, width: 50, height: 50),
          Text('$title - $price'),
        ],
      ),
    );
  }
}
