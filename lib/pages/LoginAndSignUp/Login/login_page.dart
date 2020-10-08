import 'package:flutter/material.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lamanda_petshopcr/blocs/loginCubit/login_cubit.dart';

import 'package:lamanda_petshopcr/library/language_library/easy_localization.dart';
import 'package:lamanda_petshopcr/pages/LoginAndSignUp/Signup/signup_page.dart';
import 'package:lamanda_petshopcr/widgets/textfield.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

/// Component Widget this layout UI
class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    // ignore: unnecessary_statements
    mediaQueryData.devicePixelRatio;
    mediaQueryData.size.width;
    mediaQueryData.size.height;

    var data = EasyLocalizationProvider.of(context).data;

    return EasyLocalizationProvider(
        data: data,
        child: BlocProvider(
          create: (context) =>
              LoginCubit(context.repository<AuthenticationRepository>()),
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              /// Set Background image in layout (Click to open code)
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/dog.jpg"),
                fit: BoxFit.cover,
              )),
              child: Container(
                /// Set gradient color in image (Click to open code)
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(0, 0, 0, 0.0),
                      Color.fromRGBO(0, 0, 0, 0.3)
                    ],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                  ),
                ),

                /// Set component layout
                child: ListView(
                  children: <Widget>[
                    Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              alignment: AlignmentDirectional.topCenter,
                              child: Column(
                                children: <Widget>[
                                  /// padding logo
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top:
                                              mediaQueryData.padding.top + 10)),
                                  Center(
                                    /// Animation text treva shop accept from splashscreen layout (Click to open code)
                                    child: Hero(
                                      tag: "Treva",
                                      child: Container(
                                        height:
                                            mediaQueryData.size.height * 0.2,
                                        width: mediaQueryData.size.width * 0.45,
                                        child: SvgPicture.asset(
                                          'assets/images/Logo_COLOR.svg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),

                                  /// ButtonCustomFacebook
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 30.0)),
                                  ButtonCustomSocialLogin(
                                    colorBackground:
                                        Color.fromRGBO(107, 112, 248, 1.0),
                                    textColor: Colors.white,
                                    text: 'loginGoogle',
                                    icon: 'assets/images/icon_facebook.png',
                                  ),

                                  /// ButtonCustomGoogle
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 7.0)),
                                  ButtonCustomSocialLogin(
                                    colorBackground: Colors.white,
                                    textColor: Colors.black26,
                                    text: 'loginGoogle',
                                    icon: 'assets/images/google.png',
                                  ),

                                  /// Set Text
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.0)),
                                  Text(
                                    AppLocalizations.of(context).tr('or'),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white,
                                        letterSpacing: 0.2,
                                        fontFamily: 'Sans',
                                        fontSize: 17.0),
                                  ),

                                  /// TextFromField Email
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.0)),
                                  BlocBuilder<LoginCubit, LoginState>(
                                    buildWhen: (previous, current) =>
                                        previous.email != current.email,
                                    builder: (context, state) {
                                      return TextFromField(
                                        erroMessage: 'Email no es valido',
                                        errorOccurred: state.email.invalid,
                                        onChanged: (value) => context
                                            .bloc<LoginCubit>()
                                            .emailChanged(value),
                                        icon: Icons.email,
                                        password: false,
                                        lavel: AppLocalizations.of(context)
                                            .tr('email'),
                                        inputType: TextInputType.emailAddress,
                                      );
                                    },
                                  ),

                                  /// TextFromField Password
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0)),
                                  TextFromField(
                                    icon: Icons.vpn_key,
                                    password: true,
                                    lavel: AppLocalizations.of(context)
                                        .tr('password'),
                                    inputType: TextInputType.text,
                                  ),

                                  /// Button Signup
                                  FlatButton(
                                      padding: EdgeInsets.only(top: 20.0),
                                      onPressed: () {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        new Signup()));
                                      },
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .tr('notHave'),
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Colors.white,
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Sans"),
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: mediaQueryData.padding.top + 40.0,
                                        bottom: 0.0),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 10),
                          child: MaterialButton(
                            onPressed: () {
                              print('valiadar');
                            },
                            height: 49.0,
                            minWidth: 500.0,
                            color: Color(0xFF825BC6),
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Text(
                              AppLocalizations.of(context).tr('login'),
                              style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 0.2,
                                  fontFamily: "Sans",
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class ButtonCustomSocialLogin extends StatelessWidget {
  final Color colorBackground;
  final Color textColor;
  final String text;
  final String icon;

  const ButtonCustomSocialLogin(
      {Key key, this.colorBackground, this.textColor, this.text, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: MaterialButton(
        onPressed: () {
          print('valiadar');
        },
        height: 49.0,
        minWidth: 500.0,
        color: colorBackground,
        elevation: 1.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              icon, //"assets/images/google.png",
              height: 25.0,
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 7.0)),
            Text(
              AppLocalizations.of(context).tr(text), //loginGoogle
              style: TextStyle(
                  color: textColor, //Colors.black26,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Sans'),
            )
          ],
        ),
      ),
    );
  }
}
