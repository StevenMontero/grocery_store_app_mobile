import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lamanda_petshopcr/src/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:lamanda_petshopcr/src/blocs/profileCubit/profile_cubit.dart';
import 'package:lamanda_petshopcr/src/models/userProfile.dart';
import 'package:lamanda_petshopcr/src/repository/user_repository.dart';
import 'package:lamanda_petshopcr/src/theme/colors.dart';

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
    return BlocProvider(
        create: (context) => ProfileCubit(UserRepository()),
        child: Scaffold(
            appBar: buildAppbar(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                  ),
                  Positioned(
                    top: 15,
                    child: Center(
                      child: CircleAvatar(
                        radius: 55,
                        backgroundImage: user.photo != null
                            ? NetworkImage(user.photo)
                            : null,
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
                      buildOptionPerfil(user),
                    ],
                  )
                ],
              ),
            )));
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
              Navigator.of(context).pop();
            },
          );
        },
      ),
      title: Center(
          child: Text('Perfil',
              style: new TextStyle(fontSize: 20, color: Colors.black))),
      actions: <Widget>[
        BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
          return IconButton(
            icon: new Icon(Icons.save,
                color: ColorsApp.secondaryColorlightPurple),
            onPressed: () {
              final user =
                  BlocProvider.of<AuthenticationBloc>(context).state.user;
              context.bloc<ProfileCubit>().editUserForm(user.id, user.photo);
              Navigator.of(context).pop();
            },
          );
        })
      ],
    );
  }

  Widget buildOptionPerfil(user) {
    UserProfile userProfile;
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      context.bloc<ProfileCubit>().getUser(user.id);
      return StreamBuilder(
          stream: context.bloc<ProfileCubit>().getUserStream,
          builder: (context, AsyncSnapshot<UserProfile> snapshot) {
            if (snapshot.hasData) {
              userProfile = snapshot.data;
            }
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
                      child: BlocBuilder<ProfileCubit, ProfileState>(
                        buildWhen: (previous, current) =>
                            previous.userName != current.userName,
                        builder: (context, state) {
                          return TextFormField(
                            initialValue: userProfile.userName,
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: 'Nombre'),
                            onChanged: (value) => context
                                .bloc<ProfileCubit>()
                                .userNameChanged(value),
                          );
                        },
                      ),
                    )
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
                      child: BlocBuilder<ProfileCubit, ProfileState>(
                        buildWhen: (previous, current) =>
                            previous.lastName != current.lastName,
                        builder: (context, state) {
                          return TextFormField(
                            initialValue: userProfile.lastName,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Apellidos'),
                            onChanged: (value) => context
                                .bloc<ProfileCubit>()
                                .lastNameChanged(value),
                          );
                        },
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
                      child: BlocBuilder<ProfileCubit, ProfileState>(
                        buildWhen: (previous, current) =>
                            previous.email != current.email,
                        builder: (context, state) {
                          return TextFormField(
                            initialValue: userProfile.email,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Correo Electrónico'),
                            onChanged: (value) => context
                                .bloc<ProfileCubit>()
                                .emailChanged(value),
                          );
                        },
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
                      child: BlocBuilder<ProfileCubit, ProfileState>(
                        buildWhen: (previous, current) =>
                            previous.phone != current.phone,
                        builder: (context, state) {
                          return TextFormField(
                            initialValue: userProfile.phone,
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: 'Teléfono'),
                            onChanged: (value) => context
                                .bloc<ProfileCubit>()
                                .phoneChanged(value),
                          );
                        },
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
                      child: BlocBuilder<ProfileCubit, ProfileState>(
                        buildWhen: (previous, current) =>
                            previous.addres != current.addres,
                        builder: (context, state) {
                          return TextFormField(
                            initialValue: userProfile.address,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Dirección de domicilio'),
                            onChanged: (value) => context
                                .bloc<ProfileCubit>()
                                .addresChanged(value),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ]);
          });
    });
  }
}
