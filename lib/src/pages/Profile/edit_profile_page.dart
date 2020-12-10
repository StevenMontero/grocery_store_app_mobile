import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lamanda_petshopcr/src/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:lamanda_petshopcr/src/theme/colors.dart';
import 'package:meta/meta.dart';

class EditProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EditProfilePage();
  }
}

class _EditProfilePage extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = BlocProvider.of<AuthenticationBloc>(context).state.user;
    return Scaffold(
        appBar: buildAppbar(),
        body: SingleChildScrollView(
          child: Column(
            //con Stack
            //alignment: Alignment.center,
            children: [
              Container(
                color: Colors.white,
              ),
              Positioned(
                top: 15,
                child: Center(
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage:
                        user.photo != null ? NetworkImage(user.photo) : null,
                    child: user.photo == null
                        ? const Icon(Icons.person_outline, size: 20)
                        : null,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text("Datos personales",
                        style: new TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: ColorsApp.secondaryColorlightPurple)),
                  ),
                  buildOptionPerfil(),
                ],
              )
            ],
          ),
        ));
  }

  Widget buildAppbar() {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.reply,
              color: ColorsApp.secondaryColorlightPurple,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('profile');
            },
          );
        },
      ),
      title: Center(
          child: Text('Perfil',
              style: new TextStyle(fontSize: 20, color: Colors.black))),
      actions: <Widget>[
        IconButton(
          icon:
              new Icon(Icons.save, color: ColorsApp.secondaryColorlightPurple),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget buildOptionPerfil() {
    bool _rest = false;
    return Column(children: <Widget>[
      Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(
                width: 2, color: ColorsApp.secondaryColorlightPurple)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Nombre completo'),
              ),
            ),
          ],
        ),
      ),
      Text("Genero",style: new TextStyle(fontSize: 18)),
      Container(
        child: CheckboxListTile(
          title: Text("Hombre"),
          secondary: Icon(Icons.accessibility_new),
          controlAffinity: ListTileControlAffinity.platform,
          value: _rest,
          onChanged: (bool value) {
            setState(() {
              _rest = value;
            });
          },
        ),
      ),
      Container(
        child: CheckboxListTile(
          title: Text("Mujer"),
          secondary: Icon(Icons.accessibility_new),
          controlAffinity: ListTileControlAffinity.platform,
          value: _rest,
          onChanged: (bool value) {
            setState(() {
              _rest = value;
            });
          },
        ),
      ),
      Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(
                width: 2, color: ColorsApp.secondaryColorlightPurple)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Correo electronico'),
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(
                width: 2, color: ColorsApp.secondaryColorlightPurple)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Telefono'),
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(
                width: 2, color: ColorsApp.secondaryColorlightPurple)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Sobre mi'),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
