import 'package:flutter/material.dart';
import 'package:lamanda_petshopcr/src/pages/mainpage.dart';
import 'package:lamanda_petshopcr/src/pages/LoginAndSignUp/Login/login_page.dart';
import 'package:lamanda_petshopcr/src/pages/LoginAndSignUp/Signup/signup_page.dart';
import 'package:lamanda_petshopcr/src/pages/LoginAndSignUp/choseLoginOrSignuo_page.dart';
import 'package:lamanda_petshopcr/src/pages/ProductDetail/product_detail_page.dart';

Map<String, WidgetBuilder> getRoutesApp() {
  return <String, WidgetBuilder>{
    'choseLogOSig': (BuildContext context) => ChoseLogin(),
    'login': (BuildContext context) => LoginScreen(),
    'signup': (BuildContext context) => SignupScreen(),
    'home': (BuildContext context) => MainScreen(),
    'detail': (BuildContext context) => DetailsProductScreen(),
  };
}
