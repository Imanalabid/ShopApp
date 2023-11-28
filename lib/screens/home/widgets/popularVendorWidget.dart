import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/Colors.dart';

class PCategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8, // Display exactly 5 items
        itemBuilder: (context, index) {
          return Container(
            width: 160.0.w,
            height: 250.0.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0), // Adjust the radius as needed
                  child: Image.asset(
                    'assets/img/popular.jpg',

                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  'sweater accessories clothes',
                  style: TextStyle(
                    color: AppColors.mainfontColor,
                    fontSize: 12.sp,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
              ],
            ),
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: AppColors.containerColor,
              borderRadius: BorderRadius.circular(15.r),
            ),
          );

        },
      ),
    );
  }
}
