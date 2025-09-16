import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:StreetSpot/custom_widgets/custom_text.dart';
import 'package:StreetSpot/routes/route_name.dart' show AppRouteName;
import 'package:StreetSpot/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Dashboardscreen extends StatefulWidget {
  const Dashboardscreen({super.key});

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  final List<Map<String, String>> _products = [
    {
      'name': 'Broast',
      'category': 'Tacos',
      'image': 'assets/images/broast.png',
      'type': 'new'
    },
    {
      'name': 'Cold Drinks',
      'category': 'Pepsi',
      'image': 'assets/images/coldrinks.png',
      'type': 'simple'
    },
    {
      'name': 'Desserts',
      'category': 'Icecream',
      'image': 'assets/images/desserts.png',
      'type': 'simple'
    },
    {
      'name': 'Burger',
      'category': 'Burgers',
      'image': 'assets/images/broast.png',
      'type': 'new'
    },
    {
      'name': 'Burger',
      'category': 'Burgers',
      'image': 'assets/images/broast.png',
      'type': 'new'
    },
  ];

  final List<SalesData> _chartData = [
    SalesData('Jan', 200),
    SalesData('Feb', 450),
    SalesData('Mar', 300),
    SalesData('Apr', 600),
    SalesData('May', 800),
    SalesData('Jun', 500),
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 22.h),
            // Profile Section
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRouteName.truckownerscreen);
              },
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Center(
                          child: Container(
                            width: 80.w,
                            height: 80.h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffFEF2F2),
                            ),
                            child: Image.asset("assets/images/Alice.png"),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 16.w),
                          child: Container(
                            width: 50.r,
                            height: 50.r,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[200],
                            ),
                            child: Icon(
                              Icons.settings,
                              size: 26.r,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    CustomText(
                      text: 'Arya Muller',
                      fontsize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      textAlign: TextAlign.center,
                      isLeftAlign: false, // Ensure centering
                    ),
                    SizedBox(height: 12.h),
                    CustomText(
                      text: 'Overview Stats',
                      fontsize: 14.sp,
                      fontWeight: FontWeight.w600,
                      gradientColors: [
                        AppColors.klineargradient1,
                        AppColors.klineargradient2,
                      ],
                      textAlign: TextAlign.center,
                      isLeftAlign: false, // Ensure centering
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12.h),
            // Overview Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/followers.png",
                        height: 20.h,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 8.w),
                      CustomText(
                        text: '1k Followers',
                        fontsize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/Vector.png",
                        height: 20.h,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 8.w),
                      CustomText(
                        text: '1000 USD Daily Sales',
                        fontsize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            // Graph with Syncfusion
            Container(
              height: 200.h,
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              child: SfCartesianChart(
                primaryXAxis: const CategoryAxis(
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                primaryYAxis: const NumericAxis(
                  isVisible: false,
                ),
                title: const ChartTitle(
                  text: '1000 USD',
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  alignment: ChartAlignment.near,
                ),
                series: <CartesianSeries<SalesData, String>>[
                  LineSeries<SalesData, String>(
                    dataSource: _chartData,
                    xValueMapper: (SalesData sales, _) => sales.month,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                    color: AppColors.klineargradient1,
                    width: 2,
                    markerSettings: const MarkerSettings(isVisible: true),
                    dataLabelSettings: const DataLabelSettings(isVisible: false),
                  ),
                ],
              ),
            ),
            // Popular Menu Items Horizontal ScrollView
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Popular Menu Items',
                    fontsize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  SizedBox(height: 12.h),
                  SizedBox(
                    height: 120.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _products.length,
                      itemBuilder: (context, index) {
                        final product = _products[index];
                        return Padding(
                          padding: EdgeInsets.only(
                            right: 12.w,
                            top: 8.h,
                            bottom: 8.h,
                            left: 4.w,
                          ),
                          child: Container(
                            width: 100.w,
                            height: 110.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              border: Border.all(
                                  color: AppColors.klineargradient1, width: 1),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 70.h,
                                  width: 70.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    image: DecorationImage(
                                      image: AssetImage(product['image']!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                                  child: CustomText(
                                    text: product['name']!,
                                    fontsize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    textAlign: TextAlign.center,
                                    isLeftAlign: false,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Products Grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                  childAspectRatio: 0.8,
                ),
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  final product = _products[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 100.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(8.r)),
                                image: DecorationImage(
                                  image: AssetImage(product['image']!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            if (product['type'] == 'new')
                              Positioned(
                                top: 8.w,
                                left: 8.w,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 2.h),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                  child: CustomText(
                                    text: 'New Arrival',
                                    fontsize: 10.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: product['name']!,
                                fontsize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              SizedBox(height: 4.h),
                              CustomText(
                                text: product['category']!,
                                fontsize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 8.h),
                              Row(
                                children: [
                                  CustomText(
                                    text: '15 mins',
                                    fontsize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                  VerticalDivider(
                                    color: Colors.grey,
                                    thickness: 1,
                                    width: 16.w,
                                  ),
                                  Icon(Icons.star,
                                      size: 16.sp, color: Colors.yellow),
                                  SizedBox(width: 4.w),
                                  CustomText(
                                    text: '12k',
                                    fontsize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.h),
                              Row(
                                children: [
                                  CustomText(
                                    text: '\$19.99',
                                    fontsize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 8.w),
                                  CustomText(
                                    text: '10% off',
                                    fontsize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}

class SalesData {
  final String month;
  final double sales;

  SalesData(this.month, this.sales);
}

class HexagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final width = size.width;
    final height = size.height;

    path.moveTo(width * 0.25, 0);
    path.lineTo(width * 0.75, 0);
    path.lineTo(width, height * 0.3);
    path.lineTo(width, height * 0.7);
    path.lineTo(width * 0.75, height);
    path.lineTo(width * 0.25, height);
    path.lineTo(0, height * 0.7);
    path.lineTo(0, height * 0.3);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}