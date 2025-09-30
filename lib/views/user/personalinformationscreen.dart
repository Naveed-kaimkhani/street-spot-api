import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:StreetSpot/custom_widgets/custom_button.dart';
import 'package:StreetSpot/custom_widgets/custom_text.dart';
import 'package:StreetSpot/routes/route_name.dart';
import 'package:StreetSpot/utils/app_fonts.dart';
import 'package:get/get.dart';

class Personalinformationscreen extends StatefulWidget {
  const Personalinformationscreen({super.key});

  @override
  State<Personalinformationscreen> createState() =>
      _PersonalinformationscreenState();
}

class _PersonalinformationscreenState extends State<Personalinformationscreen> {
  String? selectedGender;
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        title: CustomText(
          text: 'Profile Settings',
          fontsize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          // Profile Picture
          Center(
            child: Container(
              width: 80.w,
              height: 80.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffFEF2F2), // Placeholder color
              ),
              child: Image.asset("assets/images/profilepics.png"),
            ),
          ),
          SizedBox(height: 24.h),
          // Full Name
          CustomText(
            text: 'Full Name',
            fontsize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          SizedBox(height: 8.h),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter your full name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Colors.grey),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            ),
          ),
          SizedBox(height: 16.h),
          // Date of Birth
          CustomText(
            text: 'Date of Birth',
            fontsize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          SizedBox(height: 8.h),
          TextFormField(
            controller: _dateController,
            decoration: InputDecoration(
              hintText: 'DD/MM/YYYY',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Colors.grey),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            ),
            readOnly: true, // Prevents manual typing
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (pickedDate != null) {
                setState(() {
                  _dateController.text =
                      "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                });
              }
            },
          ),
          SizedBox(height: 16.h),
          // Gender
          CustomText(
            text: 'Gender',
            fontsize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          SizedBox(height: 8.h),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Colors.grey),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            ),
            value: selectedGender,
            hint: CustomText(
              text: 'Select Gender',
              fontsize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
            items: <String>['Male', 'Female', 'Other'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: CustomText(
                  text: value,
                  fontsize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // Handle gender selection
            },
          ),
          SizedBox(height: 16.h),
          // Phone
          CustomText(
            text: 'Phone',
            fontsize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          SizedBox(height: 8.h),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter phone number',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Colors.grey),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            ),
          ),
          SizedBox(height: 16.h),
          // Email
          CustomText(
            text: 'Email',
            fontsize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          SizedBox(height: 8.h),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter your email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Colors.grey),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            ),
          ),
          SizedBox(
            height: 22.h,
          ),
          CustomButton(
            buttonColor: Colors.orange,
            onTap: () {
              Get.toNamed(AppRouteName.sellerlogin);
              // AppNavigation.navigateCloseDialog(context);
            },
            buttonText: 'Save',
            fontSize: 14.sp,
            borderRadius: 20,
            fontFamily: AppFonts.plusJakartaSansRegular,
          ),
        ],
      ),
    );
  }
}
