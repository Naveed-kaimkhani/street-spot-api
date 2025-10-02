import "package:StreetSpot/utils/app_colors.dart";
import "package:StreetSpot/utils/app_fonts.dart" show AppFonts;
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get_rx/src/rx_types/rx_types.dart";
import "package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart";


class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.buttonColor,
    required this.onTap,
    required this.buttonText,
    this.icon,
    this.iconColor,
    this.padding,
    this.height,
    this.containsIcon = false,
    this.fontFamily,
    this.fontSize = 14,
    this.textColor = Colors.white,
    this.lowerGradientColor = AppColors.klineargradient1,
    this.upperGradientColor = AppColors.klineargradient2,
    this.showBorder = false,
    this.borderColor,
    this.borderRadius = 10,
    this.borderInsideColor,
    RxBool? isLoading, // accept optional param
    this.fontWeight = FontWeight.w600,
  })  : isLoading = isLoading ?? false.obs, // initialize properly
        super(key: key);

  final Color buttonColor;
  final Color textColor;

  final RxBool isLoading; // ✅ make it non-nullable
  final String buttonText;
  final Function()? onTap;
  final bool containsIcon;
  final String? icon;
  final Color? iconColor;
  final double fontSize;
  final double? height;
  final double? padding;
  final String? fontFamily;
  final Color? upperGradientColor;
  final Color? lowerGradientColor;
  final bool? showBorder;
  final double borderRadius;
  final Color? borderColor;
  final Color? borderInsideColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          height: height ?? 50.h,
          padding: EdgeInsets.symmetric(horizontal: padding ?? 20).w,
          decoration: BoxDecoration(
            gradient: !(showBorder ?? false)
                ? const LinearGradient(
                    colors: [
                      Color(0xFFF742A9),
                      Color(0xFFF3C307),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )
                : null,
            color: showBorder ?? false
                ? borderInsideColor ?? AppColors.whiteColor
                : null,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: containsIcon
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isLoading.value
                        ? SizedBox(
                            width: 18.w,
                            height: 18.w,
                            child: const CircularProgressIndicator.adaptive(
                              strokeWidth: 2,
                              backgroundColor: Colors.black,
                            ),
                          )
                        : Text(
                            buttonText,
                            style: TextStyle(
                              color: textColor,
                              fontSize: fontSize.sp,
                              fontFamily: fontFamily ??
                                  AppFonts.plusJakartaSansSemiBold,
                              fontWeight: fontWeight,
                            ),
                          ),
                    10.horizontalSpace,
                    Image.asset(
                      icon ?? "",
                      scale: 3.5.sp,
                      color: iconColor ?? AppColors.whiteColor,
                    ),
                  ],
                )
              : Center(
                  child: isLoading.value
                      ? SizedBox(
                          width: 18.w,
                          height: 18.w,
                          child: const CircularProgressIndicator.adaptive(
                            strokeWidth: 2,
                              backgroundColor: Colors.black,
                          ),
                        )
                      : Text(
                          buttonText,
                          style: TextStyle(
                            color: showBorder ?? false
                                ? AppColors.kPrimaryColor
                                : textColor,
                            fontSize: fontSize.sp,
                            fontFamily:
                                fontFamily ?? AppFonts.plusJakartaSansSemiBold,
                            fontWeight: fontWeight,
                          ),
                        ),
                ),
        ),
      );
    });
  }
}
