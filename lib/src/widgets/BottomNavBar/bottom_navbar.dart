import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lamanda_petshopcr/src/theme/colors.dart';
import 'package:lamanda_petshopcr/src/widgets/BottomNavBar/cubit/navbar_cubit.dart';

class BottomNavBar extends StatefulWidget {
  final Function(int index) onTap;
  BottomNavBar({Key key, this.onTap}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.0,
      child: BlocBuilder<NavbarCubit, NavbarState>(
        buildWhen: (previous, current) =>
            current.currenIndex != previous.currenIndex,
        builder: (context, state) {
          return BottomNavigationBar(
            items: items,
            selectedItemColor: ColorsApp.primaryColorBlue,
            unselectedItemColor: ColorsApp.secondaryColorlightBlue,
            type: BottomNavigationBarType.fixed,
            onTap: widget.onTap,
            currentIndex: state.currenIndex,
          );
        },
      ),
    );
  }

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
        icon: Icon(
          FontAwesomeIcons.store,
          size: 27,
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            "Tienda",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        )),
    BottomNavigationBarItem(
        icon: Icon(
          FontAwesomeIcons.search,
          size: 27,
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            "Buscar",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        )),
    BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.solidCalendarPlus, size: 27),
        title: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            "Citas",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        )),
    BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.shoppingCart, size: 27),
        title: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            "Carrito",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        )),
    BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.solidUser, size: 27),
        title: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            "Perfil",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ))
  ];
}
