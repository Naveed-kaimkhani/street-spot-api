// import 'dart:io';

// import 'package:StreetSpot/controller/truck_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:StreetSpot/custom_widgets/custom_button.dart';
// import 'package:StreetSpot/custom_widgets/custom_text.dart';
// import 'package:StreetSpot/utils/app_fonts.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// class AddMenuItemScreen extends StatefulWidget {
//   const AddMenuItemScreen({super.key});

//   @override
//   State<AddMenuItemScreen> createState() => _AddMenuItemScreenState();
// }

// class _AddMenuItemScreenState extends State<AddMenuItemScreen> {
//   TruckController controller = Get.find<TruckController>();
//   File? profilePhoto;
//   @override
//   void dispose() {
//     super.dispose();
//   }

//   Future<void> pickImage() async {
//     final pickedFile =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         profilePhoto = File(pickedFile.path);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           color: Colors.black,
//         ),
//         title: const CustomText(
//           text: 'Add Menu Items',
//           fontsize: 18,
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//         ),
//       ),
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           ListView(
//             padding: EdgeInsets.all(16.w),
//             children: [
//               // Overview Stats
//               SizedBox(height: 24.h),
//               // Truck Information Section
//               Stack(
//                 alignment: Alignment.center,
//                 children: [

//                   GestureDetector(
//                     onTap: pickImage,
//                     child: Container(
//                       width: 140, // wider
//                       height: 120, // slightly shorter for food look
//                       decoration: BoxDecoration(
//                         color: Colors.grey[300],
//                         borderRadius:
//                             BorderRadius.circular(16), // rounded corners
//                       ),
//                       child: profilePhoto != null
//                           ? ClipRRect(
//                               borderRadius: BorderRadius.circular(16),
//                               child: Image.file(
//                                 profilePhoto!,
//                                 width: 140,
//                                 height: 120,
//                                 fit: BoxFit.cover, // fill & crop nicely
//                               ),
//                             )
//                           : const Center(
//                               child: Icon(
//                                 Icons.fastfood,
//                                 size: 50,
//                                 color: Colors.white,
//                               ),
//                             ),
//                     ),
//                   )
//                 ],
//               ),

//               SizedBox(height: 24.h),
//               CustomText(
//                 text: '🍽️ Menu Information', // Plate and utensils
//                 fontsize: 14.sp,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black,
//               ),

//               SizedBox(height: 12.h),
//               Container(
//                 padding: EdgeInsets.all(12.w),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(8.r),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CustomText(
//                       text: 'Food Name',
//                       fontsize: 12.sp,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                     ),
//                     SizedBox(height: 8.h),
//                     TextFormField(
//                       controller: controller.foodName,
//                       decoration: InputDecoration(
//                         hintText: 'Food name',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8.r),
//                           borderSide: const BorderSide(color: Colors.grey),
//                         ),
//                         contentPadding: EdgeInsets.symmetric(
//                             vertical: 12.h, horizontal: 12.w),
//                       ),
//                     ),
//                     SizedBox(height: 16.h),
//                     CustomText(
//                       text: 'Price',
//                       fontsize: 12.sp,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                     ),
//                     SizedBox(height: 8.h),
//                     TextFormField(
//                       controller: controller.foodPrice,
//                       decoration: InputDecoration(
//                         hintText: 'Enter Price',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8.r),
//                           borderSide: const BorderSide(color: Colors.grey),
//                         ),
//                         contentPadding: EdgeInsets.symmetric(
//                             vertical: 12.h, horizontal: 12.w),
//                       ),
//                     ),
//                     SizedBox(height: 16.h),
//                     CustomText(
//                       text: 'Delievery Time',
//                       fontsize: 12.sp,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                     ),
//                     SizedBox(height: 8.h),
//                     TextFormField(
//                       controller: controller.foodDelievery,
//                       decoration: InputDecoration(
//                         hintText: 'Enter Delievery Time',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8.r),
//                           borderSide: const BorderSide(color: Colors.grey),
//                         ),
//                         contentPadding: EdgeInsets.symmetric(
//                             vertical: 12.h, horizontal: 12.w),
//                       ),
//                     ),
//                     SizedBox(height: 16.h),
//                     CustomText(
//                       text: 'Description',
//                       fontsize: 12.sp,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                     ),
//                     SizedBox(height: 8.h),
//                     TextFormField(
//                       controller: controller.foodDescription,
//                       decoration: InputDecoration(
//                         hintText: 'Enter Description',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8.r),
//                           borderSide: const BorderSide(color: Colors.grey),
//                         ),
//                         contentPadding: EdgeInsets.symmetric(
//                             vertical: 12.h, horizontal: 12.w),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               SizedBox(height: 38.h),
//               CustomButton(
//                 buttonColor: Colors.green,
//                 onTap: () {
//                   if (profilePhoto == null) {
//                     Get.snackbar("info", "Upload Food image");
//                     return;
//                   }

//                   controller.addMenuItem(truckId: "1", file: profilePhoto!);
//                 },
//                 buttonText: 'Save',
//                 fontSize: 14.sp,
//                 borderRadius: 20,
//                 fontFamily: AppFonts.plusJakartaSansRegular,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   String? validateTruckInfo() {
//     if (controller.foodName.text.isEmpty) {
//       return "Food name is required";
//     }
//     if (controller.foodPrice.text.isEmpty) {
//       return "Food price is required";
//     }

//     if (controller.foodDescription.text.isEmpty) {
//       return "Please add food description";
//     }
//     if (controller.foodDelievery.text.isEmpty) {
//       return "Please add food delivery time";
//     }
//     return null; // ✅ no error
//   }
// }

// // import 'dart:io';
// // import 'package:StreetSpot/controller/truck_controller.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:StreetSpot/custom_widgets/custom_button.dart';
// // import 'package:StreetSpot/custom_widgets/custom_text.dart';
// // import 'package:StreetSpot/utils/app_fonts.dart';
// // import 'package:get/get.dart';
// // import 'package:image_picker/image_picker.dart';

// // class AddMenuItemScreen extends StatefulWidget {
// //   const AddMenuItemScreen({super.key});

// //   @override
// //   State<AddMenuItemScreen> createState() => _AddMenuItemScreenState();
// // }

// // class _AddMenuItemScreenState extends State<AddMenuItemScreen> {
// //   final controller = Get.find<TruckController>();
// //   File? profilePhoto;

// //   @override
// //   void dispose() {
// //     super.dispose();
// //   }

// //   Future<void> pickImage() async {
// //     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
// //     if (pickedFile != null) {
// //       setState(() {
// //         profilePhoto = File(pickedFile.path);
// //       });
// //     }
// //   }

// //   Future<void> _addMenuItem(String truckId) async {
// //     final error = validateTruckInfo();
// //     if (error != null) {
// //       Get.snackbar("Error", error, colorText: Colors.black);
// //       return;
// //     }

// //     controller.isLoading.value = true;
// //     try {
// //       final formData = {
// //         'file': profilePhoto,
// //         'data': jsonEncode({
// //           "name": controller.foodName.text.trim(),
// //           "unit_price": double.tryParse(controller.foodPrice.text.trim()) ?? 0,
// //           "time_to_make": int.tryParse(controller.foodDelievery.text.trim()) ?? 0,
// //           "description": controller.foodDescription.text.trim(),
// //           "category_id": 1, // Default category_id; adjust as needed
// //         }),
// //       };

// //       await controller.truckRepo.apiClient.postFormData(
// //         url: '${ApiEndpoints.baseUrl}/v1/api/menu/item/$truckId',
// //         formData: formData,
// //         onSuccess: () {
// //           controller.isLoading.value = false;
// //           Get.snackbar("Success", "Menu item added", colorText: Colors.black);
// //           Get.back();
// //         },
// //         onError: (message) {
// //           controller.isLoading.value = false;
// //           Get.snackbar("Error", message, colorText: Colors.black);
// //         },
// //       );
// //     } catch (e) {
// //       controller.isLoading.value = false;
// //       Get.snackbar("Error", "Something went wrong: $e", colorText: Colors.black);
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back),
// //           onPressed: () {
// //             Navigator.pop(context);
// //           },
// //           color: Colors.black,
// //         ),
// //         title: const CustomText(
// //           text: 'Add Menu Items',
// //           fontsize: 18,
// //           fontWeight: FontWeight.bold,
// //           color: Colors.black,
// //         ),
// //       ),
// //       backgroundColor: Colors.white,
// //       body: Stack(
// //         children: [
// //           ListView(
// //             padding: EdgeInsets.all(16.w),
// //             children: [
// //               SizedBox(height: 24.h),
// //               Stack(
// //                 alignment: Alignment.center,
// //                 children: [
// //                   GestureDetector(
// //                     onTap: pickImage,
// //                     child: Container(
// //                       width: 140,
// //                       height: 120,
// //                       decoration: BoxDecoration(
// //                         color: Colors.grey[300],
// //                         borderRadius: BorderRadius.circular(16),
// //                       ),
// //                       child: profilePhoto != null
// //                           ? ClipRRect(
// //                               borderRadius: BorderRadius.circular(16),
// //                               child: Image.file(
// //                                 profilePhoto!,
// //                                 width: 140,
// //                                 height: 120,
// //                                 fit: BoxFit.cover,
// //                               ),
// //                             )
// //                           : const Center(
// //                               child: Icon(
// //                                 Icons.fastfood,
// //                                 size: 50,
// //                                 color: Colors.white,
// //                               ),
// //                             ),
// //                     ),
// //                   )
// //                 ],
// //               ),
// //               SizedBox(height: 24.h),
// //               CustomText(
// //                 text: '🍽️ Menu Information',
// //                 fontsize: 14.sp,
// //                 fontWeight: FontWeight.w600,
// //                 color: Colors.black,
// //               ),
// //               SizedBox(height: 12.h),
// //               Container(
// //                 padding: EdgeInsets.all(12.w),
// //                 decoration: BoxDecoration(
// //                   border: Border.all(color: Colors.grey),
// //                   borderRadius: BorderRadius.circular(8.r),
// //                 ),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     CustomText(
// //                       text: 'Food Name',
// //                       fontsize: 12.sp,
// //                       fontWeight: FontWeight.w600,
// //                       color: Colors.black,
// //                     ),
// //                     SizedBox(height: 8.h),
// //                     TextFormField(
// //                       controller: controller.foodName,
// //                       decoration: InputDecoration(
// //                         hintText: 'Food name',
// //                         border: OutlineInputBorder(
// //                           borderRadius: BorderRadius.circular(8.r),
// //                           borderSide: const BorderSide(color: Colors.grey),
// //                         ),
// //                         contentPadding: EdgeInsets.symmetric(
// //                             vertical: 12.h, horizontal: 12.w),
// //                       ),
// //                     ),
// //                     SizedBox(height: 16.h),
// //                     CustomText(
// //                       text: 'Price',
// //                       fontsize: 12.sp,
// //                       fontWeight: FontWeight.w600,
// //                       color: Colors.black,
// //                     ),
// //                     SizedBox(height: 8.h),
// //                     TextFormField(
// //                       controller: controller.foodPrice,
// //                       decoration: InputDecoration(
// //                         hintText: 'Enter Price',
// //                         border: OutlineInputBorder(
// //                           borderRadius: BorderRadius.circular(8.r),
// //                           borderSide: const BorderSide(color: Colors.grey),
// //                         ),
// //                         contentPadding: EdgeInsets.symmetric(
// //                             vertical: 12.h, horizontal: 12.w),
// //                       ),
// //                     ),
// //                     SizedBox(height: 16.h),
// //                     CustomText(
// //                       text: 'Delievery Time',
// //                       fontsize: 12.sp,
// //                       fontWeight: FontWeight.w600,
// //                       color: Colors.black,
// //                     ),
// //                     SizedBox(height: 8.h),
// //                     TextFormField(
// //                       controller: controller.foodDelievery,
// //                       decoration: InputDecoration(
// //                         hintText: 'Enter Delievery Time',
// //                         border: OutlineInputBorder(
// //                           borderRadius: BorderRadius.circular(8.r),
// //                           borderSide: const BorderSide(color: Colors.grey),
// //                         ),
// //                         contentPadding: EdgeInsets.symmetric(
// //                             vertical: 12.h, horizontal: 12.w),
// //                       ),
// //                     ),
// //                     SizedBox(height: 16.h),
// //                     CustomText(
// //                       text: 'Description',
// //                       fontsize: 12.sp,
// //                       fontWeight: FontWeight.w600,
// //                       color: Colors.black,
// //                     ),
// //                     SizedBox(height: 8.h),
// //                     TextFormField(
// //                       controller: controller.foodDescription,
// //                       decoration: InputDecoration(
// //                         hintText: 'Enter Description',
// //                         border: OutlineInputBorder(
// //                           borderRadius: BorderRadius.circular(8.r),
// //                           borderSide: const BorderSide(color: Colors.grey),
// //                         ),
// //                         contentPadding: EdgeInsets.symmetric(
// //                             vertical: 12.h, horizontal: 12.w),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               SizedBox(height: 38.h),
// //               Obx(() => CustomButton(
// //                     buttonColor: Colors.green,
// //                     onTap: () {
// //                       _addMenuItem("truck_id"); // Replace with actual truck_id
// //                     },
// //                     buttonText: 'Save',
// //                     fontSize: 14.sp,
// //                     borderRadius: 20,
// //                     fontFamily: AppFonts.plusJakartaSansRegular,
// //                     isLoading: controller.isLoading.value,
// //                   )),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   String? validateTruckInfo() {
// //     if (controller.foodName.text.isEmpty) {
// //       return "Food name is required";
// //     }
// //     if (controller.foodPrice.text.isEmpty) {
// //       return "Food price is required";
// //     }
// //     if (controller.foodDescription.text.isEmpty) {
// //       return "Please add food description";
// //     }
// //     if (controller.foodDelievery.text.isEmpty) {
// //       return "Please add food delivery time";
// //     }
// //     return null; // ✅ no error
// //   }
// // }

