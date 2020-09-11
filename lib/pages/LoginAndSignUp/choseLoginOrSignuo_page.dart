//import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proyecto_sistemas/library/language_library/easy_localization_delegate.dart';
import 'package:proyecto_sistemas/library/language_library/easy_localization_provider.dart';
import 'package:proyecto_sistemas/pages/LoginAndSignUp/Login/login_page.dart';
import 'package:proyecto_sistemas/pages/LoginAndSignUp/Signup/signup_page.dart';

class ChoseLogin extends StatefulWidget {
  @override
  _ChoseLoginState createState() => _ChoseLoginState();
}

class _ChoseLoginState extends State<ChoseLogin> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    // ignore: unnecessary_statements
    mediaQuery.devicePixelRatio;
    mediaQuery.size.height;
    mediaQuery.size.width;

    var data = EasyLocalizationProvider.of(context).data;

    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            ///
            /// Set background image slider
            ///
            Container(
              height: double.infinity,
              width: mediaQuery.size.width,
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/dog.jpg',
                fit: BoxFit.cover,
                height: mediaQuery.size.height,
              ),
            ),
            Container(
              /// Set Background image in layout (Click to open code)
              decoration: BoxDecoration(
//              image: DecorationImage(
//                  image: AssetImage('assets/img/girl.png'), fit: BoxFit.cover)
                  ),
              child: Container(
                /// Set gradient color in image (Click to open code)
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                      Color.fromRGBO(0, 0, 0, 0.2),
                      Color.fromRGBO(0, 0, 0, 0.3)
                    ],
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter)),

                /// Set component layout
                child: ListView(
                  padding: EdgeInsets.all(0.0),
                  children: <Widget>[
                    Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: <Widget>[
                        Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: <Widget>[
                            Container(
                              alignment: AlignmentDirectional.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: mediaQuery.padding.top + 50.0),
                                  ),
                                  Center(
                                    /// Animation text treva shop accept from splashscreen layout (Click to open code)
                                    child: Hero(
                                      tag: "Treva",
                                      child: Container(
                                        height: mediaQuery.size.height * 0.2,
                                        width: mediaQuery.size.width * 0.45,
                                        child: SvgPicture.asset(
                                          'assets/images/Logo_COLOR.svg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),

                                  /// Padding Text "Get best product in treva shop" (Click to open code)
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 160.0,
                                          right: 160.0,
                                          top: mediaQuery.padding.top + 20.0,
                                          bottom: 10.0),
                                      child: Container(
                                        color: Colors.white,
                                        height: 0.5,
                                      )),

                                  /// to set Text "get best product...." (Click to open code)
                                  Text(
                                    AppLocalizations.of(context)
                                        .tr('hintChoseLogin'),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Sans",
                                        letterSpacing: 1.3),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 250.0)),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                /// To create animation if user tap == animation play (Click to open code)
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(30),
                                    splashColor: Colors.white10,
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          PageRouteBuilder(
                                              pageBuilder: (_, __, ___) =>
                                                  Signup()));
                                    },
                                    child: ButtonCustom(
                                        txt: AppLocalizations.of(context)
                                            .tr('signUp')),
                                  ),
                                ),

                                Padding(padding: EdgeInsets.only(top: 15.0)),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      /// To set white line (Click to open code)
                                      Container(
                                        color: Colors.white,
                                        height: 0.2,
                                        width: 80.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.0, right: 10.0),

                                        /// navigation to home screen if user click "OR SKIP" (Click to open code) si se desea saltar el login
                                        child: InkWell(
                                          onTap: () {
                                            // Navigator.of(context).pushReplacement(
                                            //     PageRouteBuilder(
                                            //         pageBuilder: (_, __, ___) =>
                                            //             new bottomNavigationBar()));
                                          },
                                          child: Text(
                                            AppLocalizations.of(context)
                                                .tr('orSkip'),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: "Sans",
                                                fontSize: 15.0),
                                          ),
                                        ),
                                      ),

                                      /// To set white line (Click to open code)
                                      Container(
                                        color: Colors.white,
                                        height: 0.2,
                                        width: 80.0,
                                      )
                                    ],
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(top: 70.0)),
                              ],
                            ),

                            /// To create animation if user tap == animation play (Click to open code)
                            Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(30),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(30),
                                splashColor: Colors.white10,
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                      PageRouteBuilder(
                                          pageBuilder: (_, __, ___) =>
                                              LoginScreen()));
                                },
                                child: ButtonCustom(
                                    txt: AppLocalizations.of(context)
                                        .tr('login')),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Button Custom widget
class ButtonCustom extends StatelessWidget {
  final String txt;
  final GestureTapCallback ontap;

  ButtonCustom({this.txt, this.ontap});

  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.white,
        child: LayoutBuilder(builder: (context, constraint) {
          return Container(
            width: 300.0,
            height: 52.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.transparent,
                border: Border.all(color: Colors.white)),
            child: Center(
                child: Text(
              txt,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Sans",
                  letterSpacing: 0.5),
            )),
          );
        }),
      ),
    );
  }
}
