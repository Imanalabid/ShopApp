import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../config/Colors.dart';
import '../../../../../route/Route_Helper.dart';
import '../../../widgets/search.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  bool isAdvancedView = false;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: EdgeInsets.only(top: 40.h, right: 10.w, left: 10.w, bottom: 10.h),
        child: SingleChildScrollView(
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
                        fontSize: 26.sp,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(
          
                        isAdvancedView ? Icons.list : Icons.grid_on,
                        size: 30,
                        color: AppColors.Icon1Color,
                      ),
                      onPressed: () {
                        setState(() {
                          isAdvancedView = !isAdvancedView;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                    Get.back();
                    },
                    child: Icon(Icons.arrow_back_ios,color: AppColors.Icon1Color,),
                  ),
                  SearchWidget(),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              SingleChildScrollView(
                child: Container(
                  height: 500.h,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return isAdvancedView
                          ? StatefulListItemAdvanced()
                          : StatefulListItem();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StatefulListItem extends StatefulWidget {
  @override
  _StatefulListItemState createState() => _StatefulListItemState();
}

class _StatefulListItemState extends State<StatefulListItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return buildListItem(context, isFavorite, () {
      setState(() {
        isFavorite = !isFavorite;
      });
    });
  }
}

class StatefulListItemAdvanced extends StatefulWidget {
  @override
  _StatefulListItemAdvancedState createState() => _StatefulListItemAdvancedState();
}

class _StatefulListItemAdvancedState extends State<StatefulListItemAdvanced> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return buildListItemAdvanced(context, isFavorite, () {
      setState(() {
        isFavorite = !isFavorite;
      });
    });
  }
}
Widget buildListItem(BuildContext context, bool isFavorite, VoidCallback onPressed) {
  return SingleChildScrollView(
    child: InkWell(
      onTap: () {
        Get.toNamed(RouteHelper.ProductsDetail);
      },
      child: Container(
        width: 150.0.w,
        height: 85.0.h,
        child: Stack(
          children: [

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: 75.w,
                      height: 85.0.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/img/popular.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'sweater accessories clothes',
                          style: TextStyle(
                            color: AppColors.mainfontColor,
                            fontSize: 18.sp,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                        Row(

                          children: [
                            Text(
                              '199\$',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16.sp,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.4),
                            Positioned(
                              top: 180.0,
                              right: 1.0,
                              child: IconButton(
                                icon: Icon(
                                  Icons.favorite,
                                  color: isFavorite ? Colors.red : Colors.grey,
                                  size: 35,
                                ),
                                onPressed: onPressed,
                              ),)
                          ],
                        ),
                      ],
                    ),



                  ],
                ),


              ],
            ),


          ],
        ),
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: AppColors.containerColor,
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
    ),
  );
}

Widget buildListItemAdvanced(BuildContext context, bool isFavorite, VoidCallback onPressed) {
  return SingleChildScrollView(
    child: InkWell(
      onTap: () {
        Get.toNamed(RouteHelper.ProductsDetail);
      },
      child: Container(
        height: 300.0.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 160.0.w,
              margin: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0.r),
                    child: Image.asset(

                      'assets/img/popular.jpg',
                      height: 180.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width * 0.025),

                      Text(

                        'sweater accessories\nclothes',
                        style: TextStyle(
                          color: Colors.black, // Change to your desired color
                          fontSize: 14.0.sp, // Change to your desired font size
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.005,
                  ),
                  Row(

                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width * 0.025),
                      Text(
                        '199\$',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16.sp,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.18),
                      Positioned(
                        top: 180.0,
                        right: 1.0,
                        child: IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: isFavorite ? Colors.red : Colors.grey,
                            size: 35,
                          ),
                          onPressed: onPressed,
                        ),)
                    ],
                  ),

                ],
              ),
              decoration: BoxDecoration(
                color: AppColors.containerColor,
                borderRadius: BorderRadius.circular(15.r),
              ),

            );
          },
        ),
      ),
    ),
  );
}

