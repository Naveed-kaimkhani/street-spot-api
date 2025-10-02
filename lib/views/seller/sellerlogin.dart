import 'package:StreetSpot/controller/auth_controller.dart';
import 'package:StreetSpot/model/user_model.dart';
import 'package:StreetSpot/repositries/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show FilteringTextInputFormatter, LengthLimitingTextInputFormatter;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:StreetSpot/custom_widgets/custom_button.dart';
import 'package:StreetSpot/custom_widgets/custom_text.dart';
import 'package:StreetSpot/custom_widgets/customtextfield.dart';
import 'package:StreetSpot/routes/route_name.dart' show AppRouteName;
import 'package:StreetSpot/utils/app_colors.dart' show AppColors;
import 'package:StreetSpot/utils/app_constants.dart' show AppConstants;
import 'package:StreetSpot/utils/app_fonts.dart';
import 'package:StreetSpot/utils/app_strings.dart' show AppStrings;
import 'package:StreetSpot/utils/field_validation.dart' show Validation;
import 'package:StreetSpot/utils/regular_expression.dart'
    show RegularExpressions;
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Sellerlogin extends StatefulWidget {
  const Sellerlogin({super.key});

  @override
  State<Sellerlogin> createState() => _SellerloginbState();
}

class _SellerloginbState extends State<Sellerlogin> {
  final authController =
  // Get.put(AuthController(authRepo: Get.find()));
      Get.find<AuthController>();
  GlobalKey<FormState> authForm = GlobalKey<FormState>();
  bool isPasswordObsure = true;
  bool isLoginActive = true; 
  bool isSeller = false; 

  @override
  void dispose() {
    authController.nameController.clear();
    authController.emailController.clear();
    authController.passwordController.clear();
    authController.confirmPasswordController.clear();
    super.dispose();
  }

