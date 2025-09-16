import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:StreetSpot/utils/app_colors.dart' show AppColors;
import 'package:StreetSpot/utils/app_fonts.dart' show AppFonts;

class CustomText extends StatelessWidget {
  final String? text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontsize;
  final AlignmentGeometry? align;
  final TextAlign? textAlign;
  final List<FontFeature>? fontFeatures;
  final int? maxLines;
  final bool isLeftAlign;
  final TextDecoration? textDecoration;
  final String? fontFamily;
  final List<Color>? gradientColors; // Optional gradient colors

  const CustomText({
    Key? key,
    this.text,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.fontsize,
    this.fontFeatures,
    this.maxLines,
    this.align,
    this.isLeftAlign = true,
    this.textDecoration,
    this.fontFamily,
    this.gradientColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontFeatures: fontFeatures,
      fontSize: fontsize ?? 22.sp,
      color: color ?? AppColors.blackColor,
      decoration: textDecoration,
      fontFamily: fontFamily ?? AppFonts.plusJakartaSansRegular,
      fontWeight: fontWeight ?? FontWeight.w200,
    );

    Widget textWidget = Text(
      text ?? ' ',
      textAlign: isLeftAlign == false ? TextAlign.center : textAlign,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : TextOverflow.visible,
      style: textStyle,
    );

    // Apply gradient if gradientColors is provided and has valid colors
    if (gradientColors != null && gradientColors!.length >= 2) {
      textWidget = ShaderMask(
        blendMode: BlendMode.srcIn,
        child: Text(
          text ?? ' ',
          textAlign: isLeftAlign == false ? TextAlign.center : textAlign,
          maxLines: maxLines,
          overflow:
              maxLines != null ? TextOverflow.ellipsis : TextOverflow.visible,
          style: textStyle.copyWith(
              color: Colors.white), // Base color for gradient
        ),
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            colors: gradientColors!,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            tileMode: TileMode.clamp,
          ).createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ); // Dynamic bounds based on text size
        },
      );
    }

    return Align(
      alignment:
          align ?? (isLeftAlign ? Alignment.centerLeft : Alignment.center),
      child: textWidget,
    );
  }
}
