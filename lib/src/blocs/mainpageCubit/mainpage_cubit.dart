import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lamanda_petshopcr/src/pages/Home/home_page.dart';
import 'package:lamanda_petshopcr/src/pages/Profile/profile_page.dart';
import 'package:lamanda_petshopcr/src/pages/Quotes/quotes_page.dart';
import 'package:lamanda_petshopcr/src/pages/Search/search_page.dart';
part 'mainpage_state.dart';

class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit() : super(MainPageState.initialIndex(bodyPage: HomePage()));

  void indexChange(int index) {
    emit(MainPageState.indexChange(
        currenIndex: index, bodyPage: getBodyPage(index)));
  }

  Widget getBodyPage(int index) {
    switch (index) {
      case 0:
        return HomePage();
        break;
      case 1:
        return SearchPage();
        break;
      case 2:
        return QuotesPage();
        break;
      default:
        return ProfilePage();
        break;
    }
  }
}
