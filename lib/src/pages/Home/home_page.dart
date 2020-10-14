import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lamanda_petshopcr/src/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:lamanda_petshopcr/src/library/language_library/easy_localization.dart';
import 'package:lamanda_petshopcr/src/theme/colors.dart';
import 'package:lamanda_petshopcr/src/widgets/BottomNavBar/bottom_navbar.dart';
import 'package:lamanda_petshopcr/src/widgets/BottomNavBar/cubit/navbar_cubit.dart';
import 'package:lamanda_petshopcr/src/widgets/Category/category.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavbarCubit(),
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
      bottomNavigationBar: BlocProvider.value(
        value: context.bloc<NavbarCubit>(),
        child: BottomNavBar(
          onTap: (index) => context.bloc<NavbarCubit>().indexChange(index),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //     onPressed: () => context.bloc<NavbarCubit>().indexChange(2)),
      body: Column(
        children: [
          SafeArea(child: buildAppBar(context, user.photo)),
          searchBar(),
          buildMenuCategory(context)
        ],
      ),
    );
  }

  Container buildMenuCategory(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: AlignmentDirectional.centerStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 0.0, right: 20.0),
            child: Text(
              AppLocalizations.of(context).tr('menu'),
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: ColorsApp.textPrimaryColor),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          CategoryRowMenue(items: <ItemCategory>[
            ItemCategory(
              image: 'assets/icons/004-petshampoo.svg',
              title: 'Estetica',
              onTap: () {},
            ),
            ItemCategory(
              image: 'assets/icons/025-medicine.svg',
              title: 'Medicinas',
              onTap: () {},
            ),
            ItemCategory(
              image: 'assets/icons/020-knot.svg',
              title: 'Accesorios',
              onTap: () {},
            ),
            ItemCategory(
              image: 'assets/icons/016-petfood.svg',
              title: 'Comida',
              onTap: () {},
            ),
          ]),
        ],
      ),
    );
  }

  Widget buildAppBar(BuildContext context, String photo) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 2),
              blurRadius: 8.0),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 20.0, left: 8, right: 8),
        child: Row(
          children: <Widget>[
            Container(
                alignment: Alignment.centerLeft,
                width: AppBar().preferredSize.height + 40,
                height: AppBar().preferredSize.height,
                child: SizedBox()),
            Expanded(
                child: Container(
              color: Colors.white,
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
              child: SvgPicture.asset(
                'assets/images/Logo_COLOR.svg',
                fit: BoxFit.scaleDown,
              ),
            )),
            Container(
              color: Colors.white,
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: photo != null ? NetworkImage(photo) : null,
                    child: photo == null
                        ? const Icon(Icons.person_outline, size: 20)
                        : null,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: MaterialButton(
        elevation: 0.5,
        color: Color(0xFFF5F5F7),
        onPressed: () {
          print('Hola');
        },
        minWidth: double.infinity,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: <Widget>[
            Icon(
              FontAwesomeIcons.search,
              size: 15.0,
            ),
            SizedBox(width: 16),
            Text(
              "Buscar por productos",
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFFA0A5BD),
              ),
            )
          ],
        ),
      ),
    );
  }
}
