import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lamanda_petshopcr/src/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:lamanda_petshopcr/src/theme/colors.dart';
import '../../theme/colors.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePage();
  }
}

class _ProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = BlocProvider.of<AuthenticationBloc>(context).state.user;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.white,
          ),
          Positioned(
            top: 0,
            child: Container(
              color: ColorsApp.secondaryColorlightPurple,
              width: 500,
              height: 100,
            ),
          ),
          // Container(
          Positioned(
            top: 30,
            child: Center(
              child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage:
                        user.photo != null ? NetworkImage(user.photo) : null,
                    child: user.photo == null
                        ? const Icon(Icons.person_outline, size: 20)
                        : null,
                  )),
            ),
          ),
          Positioned(
            top: 145,
            child: Column(
              children: <Widget>[
                botonPerfil(),
              ],
            ),
          ),
          Positioned(
            top: 235,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  botonsOptions(),
                ]),
          )
        ],
      ),
    );
  }

  Widget botonPerfil() {
    return Column(
      children: <Widget>[
        Center(
          child: Text("Nombre Apellido",
              style: new TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
        MaterialButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('editProfile');
          },
          child: Row(
            children: [
              Icon(FontAwesomeIcons.userEdit,
                  color: ColorsApp.secondaryColorlightPurple, size: 20),
              Text("   Editar Perfil",
                  style: new TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: ColorsApp.secondaryColorlightPurple)),
            ],
          ),
        ),
      ],
    );
  }

  Widget botonsOptions() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          MaterialButton(
              onPressed: () {},
              color: Colors.white,
              minWidth: 100,
              height: 60,
              child: Row(
                children: [
                  Image.asset(
                    "assets/icons/creditAcount.png",
                    width: 40,
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text("Metodos de pago"),
                  ),
                ],
              )),
          Divider(
            height: 0.5,
          ),
          MaterialButton(
              onPressed: () {},
              color: Colors.white,
              minWidth: 100,
              height: 60,
              child: Row(
                children: [
                  Image.asset(
                    "assets/icons/truck.png",
                    width: 40,
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text("Ordenes"),
                  ),
                ],
              )),
          Divider(
            height: 0.5,
          ),
          MaterialButton(
              onPressed: () {},
              color: Colors.white,
              minWidth: 100,
              height: 60,
              child: Row(
                children: [
                  Image.asset(
                    "assets/icons/setting.png",
                    width: 40,
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text("Configuraciones"),
                  ),
                ],
              )),
          Divider(
            height: 0.5,
          ),
          MaterialButton(
              onPressed: () {},
              color: Colors.white,
              minWidth: 100,
              height: 60,
              child: Row(
                children: [
                  Image.asset(
                    "assets/icons/aboutapp.png",
                    width: 40,
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text("Sobre nosotros"),
                  ),
                ],
              )),
          MaterialButton(
              onPressed: () => BlocProvider.of<AuthenticationBloc>(context)
                    .add(AuthenticationLogoutRequested()),
              color: Colors.white,
              minWidth: 100,
              height: 60,
              child: Row(
                children: [
                  Image.asset(
                    "assets/icons/logout.png",
                    width: 40,
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text("Cerrar Sesión"),
                  ),
                ],
              ))
        ]);
  }
}
