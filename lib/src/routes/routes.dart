import 'package:flutter/material.dart';
import 'package:lamanda_petshopcr/src/pages/Quotes/Hotel/hotel_page.dart';
import 'package:lamanda_petshopcr/src/pages/Quotes/Nursey/nursey_page.dart';
import 'package:lamanda_petshopcr/src/pages/Quotes/QuotesGrooming/grooming_page.dart';
import 'package:lamanda_petshopcr/src/pages/Quotes/Kindergarten/kindergarten_page.dart';
import 'package:lamanda_petshopcr/src/pages/mainpage.dart';
import 'package:lamanda_petshopcr/src/pages/LoginAndSignUp/Login/login_page.dart';
import 'package:lamanda_petshopcr/src/pages/LoginAndSignUp/Signup/signup_page.dart';
import 'package:lamanda_petshopcr/src/pages/LoginAndSignUp/choseLoginOrSignuo_page.dart';
import 'package:lamanda_petshopcr/src/pages/Profile/edit_profile_page.dart';
import 'package:lamanda_petshopcr/src/pages/Profile/profile_page.dart';
import 'package:lamanda_petshopcr/src/pages/ProductDetail/product_detail_page.dart';

Map<String, WidgetBuilder> getRoutesApp() {
  return <String, WidgetBuilder>{
    'choseLogOSig': (BuildContext context) => ChoseLogin(),
    'login': (BuildContext context) => LoginScreen(),
    'signup': (BuildContext context) => SignupScreen(),
    'profile':(BuildContext context) => ProfilePage(),
    'editProfile':(BuildContext context) => EditProfilePage(),
    'home': (BuildContext context) => MainScreen(),
    'detail': (BuildContext context) => DetailsProductScreen(),
    'grooming': (BuildContext context) => GroomingScreen(),
    'kinder': (BuildContext context) => KindergartenScreen(),
    'hotel': (BuildContext context) => HotelScreen(),
    'nursey': (BuildContext context) => NurseyScreen(),
  };
}
