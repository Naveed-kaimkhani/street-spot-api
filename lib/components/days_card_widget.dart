import 'package:StreetSpot/model/weekly_schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DaysCardWidget extends StatelessWidget {
  final WeeklySchedule weeklySchedule;
  const DaysCardWidget({
    required this.weeklySchedule,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            weeklySchedule.day,
            style: TextStyle(fontSize: 14.sp),
          ),
          Row(
            children: [
              Text(
                weeklySchedule.startTime.split(":").sublist(0, 2).join(":"),
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
              // ignore: prefer_const_constructors
              // SizedBox(
              //   width: 5,
              // ),
              Text(
                "  - ",
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
              Text(
                weeklySchedule.endTime.split(":").sublist(0, 2).join(":"),
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
