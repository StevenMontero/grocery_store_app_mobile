import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:proyecto_sistemas/library/language_library/easy_localization.dart';
import 'package:proyecto_sistemas/pages/LoginAndSignUp/choseLoginOrSignuo_page.dart';

void main() => runApp(EasyLocalization(child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    //Obliga  a la aplicacion a solo funcionar en portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    //set color status bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    return EasyLocalizationProvider(
      data: data,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'La Manada petShop',
        home: ChoseLogin(),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          EasylocaLizationDelegate(locale: data.locale, path: 'assets/language')
        ],
        supportedLocales: [Locale('en', 'US')],
        locale: data.savedLocale,
      ),
    );
  }
}
