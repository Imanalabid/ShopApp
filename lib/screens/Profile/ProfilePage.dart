import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import '../../config/Colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 350.h,
            child: Padding(
              padding: EdgeInsets.only(top: 25.h, right: 12.w, left: 12.w, bottom: 10.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                        'Profile',
                        style: TextStyle(
                          color: AppColors.containerColor,
                          fontSize: 22.sp,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                  GestureDetector(
                    onTap: () {
                      _pickImage();
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: 130.0,
                          height: 130.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 8.0, // Adjust the width of the border as needed
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 65.0,
                            backgroundImage: _image != null ? FileImage(_image!) : null,
                            child: _image == null
                                ? Icon(Icons.camera_alt, size: 30.0, color: Colors.white)
                                : null,
                          ),
                        ),

                        if (_image != null)
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 20.0,
                              backgroundColor: Colors.blue,
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                  Text(
                    'User name',
                    style: TextStyle(
                      color: AppColors.containerColor,
                      fontSize: 18.sp,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.r), bottomRight: Radius.circular(20.r)),
              gradient: LinearGradient(
                colors: [AppColors.secoundfontColor, Colors.blue.shade400],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Positioned(
            top: 210.h,
            left: 15,
            right: 15,
            child: Container(
              height: 450.h,
              child: Padding(
                padding: EdgeInsets.only( top:25.h,right: 12.w, left: 12.w,),
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                          Icon(Icons.edit,color: AppColors.Icon1Color,size: 32,),
                          SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                          Text(
                            ' Edit Profile',
                            style: TextStyle(
                              color: AppColors.mainfontColor,
                              fontSize: 16.sp,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios,color: AppColors.Icon3Color,size: 25,)
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width*0.03,),

                        Icon(Icons.edit_location_rounded,color: Colors.blueAccent,size: 32,),
                        SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                        Text(
                          'Shipping address ',
                          style: TextStyle(
                              color: AppColors.mainfontColor,
                              fontSize: 16.sp,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios,color: AppColors.Icon3Color,size: 25,)
                      ],
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width*0.03,),

                        Icon(Icons.favorite,color: Colors.red,size: 32,),
                        SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                        Text(
                          'Wish List',
                          style: TextStyle(
                              color: AppColors.mainfontColor,
                              fontSize: 16.sp,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios,color: AppColors.Icon3Color,size: 25,)
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width*0.03,),

                        Icon(Icons.history,color: AppColors.Icon3Color,size: 32,),
                        SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                        Text(
                          'Order History',
                          style: TextStyle(
                              color: AppColors.mainfontColor,
                              fontSize: 16.sp,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios,color: AppColors.Icon3Color,size: 25,)
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width*0.03,),

                        Icon(Icons.track_changes,color: AppColors.Icon1Color,size: 32,),
                        SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                        Text(
                          ' Track Order',
                          style: TextStyle(
                              color: AppColors.mainfontColor,
                              fontSize: 16.sp,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios,color: AppColors.Icon3Color,size: 25,)
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width*0.03,),

                        Icon(Icons.payment,color: Colors.green,size: 32,),
                        SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                        Text(
                          ' Save Cards',
                          style: TextStyle(
                              color: AppColors.mainfontColor,
                              fontSize: 16.sp,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios,color: AppColors.Icon3Color,size: 25,)
                      ],
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width*0.03,),

                        Icon(Icons.settings,color:Colors.amber,size: 32,),
                        SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                        Text(
                          ' Setting',
                          style: TextStyle(
                              color: AppColors.mainfontColor,
                              fontSize: 16.sp,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios,color: AppColors.Icon3Color,size: 25,)
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
                    GestureDetector(

                      onTap: ()  {
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                          Icon(Icons.logout,color:Colors.red,size: 32,),
                          SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                          Text(
                            ' Logout',
                            style: TextStyle(
                                color: AppColors.mainfontColor,
                                fontSize: 16.sp,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios,color: AppColors.Icon3Color,size: 25,)
                        ],
                      ),
                    ),





                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
