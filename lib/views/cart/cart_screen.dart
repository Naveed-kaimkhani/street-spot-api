import 'package:StreetSpot/constants/api_endpoints.dart';
import 'package:StreetSpot/controller/cart_controller.dart';
import 'package:StreetSpot/model/menu_item.dart';
import 'package:StreetSpot/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: Obx(() => _buildBody()),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_rounded,
            color: AppColors.blackColor, size: 20.w),
        onPressed: () => Get.back(),
      ),
      title: Text(
        'My Cart',
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor,
        ),
      ),
      centerTitle: true,
      actions: [
        Obx(() {
          if (cartController.isCartEmpty) return const SizedBox();
          return IconButton(
            icon: Icon(Icons.delete_outline_rounded,
                color: AppColors.red, size: 24.w),
            onPressed: _showClearCartDialog,
          );
        }),
      ],
    );
  }

  Widget _buildBody() {
    if (cartController.isCartEmpty) {
      return _buildEmptyState();
    }

    return Column(
      children: [
        Expanded(
          child: _buildCartItems(),
        ),
        _buildBottomSummary(),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 80.w,
            color: AppColors.APP_GRAY_COLOR,
          ),
          SizedBox(height: 16.h),
          Text(
            'Your cart is empty',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.APP_GRAY_COLOR,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Add some delicious items to get started!',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.APP_GRAY_COLOR,
            ),
          ),
          SizedBox(height: 24.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: _buildGradientButton(
              text: 'Browse Menu',
              onTap: () => Get.back(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItems() {
    return ListView.separated(
      padding: EdgeInsets.all(16.w),
      itemCount: cartController.cartItems.length,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final item = cartController.cartItems[index];
        return _buildCartItem(item, index);
      },
    );
  }

  Widget _buildCartItem(MenuItem2 item, int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300 + (index * 100)),
      curve: Curves.easeOutCubic,
      margin: EdgeInsets.only(bottom: 4.h),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.5, 0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: const AlwaysStoppedAnimation(1.0),
          curve: Curves.easeOutCubic,
        )),
        child: FadeTransition(
          opacity: const AlwaysStoppedAnimation(1.0),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Product Image
                  _buildProductImage(item),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Product Name and Remove Button
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  item.name,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackColor,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              GestureDetector(
                                onTap: () =>
                                    cartController.removeFromCart(item.id),
                                child: Icon(
                                  Icons.close_rounded,
                                  size: 18.w,
                                  color: AppColors.APP_GRAY_COLOR,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),

                          // Description
                          if (item.description.isNotEmpty) ...[
                            Text(
                              item.description,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColors.APP_GRAY_COLOR,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 8.h),
                          ],

                          // Price and Quantity
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Price
                              _buildPrice(item),

                              // Quantity Selector
                              _buildQuantitySelector(item),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductImage(MenuItem2 item) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(16.r),
      ),
      child: CachedNetworkImage(
        imageUrl: "${ApiEndpoints.image}${item.imageUrl}",
        width: 100.w,
        height: 120.h,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          width: 100.w,
          height: 120.h,
          color: AppColors.LIGHT_GREY_COLOR,
          child: Icon(
            Icons.fastfood_rounded,
            size: 30.w,
            color: AppColors.APP_GRAY_COLOR,
          ),
        ),
        errorWidget: (context, url, error) => Container(
          width: 100.w,
          height: 120.h,
          color: AppColors.LIGHT_GREY_COLOR,
          child: Icon(
            Icons.error_outline_rounded,
            size: 30.w,
            color: AppColors.APP_GRAY_COLOR,
          ),
        ),
        fadeInDuration: const Duration(milliseconds: 300),
        fadeInCurve: Curves.easeIn,
      ),
    );
  }

  Widget _buildPrice(MenuItem2 item) {
    final hasDiscount = item.discountPercentage > 0;
    final discountedPrice =
        item.unitPrice * (1 - (item.discountPercentage / 100));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasDiscount) ...[
          Text(
            '\$${item.unitPrice.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.APP_GRAY_COLOR,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          SizedBox(height: 2.h),
        ],
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [AppColors.klineargradient1, AppColors.klineargradient2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: Text(
            '\$${discountedPrice.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
            ),
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          '${item.quantity}x',
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.APP_GRAY_COLOR,
          ),
        ),
      ],
    );
  }

  Widget _buildQuantitySelector(MenuItem2 item) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Decrease Button
          IconButton(
            onPressed: () => cartController.decreaseQuantity(item.id),
            icon: Icon(
              Icons.remove_rounded,
              size: 18.w,
              color: AppColors.APP_GRAY_COLOR,
            ),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(
              minWidth: 32.w,
              minHeight: 32.h,
            ),
          ),

          // Quantity
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            child: Text(
              '${item.quantity}',
              key: ValueKey(item.quantity),
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor,
              ),
            ),
          ),

          // Increase Button
          IconButton(
            onPressed: () => cartController.increaseQuantity(item.id),
            icon: Icon(
              Icons.add_rounded,
              size: 18.w,
              color: AppColors.APP_GRAY_COLOR,
            ),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(
              minWidth: 32.w,
              minHeight: 32.h,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSummary() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Summary Items
          _buildSummaryRow('Subtotal', cartController.totalAmount),
          SizedBox(height: 8.h),
          _buildSummaryRow('Delivery Fee', 2.99),
          SizedBox(height: 8.h),
          _buildSummaryRow('Tax', cartController.totalAmount * 0.08),
          SizedBox(height: 12.h),
          const Divider(color: AppColors.border, height: 1),
          SizedBox(height: 12.h),
          _buildSummaryRow(
            'Total',
            cartController.totalAmount +
                2.99 +
                (cartController.totalAmount * 0.08),
            isTotal: true,
          ),
          SizedBox(height: 16.h),

          // Checkout Button
          _buildGradientButton(
            text: 'Proceed to Checkout',
            // onTap: () => Get.toNamed(AppRouteName.CHECKOUT_SCREEN_ROUTE),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, double amount, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 16.sp : 14.sp,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? AppColors.blackColor : AppColors.APP_GRAY_COLOR,
          ),
        ),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [AppColors.klineargradient1, AppColors.klineargradient2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: Text(
            '\$${amount.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: isTotal ? 18.sp : 14.sp,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGradientButton(
      {required String text, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 56.h,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.klineargradient1, AppColors.klineargradient2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.klineargradient1.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Ripple effect background
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onTap,
                  borderRadius: BorderRadius.circular(16.r),
                  child: Container(),
                ),
              ),
            ),
            // Button content
            Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showClearCartDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.warning_amber_rounded,
                size: 48.w,
                color: AppColors.red,
              ),
              SizedBox(height: 16.h),
              Text(
                'Clear Cart?',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Are you sure you want to remove all items from your cart?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.APP_GRAY_COLOR,
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.APP_GRAY_COLOR,
                        side: const BorderSide(color: AppColors.border),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                      ),
                      child: const Text('Cancel'),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        cartController.clearCart();
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.red,
                        foregroundColor: AppColors.whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                      ),
                      child: const Text('Clear'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
