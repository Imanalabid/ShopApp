import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../config/Colors.dart';
import '../screens/home/widgets/search.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<Map<String, dynamic>> cartItems = [];
  late double totalPrice;
  final GetStorage CartBox = GetStorage('cart');

  double calculateTotalPrice(List<Map<String, dynamic>> items) {
    double totalPrice = 0.0;
    for (var item in items) {
      String priceString = item['price'] ?? '0.0';
      double price = double.tryParse(priceString) ?? 0.0;
      int quantity = item['count'] ?? 1;
      totalPrice += price * quantity;
    }
    return totalPrice;
  }

  // Recalculate total price method
  void recalculateTotalPrice() {
    setState(() {
      totalPrice = calculateTotalPrice(cartItems);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadCartItems();
  }

  void loadCartItems() {
    final Map<String, dynamic>? arguments =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    if (arguments != null && arguments.containsKey('cartItems')) {
      final cartItemsDynamic = arguments['cartItems'];
      if (cartItemsDynamic != null && cartItemsDynamic is List<dynamic>) {
        List<Map<String, dynamic>> existingCartItems =
        List<Map<String, dynamic>>.from(CartBox.read('cart') ?? []);

        for (Map<String, dynamic> newItem
        in List<Map<String, dynamic>>.from(cartItemsDynamic)) {
          int existingIndex = existingCartItems
              .indexWhere((item) => item['name'] == newItem['name']);

          if (existingIndex != -1) {
            existingCartItems[existingIndex]['count'] =
                (existingCartItems[existingIndex]['count'] ?? 1) + 1;
          } else {
            existingCartItems.add(newItem);
          }
        }

        CartBox.write('cart', existingCartItems);
        cartItems = existingCartItems;
        recalculateTotalPrice();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 40.h,
          right: 10.w,
          left: 10.w,
          bottom: 10.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                        fontSize: 26.sp,
                      ),
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
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Container(
                height: 400.h,
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final Map<String, dynamic> cartItem = cartItems[index];
                    final String itemName = cartItem['name'] ?? '';
                    final String imageUrl = cartItem['image'] ?? '';
                    final int quantity = cartItem['count'] ?? 1;
                    final String priceString = cartItem['price'] ?? '0.0';
                    final double itemPrice =
                    double.parse(priceString.replaceAll(RegExp(r'[^0-9.]'), ''));

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
                          Image.network(
                            imageUrl,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 6.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.01,
                              ),
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
                              Text(
                                'Price: ${formatPrice(itemPrice) ?? "N/A"}',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        cartItem['count'] = quantity + 1;
                                        recalculateTotalPrice();
                                      });
                                    },
                                    child: Container(
                                      height: 30.h,
                                      width: 30.w,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    '$quantity',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  InkWell(
                                    onTap: () {
                                      if (quantity > 1) {
                                        setState(() {
                                          cartItem['count'] = quantity - 1;
                                          recalculateTotalPrice();
                                        });
                                      }
                                    },
                                    child: Container(
                                      height: 30.h,
                                      width: 30.w,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total Price: ${formatPrice(totalPrice)}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formatPrice(double price) {
    return '\$$price';
  }
}
