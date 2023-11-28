import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../config/Colors.dart';
import '../../../generated/l10n.dart';
import '../../../route/Route_Helper.dart';
import '../widgets/bannerWidget.dart';
import '../widgets/CategoriesWidget.dart';
import '../widgets/popularVendorWidget.dart';
import '../widgets/search.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  List<String> image = [
    'assets/img/bgshop.jpg',
    'assets/img/bgshop.jpg',
    'assets/img/bgshop.jpg',
    'assets/img/bgshop.jpg',
    // Add more image URLs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding:
        EdgeInsets.only(top: 40.h, right: 10.w, left: 10.w, bottom: 10.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              //Osus
              Padding(
                padding: EdgeInsets.only(right: 12.w, left: 12.w, bottom: 10.h),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
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

                        InkWell(
                          onTap: (){
                            Get.toNamed(RouteHelper.Favorite);
                          },
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 35,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Icon(
                          Icons.notifications_active_outlined,
                          color: AppColors.Icon1Color,
                          size: 35,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SearchWidget(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Container(
                height: 280.0,
                width: 380,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: image.length,
                  itemBuilder: (context, index) {
                    return Image.asset(image[index],);
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              //Categories
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: isArabic() ? 20.w : 10.w,
                        right: isArabic() ? 25.w : 20.w),
                    child: Text(
                      S.of(context).categories,
                      style: TextStyle(
                          color: AppColors.mainfontColor,
                          fontSize: 20.sp,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/Categories');
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Text(S.of(context).view_all,
                              style: TextStyle(
                                color: AppColors.secoundfontColor,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                              )),
                          Icon(
                            Icons.arrow_right,
                            color: AppColors.Icon1Color,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              CategoryList(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: isArabic() ? 25.w : 10.w,
                        right: isArabic() ? 20.w : 20.w),
                    child: Text(
                      S.of(context).featured,
                      style: TextStyle(
                          color: AppColors.mainfontColor,
                          fontSize: 20.sp,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/PopularVendor');
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Text(S.of(context).view_all,
                              style: TextStyle(
                                color: AppColors.secoundfontColor,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w600,
                              )),
                          Icon(
                            Icons.arrow_right,
                            color: AppColors.Icon1Color,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              PCategoryList(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );





  }}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
