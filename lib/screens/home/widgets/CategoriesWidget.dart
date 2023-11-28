import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/Colors.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8, // Display exactly 5 items
        itemBuilder: (context, index) {
          return Container(
            width: 70.0.w,
            height: 110.0.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Image.asset(
                  'assets/img/shirt.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.004,
                ),
                Text(
                  'shirt',
                  style: TextStyle(
                      color: AppColors.mainfontColor,
                      fontSize: 14.sp,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: AppColors.containerColor,
                borderRadius: BorderRadius.circular(15.r)),
          );
        },
      ),
    );
  }
}