import 'dart:io';

import 'package:StreetSpot/controller/truck_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:StreetSpot/custom_widgets/custom_button.dart';
import 'package:StreetSpot/custom_widgets/custom_text.dart';
import 'package:StreetSpot/utils/app_fonts.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddMenuItemScreen extends StatefulWidget {
  const AddMenuItemScreen({super.key});

  @override
  State<AddMenuItemScreen> createState() => _AddMenuItemScreenState();
}

class _AddMenuItemScreenState extends State<AddMenuItemScreen> {
  TruckController controller = Get.find<TruckController>();
  File? profilePhoto;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        profilePhoto = File(pickedFile.path);
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (profilePhoto == null) {
        Get.snackbar("Error", "Please upload a food image",
            colorText: Colors.black);
        return;
      }
      controller.addMenuItem(truckId: "1", file: profilePhoto!);
    }
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
        title: const CustomText(
          text: 'Add Menu Items',
          fontsize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.all(16.w),
            children: [
              SizedBox(height: 24.h),
              Stack(
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                    onTap: pickImage,
                    child: Container(
                      width: 140,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: profilePhoto != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.file(
                                profilePhoto!,
                                width: 140,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            )
                          : const Center(
                              child: Icon(
                                Icons.fastfood,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 24.h),
              CustomText(
                text: '🍽️ Menu Information',
                fontsize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              SizedBox(height: 12.h),
              Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Food Name *',
                        fontsize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      SizedBox(height: 8.h),
                      TextFormField(
                        controller: controller.foodName,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Food name is required';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Food name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 12.w),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      CustomText(
                        text: 'Price *',
                        fontsize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      SizedBox(height: 8.h),
                      TextFormField(
                        controller: controller.foodPrice,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Price is required';
                          }
                          final price = double.tryParse(value.trim());
                          if (price == null || price <= 0) {
                            return 'Please enter a valid positive price';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter Price',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 12.w),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      CustomText(
                        text: 'Delivery Time *',
                        fontsize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      SizedBox(height: 8.h),
                      TextFormField(
                        controller: controller.foodDelievery,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Delivery time is required';
                          }
                          final time = int.tryParse(value.trim());
                          if (time == null || time <= 0) {
                            return 'Please enter a valid positive delivery time';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter Delivery Time',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 12.w),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      CustomText(
                        text: 'Description *',
                        fontsize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      SizedBox(height: 8.h),
                      TextFormField(
                        controller: controller.foodDescription,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Description is required';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter Description',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 12.w),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 38.h),
              CustomButton(
                buttonColor: Colors.green,
                onTap: _submitForm,
                buttonText: 'Save',
                fontSize: 14.sp,
                borderRadius: 20,
                fontFamily: AppFonts.plusJakartaSansRegular,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
