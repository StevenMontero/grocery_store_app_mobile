import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:proyecto_sistemas/library/language_library/easy_localization.dart';
import 'package:proyecto_sistemas/pages/LoginAndSignUp/Signup/signup_page.dart';

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
                                      top: mediaQueryData.padding.top + 40.0)),
                              Center(
                                /// Animation text treva shop accept from splashscreen layout (Click to open code)
                                child: Hero(
                                  tag: "Treva",
                                  child: Container(
                                    height: mediaQueryData.size.height * 0.2,
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
                              ButtonCustomFacebook(),

                              /// ButtonCustomGoogle
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 7.0)),
                              ButtonCustomGoogle(),

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
                              TextFromField(
                                icon: Icons.email,
                                password: false,
                                email: AppLocalizations.of(context).tr('email'),
                                inputType: TextInputType.emailAddress,
                              ),

                              /// TextFromField Password
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.0)),
                              TextFromField(
                                icon: Icons.vpn_key,
                                password: true,
                                email:
                                    AppLocalizations.of(context).tr('password'),
                                inputType: TextInputType.text,
                              ),

                              /// Button Signup
                              FlatButton(
                                  padding: EdgeInsets.only(top: 20.0),
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                new Signup()));
                                  },
                                  child: Text(
                                    AppLocalizations.of(context).tr('notHave'),
                                    style: TextStyle(
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
                    MaterialButton(
                      onPressed: () {
                        print('valiadar');
                      },
                      minWidth: mediaQueryData.size.width * 0.85,
                      height: mediaQueryData.size.height * 0.065,
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
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// textfromfield custom class
class TextFromField extends StatelessWidget {
  final bool password;
  final String email;
  final IconData icon;
  final TextInputType inputType;

  TextFromField({this.email, this.icon, this.inputType, this.password});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        height: 60.0,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 10.0, color: Colors.black12)]),
        padding:
            EdgeInsets.only(left: 20.0, right: 30.0, top: 0.0, bottom: 0.0),
        child: Theme(
          data: ThemeData(
            hintColor: Colors.transparent,
          ),
          child: TextFormField(
            obscureText: password,
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: email,
                icon: Icon(
                  icon,
                  color: Colors.black38,
                ),
                labelStyle: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Sans',
                    letterSpacing: 0.3,
                    color: Colors.black38,
                    fontWeight: FontWeight.w600)),
            keyboardType: inputType,
          ),
        ),
      ),
    );
  }
}

///buttonCustomFacebook class
class ButtonCustomFacebook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        alignment: FractionalOffset.center,
        height: 49.0,
        width: 500.0,
        decoration: BoxDecoration(
          color: Color.fromRGBO(107, 112, 248, 1.0),
          borderRadius: BorderRadius.circular(40.0),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 15.0)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/icon_facebook.png",
              height: 25.0,
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 7.0)),
            Text(
              AppLocalizations.of(context).tr('loginFacebook'),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Sans'),
            ),
          ],
        ),
      ),
    );
  }
}

///buttonCustomGoogle class
class ButtonCustomGoogle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        alignment: FractionalOffset.center,
        height: 49.0,
        width: 500.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10.0)],
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/google.png",
              height: 25.0,
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 7.0)),
            Text(
              AppLocalizations.of(context).tr('loginGoogle'),
              style: TextStyle(
                  color: Colors.black26,
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
