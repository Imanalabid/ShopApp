import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../Cart/cart_page.dart';
import '../screens/Auth/Sign_in_page.dart';
import '../screens/Profile/ProfilePage.dart';
import '../screens/favorite/FavoritePage.dart';
import '../screens/home/pages/Categories/Categories_Page.dart';
import '../screens/home/pages/Categories/products/Products.dart';
import '../screens/home/pages/Categories/products/product_details.dart';
import '../screens/home/pages/PopularVendor/popular_vendor.dart';
import '../screens/home/pages/home_page.dart';
import '../screens/home/pages/home_screen.dart';
import '../screens/splashscreen/splash_screen.dart';

class RouteHelper {
  static const String splash = '/splash';
  static const String initial = '/initial';
  static const String homePage = '/homePage';
  static const String Categories = '/Categories';
  static const String ProductsPage = '/ProductsScreen';
  static const String PopularVendor = '/PopularVendor';
  static const String Profile = '/ProfilePage';
  static const String SignIn = '/SignInPage';
  static const String ProductsDetail='/ProductsDetailsPage';
  static const String Favorite='/FavoritePage';
  static const String Cart='/CartPage';




  static final Map<String, WidgetBuilder> namedRoutes = {
    splash: (context) => SplashScreen(),
    initial: (context) => HomeScreen(),
    homePage: (context) => HomePage(),
    Categories: (context) => CategoriesPage(),
    ProductsPage: (context) => ProductsScreen(),
    PopularVendor: (context) => PopularVendorCategories(),
    Profile: (context) => ProfilePage(),
    SignIn: (context) => SignInPage(),
    ProductsDetail:(context)=> ProductsDetailsPage(rating: 4,),
    Favorite: (context) => FavoritePage(),
    Cart: (context) => CartPage(),


  };

  static final List<GetPage> getPages = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: initial,
      page: () {
        print("GetPage name:home");
        return HomeScreen();
      },
    ),
    GetPage(
      name: Categories,
      page: () => CategoriesPage(),
    ),
    GetPage(
      name: ProductsPage,
      page: () => ProductsScreen(), // Updated this line
    ),
    GetPage(
      name: PopularVendor,
      page: () => PopularVendorCategories(), // Updated this line
    ),
    GetPage(
      name: Profile,
      page: () => ProfilePage(), // Updated this line
    ),
    GetPage(
      name: SignIn,
      page: () => SignInPage(), // Updated this line
    ),
    GetPage(
      name: Favorite,
      page: () => FavoritePage(), // Updated this line
    ),
    GetPage(
      name: ProductsDetail,
      page: () => ProductsDetailsPage(rating: 4,), // Updated this line
    ),
    GetPage(
      name: Cart,
      page: () => CartPage(), // Updated this line
    ),


  ];
}
