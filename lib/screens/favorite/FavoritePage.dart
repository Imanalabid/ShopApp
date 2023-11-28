
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import '../../config/Colors.dart';
import '../home/widgets/search.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({Key? key}) : super(key: key);

  // GetStorage instance to access stored favorites
  final GetStorage favoritesBox = GetStorage('favorites');

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data = Get.arguments;
    String? itemPrice = data?['price'];

    // Get the list of favorite items from storage
    List<Map<String, dynamic>> favoriteItems =
        favoritesBox.read('favorites') ?? [];

    // Extract the image URLs
    List<String> imageUrls =
    favoriteItems.map((item) => item['image'].toString()).toList();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: 40.h, right: 10.w, left: 10.w, bottom: 10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 12.w, left: 12.w, bottom: 10.h),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.01,
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
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.01,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.Icon1Color,
                      size: 26,
                    ),
                  ),
                  SearchWidget(),
                ],
              ),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.03,
              ),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: favoriteItems.length,
                  itemBuilder: (context, index) {
                    return buildFavoriteItem(
                      context,
                      favoriteItems[index]['name'],
                      imageUrls[index],
                      favoriteItems[index]['price'],
                      onRemove: () => removeFromFavorites(index),
                    );

                  },
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildFavoriteItem(
      BuildContext context,
      String itemName,
      String imageUrl,
      String? itemPrice, {
        required VoidCallback onRemove,
      }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image
          Image.network(
            imageUrl, // Use the provided imageUrl
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 6.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Text(
                itemName,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10.h),
              // Product price
              Text(
                'Price: ${formatPrice(itemPrice) ?? "N/A"}',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Spacer(),
          // Remove icon
          Column(
            children: [
              SizedBox(height: 25.h),
              InkWell(
                onTap: onRemove,
                child: Icon(
                  Icons.highlight_remove,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  String? formatPrice(String? price) {
    // Add your logic for formatting the price if needed
    return price;
  }
  void removeFromFavorites(int index) {
    List<Map<String, dynamic>> favoriteItems =
        favoritesBox.read('favorites') ?? [];

    // Ensure index is valid
    if (index >= 0 && index < favoriteItems.length) {
      favoriteItems.removeAt(index);
      favoritesBox.write('favorites', favoriteItems);

      // Trigger a rebuild of the UI
      Get.forceAppUpdate();
    }
  }
}
