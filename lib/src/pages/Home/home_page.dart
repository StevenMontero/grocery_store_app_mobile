import 'package:authentication_repository/src/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lamanda_petshopcr/src/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:lamanda_petshopcr/src/widgets/BottomNavBar/bottom_navbar.dart';
import 'package:lamanda_petshopcr/src/widgets/BottomNavBar/cubit/navbar_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = BlocProvider.of<AuthenticationBloc>(context).state.user;
    print(user.photo);
    return BlocProvider(
      create: (context) => NavbarCubit(),
      child: Body(user: user),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key key,
    @required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => context
                .bloc<AuthenticationBloc>()
                .add(AuthenticationLogoutRequested()),
          )
        ],
      ),
      bottomNavigationBar: BlocProvider.value(
        value: context.bloc<NavbarCubit>(),
        child: BottomNavBar(
          onTap: (index) => context.bloc<NavbarCubit>().indexChange(index),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //     onPressed: () => context.bloc<NavbarCubit>().indexChange(2)),
      body: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Avatar(photo: user.photo),
            const SizedBox(height: 4.0),
            Text(user.email),
            const SizedBox(height: 4.0),
            Text(user.name ?? ''),
          ],
        ),
      ),
    );
  }
}

const _avatarSize = 48.0;

class Avatar extends StatelessWidget {
  const Avatar({Key key, this.photo}) : super(key: key);

  final String photo;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: _avatarSize,
      backgroundImage: photo != null ? NetworkImage(photo) : null,
      child: photo == null
          ? const Icon(Icons.person_outline, size: _avatarSize)
          : null,
    );
  }
}
