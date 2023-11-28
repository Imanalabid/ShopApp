import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../config/Colors.dart';
import '../../widgets/search.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding:
        EdgeInsets.only(top: 40.h, right: 10.w, left: 10.w, bottom: 10.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 12.w, left: 12.w, bottom: 10.h),
              child: Row(
                children: [
                  Text(
                    "Osus",
                    style: TextStyle(
                        color: AppColors.secoundfontColor,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.bold,
                        fontSize: 26.sp),
                  ),
                  Spacer(),

                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              children: [
                InkWell(
                    onTap: (){
                      Get.toNamed('/initial');
                    },
                    child: Icon(Icons.arrow_back_ios)),
                SearchWidget(),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Padding(
              padding:  EdgeInsets.only(right: 10.w,left: 15.w),
              child: Container(
                        height: 500.h,
                        child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 8,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    3,
                        (i) {
                      final categoryIndex = index * 3 + i; // Adjusted to match the number of containers
                      if (categoryIndex < 10) {
                        return GestureDetector(
                          onTap: () {
                            // Navigate to the next page
                            // You can replace '/nextPage' with the actual route you want to navigate to
                            Get.toNamed('/ProductsScreen');
                          },
                          child: Container(
                            width: 80.0.w,
                            height: 90.0.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/img/shirt.png',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  height: 10.h, // Adjusted spacing
                                ),
                                Text(
                                  'shirt',
                                  style: TextStyle(
                                    color: AppColors.mainfontColor,
                                    fontSize: 14.sp,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            margin: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: AppColors.containerColor,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                          ),
                        );
                      } else {
                        return SizedBox.shrink(); // Return an empty space for exceeding index
                      }
                    },
                  ),
                );
              },
                        ),
                      ),
            )


          ],
        ),
      ),
    );
  }
}
