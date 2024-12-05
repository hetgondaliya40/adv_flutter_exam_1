import 'package:flutter/material.dart';

import '../view/screen/detail_page/detail_page.dart';
import '../view/screen/favorite_page/favorite_page.dart';
import '../view/screen/home_page/home_page.dart';
import '../view/screen/splash_screen/Splash_screen.dart';

class Routes {
  static String splashScreen = "/";
  static String homePage = "home_page";
  static String detailPage = "detail_page";
  static String favoritePage = "favorite_page";

  static Map<String, WidgetBuilder> myRoutes = {
    splashScreen: (context) => const SplashScreen(),
    homePage: (context) => const HomePage(),
    detailPage: (context) => const DetailPage(),
    favoritePage: (context) => const FavoritePage(),
  };
}
