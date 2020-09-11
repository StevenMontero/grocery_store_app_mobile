import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:lamanda_petshopcr/blocs/signupCubit/sign_up_cubit.dart';
import 'package:lamanda_petshopcr/library/language_library/easy_localization.dart';
import 'package:lamanda_petshopcr/pages/LoginAndSignUp/Login/login_page.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> with TickerProviderStateMixin {
  //Animation Declaration

  AnimationController animationControllerScreen;
  Animation animationScreen;

  /// Component Widget layout UI
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    // ignore: unnecessary_statements
    mediaQueryData.devicePixelRatio;
    mediaQueryData.size.height;
    mediaQueryData.size.width;

    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: BlocProvider<SignUpCubit>(
        create: (context) =>
            SignUpCubit(context.repository<AuthenticationRepository>()),
        child: Scaffold(
          body: BlocListener<SignUpCubit, SignUpState>(
            listener: (context, state) {
              if (state.status.isSubmissionFailure) {
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(content: Text('Sign Up Failure')),
                  );
              }
            },
            child: BodyWidget(mediaQueryData: mediaQueryData),
          ),
        ),
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    Key key,
    @required this.mediaQueryData,
  }) : super(key: key);

  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          /// Set Background image in layout
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/dog.jpg"),
            fit: BoxFit.cover,
          )),
          child: Container(
            /// Set gradient color in image
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(0, 0, 0, 0.2),
                  Color.fromRGBO(0, 0, 0, 0.3)
                ],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
              ),
            ),

            /// Set component layout
            child: ListView(
              padding: EdgeInsets.all(0.0),
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
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 20.0)),
                              //TODO: Preguntar que datos se ocupan de los clientes para ver si se ocupan validar
                              //Estan comentados para saber si se ocupan o no validar
                              // TextFromField(
                              //   icon: Icons.account_circle,
                              //   password: false,
                              //   lavel: AppLocalizations.of(context).tr('email'),
                              //   inputType: TextInputType.text,
                              // ),
                              // Padding(
                              //     padding: EdgeInsets.symmetric(vertical: 5.0)),
                              // TextFromField(
                              //   icon: Icons.phone_iphone,
                              //   password: false,
                              //   lavel: AppLocalizations.of(context).tr('email'),
                              //   inputType: TextInputType.number,
                              // ),
                              // Padding(
                              //     padding: EdgeInsets.symmetric(vertical: 5.0)),

                              /// TextFromField Email
                              BlocBuilder<SignUpCubit, SignUpState>(
                                buildWhen: (previous, current) =>
                                    previous.email != current.email,
                                builder: (context, state) {
                                  return TextFromField(
                                    state: state,
                                    icon: Icons.email,
                                    password: false,
                                    lavel: AppLocalizations.of(context)
                                        .tr('email'),
                                    inputType: TextInputType.emailAddress,
                                  );
                                },
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.0)),

                              /// TextFromField Password
                              BlocBuilder<SignUpCubit, SignUpState>(
                                buildWhen: (previous, current) =>
                                    previous.password != current.password,
                                builder: (context, state) {
                                  return TextFromField(
                                    state: state,
                                    icon: Icons.vpn_key,
                                    password: true,
                                    lavel: AppLocalizations.of(context)
                                        .tr('password'),
                                    inputType: TextInputType.text,
                                  );
                                },
                              ),

                              /// Button Login
                              FlatButton(
                                  padding: EdgeInsets.only(top: 20.0),
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                new LoginScreen()));
                                  },
                                  child: Text(
                                    AppLocalizations.of(context)
                                        .tr('notHaveLogin'),
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.white,
                                        fontSize: 15.0,
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
                        //TODO: Validar el usuario con firebase
                        print('valiadar');
                      },
                      minWidth: mediaQueryData.size.width * 0.85,
                      height: mediaQueryData.size.height * 0.065,
                      color: Color(0xFF825BC6),
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Text(
                        AppLocalizations.of(context).tr('signUp'),
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 0.2,
                            fontFamily: "Sans",
                            fontSize: 18.0,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// textfromfield custom class
class TextFromField extends StatelessWidget {
  final bool password;
  final String lavel;
  final IconData icon;
  final TextInputType inputType;
  final SignUpState state;

  TextFromField(
      {this.lavel, this.icon, this.inputType, this.password, this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        height: 75.0,
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
          child: TextField(
            onChanged: !password
                ? (value) => context.bloc<SignUpCubit>().emailChanged(value)
                : (value) => context.bloc<SignUpCubit>().passwordChanged(value),
            obscureText: password,
            decoration: InputDecoration(
                //TODO: agregar el mensaje de error al indioma y al SingSate
                errorText: state.email.invalid ? 'Email no valido' : null,
                labelText: lavel,
                icon: Icon(
                  icon,
                  color: Colors.black38,
                ),
                labelStyle: TextStyle(
                    fontSize: 13.0,
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
