import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../config/Colors.dart';
import '../../../../../route/Route_Helper.dart';

class ProductsDetailsPage extends StatelessWidget {
  ProductsDetailsPage({super.key, required this.rating});

  final int rating;
  final GetStorage favoritesBox = GetStorage('favorites');

  List<String> imageUrls = [
    "https://i.insider.com/618acc1e80dab90018db0144?width=1000",
    "https://i.insider.com/618acc1e80dab90018db0144?width=1000",
    "https://i.insider.com/618acc1e80dab90018db0144?width=1000",
    // Add more image URLs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 40.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeader(context),
              SizedBox(height: 20.h),
              buildImageSlider(),
              SizedBox(height: 10.h),
              buildPriceAndVisitStoreButton(context),
              SizedBox(height: 10.h),
              buildProductName(),
              SizedBox(height: 10.h),
              buildRatingStars(),
              SizedBox(height: 30.h),
              buildDescription(),
              SizedBox(height: 10.h),
              buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Stack(
      children: [
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
            SizedBox(width: MediaQuery
                .of(context)
                .size
                .width * 0.03),
            Text(
              "Product Details",
              style: TextStyle(
                color: AppColors.secoundfontColor,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
              ),
            ),
            Spacer(),
          ],
        ),
        Positioned(
          top: 0.0,
          right: 1.0,
          child: IconButton(
            onPressed: () {
              Get.toNamed(RouteHelper.initial);
            },
            icon: Icon(Icons.home), // Replace with your desired icon
            color: AppColors.Icon1Color,
            iconSize: 26,
          ),
        ),
      ],
    );
  }

  Widget buildImageSlider() {
    return Container(
      height: 400.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Image.network(imageUrls[index], width: 600);
        },
      ),
    );
  }

  Widget buildPriceAndVisitStoreButton(BuildContext context) {
    return Row(
      children: [
        Text(
          ' \$400.00',
          style: TextStyle(
            color: Colors.red,
            fontSize: 22.sp,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        InkWell(
          onTap: () {
            Get.toNamed(RouteHelper.initial);
          },
          child: Container(
            height: 45,
            width: 90,
            child: Center(
              child: Text(
                'Visit Store',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade500,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildProductName() {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Name: Basic Korean-style Dress',
            style: TextStyle(
              color: AppColors.mainfontColor,
              fontSize: 22.sp,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildRatingStars() {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star,
          color: index < 4 ? Colors.amber : Colors.grey,
        );
      }),
    );
  }

  Widget buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(
            color: AppColors.mainfontColor,
            fontSize: 16.sp,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
          style: TextStyle(
            color: AppColors.smalltextfontColor,
            fontSize: 12.sp,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {
            addToFavorites();
          },
          child: Text(
            'Favorite',
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Manrope',
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.amber,
            onPrimary: Colors.white,
            fixedSize: Size(180, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0.r),
            ),
          ),
        ),
        SizedBox(width: 15.w),
        ElevatedButton(
          onPressed: () {
            addToCart();
          },
          child: Text(
            'Add to Cart',
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Manrope',
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
            onPrimary: Colors.white,
            fixedSize: Size(180, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0.r),
            ),
          ),
        ),
      ],
    );
  }

  void addToFavorites() {
    // Get the list of favorite items from storage
    List<Map<String, dynamic>> favorites = favoritesBox.read('favorites') ?? [];

    // Replace 'itemPrice' with the actual price of the item
    String itemPrice = '\$400.00';

    Map<String, dynamic> newItem = {
      'name': 'Basic Korean-style Dress',
      // Replace with the actual name of the item
      'image': imageUrls.first,
      // Replace with the actual image URL
      'price': itemPrice,
    };

    favorites.add(newItem);

    favoritesBox.write('favorites', favorites);

    Get.snackbar(
      'Added to Favorites',
      'Item has been added to favorites',
      mainButton: TextButton(
        onPressed: () {
          Get.toNamed(
            RouteHelper.Favorite,
            arguments: {'price': itemPrice},
          ); // Navigate to the favorite page with the price argument
        },
        child: Text(
          'Go to Favorites',
          style: TextStyle(
            color: Colors.yellow,
          ),
        ),
      ),
    );
  }

  void addToCart() {
    String itemName = 'Basic Korean-style Dress';
    double itemPrice = 400.00;

    Map<String, dynamic> newItem = {
      'name': itemName,
      'image': imageUrls.first,
      'price': itemPrice.toDouble(), // Store itemPrice as a double
      'count': 1,
    };

    dynamic cartItemsDynamic = favoritesBox.read('cart');

    if (cartItemsDynamic != null && cartItemsDynamic is List<dynamic>) {
      List<Map<String, dynamic>> cartItems =
      List<Map<String, dynamic>>.from(cartItemsDynamic);

      int existingIndex =
      cartItems.indexWhere((item) => item['name'] == itemName);

      if (existingIndex != -1) {
        cartItems[existingIndex]['count'] =
            (cartItems[existingIndex]['count'] ?? 1) + 1;
      } else {
        cartItems.add(newItem);
      }

      favoritesBox.write('cart', cartItems);

      Get.snackbar(
        'Added to Cart',
        'Item has been added to the cart',
        mainButton: TextButton(
          onPressed: () {
            Get.toNamed(
              RouteHelper.Cart,
              arguments: {'cartItems': cartItems, 'totalPrice': itemPrice},
            );
          },
          child: Text(
            'Go to Cart',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      );
    } else {
      print('Error: Cart data is not of type List<Map<String, dynamic>>');
    }
  }

}