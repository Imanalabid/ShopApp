import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:shopapp/controller/language_change_controller.dart';
import 'package:shopapp/generated/l10n.dart';
import 'package:shopapp/route/Route_Helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => LanguageChangeController()),
          ],
          child: Consumer<LanguageChangeController>(
            builder: (context, provider, child) {
              return GetMaterialApp(
                initialRoute: '/splash',
                getPages: RouteHelper.getPages,
                debugShowCheckedModeBanner: false,
                locale: provider.appLocale,
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: [
                  Locale('en'),
                  Locale('ar'),
                ],
                textDirection: provider.appLocale?.languageCode == 'ar'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
              );
            },
          ),
        );
      },
    );
  }
}
