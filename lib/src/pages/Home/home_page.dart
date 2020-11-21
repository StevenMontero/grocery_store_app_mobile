import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lamanda_petshopcr/src/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:lamanda_petshopcr/src/library/language_library/easy_localization.dart';
import 'package:lamanda_petshopcr/src/models/product.dart';
import 'package:lamanda_petshopcr/src/pages/Search/search_delegate.dart';
import 'package:lamanda_petshopcr/src/theme/colors.dart';
import 'package:lamanda_petshopcr/src/widgets/Category/category.dart';
import 'package:lamanda_petshopcr/src/widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  searchBar(context),
                  buildMenuCategory(context),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 20.0, right: 20.0),
                      child: Text(
                        AppLocalizations.of(context).tr('recomended'),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  getGridProducs(context),
                ],
              ),
            ),
          ),
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
        padding: EdgeInsets.only(top: 0, left: 8, right: 8),
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
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getGridProducs(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 1.0,
      childAspectRatio: 0.650,
      crossAxisCount: 2,
      primary: false,
      children: [
        ProductCard(
          item: new Product(
              'Alimento',
              'Hola',
              1000000,
              'https://www.alimentoraza.com/wp-content/uploads/2019/12/Perrosadultos-PolloCarneCerealesyArroz.jpg',
              'codeProduct1', []),
          onTab: () => Navigator.of(context).pushNamed('detail'),
        ),
        ProductCard(
            item: new Product(
                'Alimento',
                'Hola',
                100,
                'https://www.alimentoraza.com/wp-content/uploads/2019/12/Perrosadultos-PolloCarneCerealesyArroz.jpg',
                'codeProduct2', [])),
        ProductCard(
            item: new Product(
                'Alimento',
                'Hola',
                100,
                'https://www.alimentoraza.com/wp-content/uploads/2019/12/Perrosadultos-PolloCarneCerealesyArroz.jpg',
                'codeProduct3', [])),
        ProductCard(
            item: new Product(
                'Alimento',
                'Hola',
                100,
                'https://www.alimentoraza.com/wp-content/uploads/2019/12/Perrosadultos-PolloCarneCerealesyArroz.jpg',
                'codeProduct4', [])),
        ProductCard(
            item: new Product(
                'Alimento',
                'Hola',
                100,
                'https://www.alimentoraza.com/wp-content/uploads/2019/12/Perrosadultos-PolloCarneCerealesyArroz.jpg',
                'codeProduct5', [])),
        ProductCard(
            item: new Product(
                'Alimento',
                'Hola',
                100,
                'https://www.alimentoraza.com/wp-content/uploads/2019/12/Perrosadultos-PolloCarneCerealesyArroz.jpg',
                'codeProduct6', []))
      ],
    );
  }

  Widget searchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: MaterialButton(
        elevation: 0.5,
        color: Color(0xFFF5F5F7),
        onPressed: () {
          showSearch(context: context, delegate: DataSearch());
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
