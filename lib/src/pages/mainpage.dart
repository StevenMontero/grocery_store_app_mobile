import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lamanda_petshopcr/src/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:lamanda_petshopcr/src/blocs/mainpageCubit/mainpage_cubit.dart';
import 'package:lamanda_petshopcr/src/widgets/BottomNavBar/bottom_navbar.dart';
import 'package:lamanda_petshopcr/src/widgets/custom_app_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainPageCubit(),
      child: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = BlocProvider.of<AuthenticationBloc>(context).state.user;
    return Scaffold(
      appBar: CustomAppBar(
        userPhoto: user.photo,
        withPhoto: true,
      ),
      bottomNavigationBar: BottomNavBar(
        onTap: (index) => context.bloc<MainPageCubit>().indexChange(index),
      ),

      // floatingActionButton: FloatingActionButton(
      //     onPressed: () => context.bloc<NavbarCubit>().indexChange(2)),
      body: BlocBuilder<MainPageCubit, MainPageState>(
        buildWhen: (previous, current) =>
            current.currenIndex != previous.currenIndex,
        builder: (context, state) {
          return state.bodyPage;
        },
      ),

      floatingActionButton: FlatButton(
                    onPressed: () => BlocProvider.of<AuthenticationBloc>(context)
                    .add(AuthenticationLogoutRequested()) , 
                    child: Container(
                      color: Colors.black,
                      child: Text('data'),
                    )),
    );
  }
}
