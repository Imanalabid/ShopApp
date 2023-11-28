import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../config/Colors.dart';
import '../../widgets/search.dart';

class PopularVendorCategories extends StatelessWidget {
  const PopularVendorCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 35,
                      ),
                      Icon(
                        Icons.notifications_active_outlined,
                        color: AppColors.Icon1Color,
                        size: 35,
                      ),
                    ],
                  )
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
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two items per row
                  crossAxisSpacing: 8.0, // Adjust spacing as needed
                  mainAxisSpacing: 8.0, // Adjust spacing as needed
                ),
                itemCount: 9, // Adjust the number of items as needed
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 160.0.w,
                    height: 250.0.h,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(
                            'assets/img/shop.jpg',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        Positioned.fill(
                          child: ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.transparent, Colors.white38.withOpacity(0.5)],
                              ).createShader(bounds);
                            },
                            blendMode: BlendMode.darken,
                            child: Container(),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'sweater accessories clothes',
                                  style: TextStyle(
                                    color: AppColors.containerColor,
                                    fontSize: 14.0.sp,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: List.generate(
                                    5, // Number of stars
                                        (index) => Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 16.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
