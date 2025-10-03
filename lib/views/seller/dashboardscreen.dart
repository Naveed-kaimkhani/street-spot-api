import 'package:StreetSpot/components/dashboard_shimmer.dart';
import 'package:StreetSpot/components/product_card.dart';
import 'package:StreetSpot/controller/dashboard_controller.dart';
import 'package:StreetSpot/controller/user_controller.dart';
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
  final DashboardController controller = Get.find<DashboardController>();

  final UserController userController = Get.put(UserController());

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
  void initState() {
    super.initState();
    controller.fetchDashboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const DashboardShimmer(); // custom shimmer widget
        }
        final data = controller.dashboardData.value;
        return SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 22.h),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRouteName.truckownerscreen);
                },
                child: SizedBox(
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
                        text: userController.user.value?.name ?? "Guest User",
                        fontsize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        textAlign: TextAlign.center,
                        isLeftAlign: false,
                      ),
                      SizedBox(height: 12.h),
                      CustomText(
                        text: 'Overview Stats',
                        fontsize: 14.sp,
                        fontWeight: FontWeight.w600,
                        gradientColors: const [
                          AppColors.klineargradient1,
                          AppColors.klineargradient2,
                        ],
                        textAlign: TextAlign.center,
                        isLeftAlign: false,
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
                        // CustomText(
                        //   text:
                        //       //  "${controller.dashboardData.value?.followersCount ?? 0} Followers",
                        //       '${controller.dashboardData.value?.todaySales ?? 0} USD Daily Sales',
                        //   fontsize: 12.sp,
                        //   fontWeight: FontWeight.w400,
                        //   color: Colors.black,
                        // ),
                        CustomText(
                          text: '${data?.followersCount ?? 0} Followers',
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
                          text:
                              // '${controller.dashboardData.value!.todaySales} USD Daily Sales',
                              '${controller.dashboardData.value?.todaySales ?? 0} USD Daily Sales',
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
                      dataLabelSettings:
                          const DataLabelSettings(isVisible: false),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: (data?.menuItems != null && data!.menuItems.isNotEmpty)
                    ? GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.w,
                          mainAxisSpacing: 12.h,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: data.menuItems.length,
                        itemBuilder: (context, index) {
                          final product = data.menuItems[index];
                          return ProductCard(product: product);
                        },
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: CustomText(
                          text: "No menu items available",
                          fontsize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          textAlign: TextAlign.center,
                          isLeftAlign: false,
                        ),
                      ),
              ),

              SizedBox(height: 24.h),
            ],
          ),
        );
      }),
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