  final phoneMaskFormatter = MaskTextInputFormatter(
    mask: '(+1)###-###-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  bool isPhoneInput = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              60.verticalSpace,
              const CustomText(
                text: "Welcome!",
                fontsize: 26.0,
                fontWeight: FontWeight.bold,
                fontFamily: AppFonts.plusJakartaSansSemiBold,
              ),
              SizedBox(height: 5.h),
              const CustomText(
                text: "Sign up or Login to your Account",
                fontsize: 15.0,
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLoginActive = true;
                      });
                    },
                    child: Container(
                      height: 50.h,
                      padding: EdgeInsets.symmetric(horizontal: 62.w),
                      decoration: BoxDecoration(
                        gradient: isLoginActive
                            ? const LinearGradient(
                                colors: [
                                  Color(0xFFF742A9),
                                  Color(0xFFF3C307),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              )
                            : LinearGradient(
                                colors: [
                                  const Color(0xFFF742A9).withOpacity(0.3),
                                  const Color(0xFFF3C307).withOpacity(0.3),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(30.r),
                        ),
                      ),
                      child: Center(
                        child: CustomText(
                          text: "Login",
                          fontsize: 14.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppFonts.plusJakartaSansSemiBold,
                          color: isLoginActive ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLoginActive = false;
                      });
                    },
                    child: Container(
                      height: 50.h,
                      padding: EdgeInsets.symmetric(horizontal: 60.w),
                      decoration: BoxDecoration(
                        gradient: !isLoginActive
                            ? const LinearGradient(
                                colors: [
                                  Color(0xFFF742A9),
                                  Color(0xFFF3C307),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              )
                            : LinearGradient(
                                colors: [
                                  const Color(0xFFF742A9).withOpacity(0.3),
                                  const Color(0xFFF3C307).withOpacity(0.3),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(30.r),
                        ),
                      ),
                      child: Center(
                        child: CustomText(
                          text: "Sign Up",
                          fontsize: 14.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppFonts.plusJakartaSansSemiBold,
                          color: !isLoginActive ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              Form(
                key: authForm,
                child: Column(
                  children: [
                    if (!isLoginActive) ...[
                      const CustomText(
                        text: "Username",
                        fontsize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(height: 12.h),
                      CustomTextField(
                        hintText: "Enter Username",
                        filled: true,
                        prefixIconColor: AppColors.kPrimaryColor,
                        textEditingController: authController.nameController,
                        validator: (val) =>
                            val!.trim().isEmpty ? "Username is required" : null,
                      ),
                      SizedBox(height: 12.h),
                    ],
                    const CustomText(
                      text: "Email Address",
                      fontsize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(height: 12.h),
                    CustomTextField(
                      hintText: AppStrings.EMAIL_ADDRESS,
                      filled: true,
                      prefixIconColor: AppColors.kPrimaryColor,
                      textInputFormattors: isPhoneInput
                          ? [phoneMaskFormatter]
                          : [
                              LengthLimitingTextInputFormatter(50),
                              FilteringTextInputFormatter.deny(
                                  RegularExpressions.DISALLOW_SPACES),
                            ],
                      keyboardType: TextInputType.emailAddress,
                      textEditingController: authController.emailController,
                      validator: (val) {
                        if (val == null || val.trim().isEmpty) {
                          return "Email is required";
                        }
                        if (!isPhoneInput && !GetUtils.isEmail(val.trim())) {
                          return "Please enter a valid email";
                        }
                        return null;
                      },
                      onChanged: (val) {
                        final isPhone = RegExp(r'^[\d(]').hasMatch(val);
                        if (isPhone != isPhoneInput) {
                          setState(() {
                            isPhoneInput = isPhone;
                            authController.emailController.clear();
                          });
                        }
                      },
                      onCrossIconTap: () {
                        setState(() {
                          authController.emailController.clear();
                          isPhoneInput = false;
                        });
                      },
                    ),
                    SizedBox(height: 12.h),
                    const CustomText(
                      text: "Password",
                      fontsize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(height: 12.h),
                    CustomTextField(
                      hintText: AppStrings.PASSWORD,
                      filled: true,
                      prefixIconColor: AppColors.kPrimaryColor,
                      isLogin: true,
                      isObsCure: isPasswordObsure,
                      errorMaxLines: 10,
                      textEditingController: authController.passwordController,
                      textInputFormattors: [
                        LengthLimitingTextInputFormatter(
                            AppConstants.PASSWORD_MAX_LENGTH),
                      ],
                      onIconTap: () {
                        setState(() {
                          isPasswordObsure = !isPasswordObsure;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Password is required";
                        }
                        if (value.trim().length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                    ),
                    if (!isLoginActive) ...[
                      SizedBox(height: 12.h),
                      const CustomText(
                        text: "Confirm Password",
                        fontsize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(height: 12.h),
                      CustomTextField(
                        hintText: "Confirm Password",
                        filled: true,
                        prefixIconColor: AppColors.kPrimaryColor,
                        isLogin: true,
                        isObsCure: isPasswordObsure,
                        errorMaxLines: 10,
                        textEditingController:
                            authController.confirmPasswordController,
                        textInputFormattors: [
                          LengthLimitingTextInputFormatter(
                              AppConstants.PASSWORD_MAX_LENGTH),
                        ],
                        onIconTap: () {
                          setState(() {
                            isPasswordObsure = !isPasswordObsure;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Confirm Password is required";
                          }
                          if (value.trim() !=
                              authController.passwordController.text.trim()) {
                            return "Passwords do not match";
                          }
                          return null;
                        },
                      ),
                    ],
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRouteName.FORGOT_PASSWORD_SCREEN_ROUTE);
                    },
                    child: const CustomText(
                      text: "Forgot Password?",
                      fontsize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey[700],
                      thickness: 1.0,
                      indent: 16.0,
                      endIndent: 8.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomText(
                      text: "Or Login Using",
                      fontsize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[700],
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey[700],
                      thickness: 1.0,
                      indent: 8.0,
                      endIndent: 16.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey, width: 1.0),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.g_mobiledata,
                        size: 40.0,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        print('Google login tapped');
                      },
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey, width: 1.0),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.apple,
                        size: 40.0,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        print('Facebook login tapped');
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    text: "Don’t have an account?",
                    fontsize: 14.0,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: 3.w),
                  const CustomText(
                    text: "Sign up",
                    fontsize: 14.0,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    gradientColors: [
                      Color(0xFFF742A9),
                      Color(0xFFF3C307),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 22.h),
              CustomButton(
                buttonColor: AppColors.kPrimaryColor,
                onTap: () {
                  if (authForm.currentState!.validate()) {
                    if (isLoginActive) {
                      authController.loginUser(
                        email: authController.emailController.text.trim(),
                        password: authController.passwordController.text.trim(),
                      );
                    } else {
                      authController.registerUser(
                        user: UserModel(
                          name: authController.nameController.text.trim(),
                          email: authController.emailController.text.trim(),
                          password: authController.passwordController.text.trim(),
                          role: authController.selectedRole.value,
                        ),
                      );
                    }
                  }
                },
                isLoading: authController.isLoading,
                buttonText: isLoginActive ? "Login" : "Sign Up",
                fontSize: 14.sp,
                borderRadius: 15,
                fontFamily: AppFonts.plusJakartaSansRegular,
              ),
            ],
          ),
        ),
      ),
    );
  }
}