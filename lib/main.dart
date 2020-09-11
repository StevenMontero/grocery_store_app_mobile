import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:proyecto_sistemas/library/language_library/easy_localization.dart';
import 'package:proyecto_sistemas/pages/LoginAndSignUp/choseLoginOrSignuo_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(EasyLocalization(
      child: MyApp(
    authenticationRepository: AuthenticationRepository(),
  )));
}

class MyApp extends StatelessWidget {
  final AuthenticationRepository authenticationRepository;
  const MyApp({
    Key key,
    @required this.authenticationRepository,
  })  : assert(authenticationRepository != null),
        super(key: key);
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
      child: RepositoryProvider.value(
        value: authenticationRepository,
        //TODO: Implementar el Bloc de aunteticacion
        child: AppView(data: data),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    Key key,
    @required this.data,
  }) : super(key: key);

  final data;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
