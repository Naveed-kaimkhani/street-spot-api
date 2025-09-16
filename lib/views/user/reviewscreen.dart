import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:StreetSpot/custom_widgets/custom_button.dart' show CustomButton;
import 'package:StreetSpot/custom_widgets/custom_text.dart' show CustomText;
import 'package:StreetSpot/routes/route_name.dart';
import 'package:StreetSpot/utils/app_fonts.dart';
import 'package:get/get.dart';

class ReviewScreen extends StatefulWidget {
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final _formKey = GlobalKey<FormState>();
  double _rating = 0;
  final _titleController = TextEditingController();
  final _reviewController = TextEditingController();
  final _emailController = TextEditingController();
  String _selectedLabel = '--Select Label--';

  @override
  void dispose() {
    _titleController.dispose();
    _reviewController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: CustomText(
            text: "Review",
            fontWeight: FontWeight.bold,
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context); // Navigate back when tapped
            },
            child: Container(
              margin: EdgeInsets.all(8.w),
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black)),
              child: Icon(
                Icons.arrow_back,
                size: 20.r,
                color: Colors.black,
              ),
            ),
          )),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 6.h,
              ),
              Text(
                'Score:',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(
                height: 6.h,
              ),
              RatingBar.builder(
                initialRating: _rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 30,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _rating = rating;
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'Title:',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(
                height: 6.h,
              ),
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: 'Enter review title',
                  // enabledBorder: Colors.accents,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Review:',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(
                height: 6.h,
              ),
              TextFormField(
                controller: _reviewController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Write your review here...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Label:',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(
                height: 6.h,
              ),
              DropdownButtonFormField<String>(
                value: _selectedLabel,
                decoration: InputDecoration(
                  hintText: '--Select Label--',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                items: <String>[
                  '--Select Label--',
                  'Positive',
                  'Negative',
                  'Neutral'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedLabel = newValue!;
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'Email: *',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(
                height: 6.h,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'you@example.com',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                buttonColor: Colors.orange,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Get.offNamed(AppRouteName.HOME_SCREEN_ROUTE);
                    // Handle form submission
                  }
                  // AppNavigation.navigateCloseDialog(context);
                },
                buttonText: 'Submit Review',
                fontSize: 14.sp,
                borderRadius: 20,
                fontFamily: AppFonts.plusJakartaSansRegular,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
