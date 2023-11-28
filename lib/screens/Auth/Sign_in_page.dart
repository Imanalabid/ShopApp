import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../config/Colors.dart';
import '../../controller/language_change_controller.dart';
import '../../generated/l10n.dart';
import 'Widgets/reusableTextField.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

enum Language { English, Arabic }

TextEditingController _passwordTextController = TextEditingController();
TextEditingController _emailTextController = TextEditingController();

class _SignInPageState extends State<SignInPage> {
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return null;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      // Handle exceptions that might occur during the sign-in process
      print("Error signing in with Google: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Padding(
          padding:
          EdgeInsets.only(top: 40.h, right: 10.w, left: 10.w, bottom: 10.h),
          child: Column(
            children: [
              Row(
                children: [
                  Consumer<LanguageChangeController>(
                    builder: (context, provider, child) {
                      return PopupMenuButton<Language>(
                        icon: Icon(
                          Icons.language,
                          color: AppColors.secoundfontColor,
                          size: 40, // Set the desired color here
                        ),
                        onSelected: (Language item) {
                          if (Language.English.name == item.name) {
                            provider.changeLanguage(Locale('en'));
                          } else {
                            provider.changeLanguage(Locale('ar'));
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuEntry<Language>>[
                          PopupMenuItem<Language>(
                            value: Language.English,
                            child: Text('English'),
                          ),
                          PopupMenuItem<Language>(
                            value: Language.Arabic,
                            child: Text('Arabic'),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 120.h,
                    width: 200.w,
                    child: Image.asset(
                      "assets/img/OSUSlogo.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome to ",
                    style: TextStyle(
                        color: AppColors.mainfontColor,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Our Shopping App",
                    style: TextStyle(
                        color: AppColors.mainfontColor,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.07),
              Container(
                height: 50.h,
                width: 300.w,
                child: reusableTextField(
                  S.of(context).email,
                  Icons.email,
                  false,
                  _emailTextController,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                height: 50.h,
                width: 300.w,
                child: reusableTextField(
                  S.of(context).password,
                  Icons.password,
                  true,
                  _passwordTextController,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Container(
                height: 48.h,
                width: 300.w,
                child: ElevatedButton(
                  onPressed: () async {
                    // Add your login logic here
                  },
                  child: Text(
                    S.of(context).login,
                    style: TextStyle(
                        color: AppColors.containerColor, fontSize: 20.sp),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return AppColors.secoundfontColor;
                      }
                      return Colors.blue.shade900;
                    }),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withAlpha(200),
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade500,
                      indent: 32,
                      endIndent: 20,
                    ),
                  ),
                  Text(
                    "or",
                    style: TextStyle(
                      color: AppColors.mainfontColor,
                      fontSize: 18.sp,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade500,
                      indent: 32,
                      endIndent: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      UserCredential? userCredential = await signInWithGoogle();

                      if (userCredential != null) {
                        User? user = userCredential.user;

                        // Handle the signed-in user here, e.g., navigate to a new screen
                        if (user != null) {
                          // Navigate to the new screen or update the UI
                          print("Signed in with Google: ${user.displayName}");
                          Get.toNamed('/initial');
                        } else {
                          // Handle the case when the user is null
                          print("Failed to sign in with Google");
                        }
                      }
                    },
                    child: Container(
                      height: 80.h,
                      width: 80.w,
                      child: Image.asset("assets/img/gg.png"),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
                  Container(
                    height: 80.h,
                    width: 80.w,
                    child: Image.asset("assets/img/fb.png"),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "You don\'t have an account ?",
                    style: TextStyle(
                        color: AppColors.secoundfontColor,
                        fontFamily: 'Manrope',
                        fontSize: 12.sp),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                  Text(
                    "Create",
                    style: TextStyle(
                        color: AppColors.secoundfontColor,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
