import 'package:flutter/material.dart';
import 'package:lamanda_petshopcr/src/library/language_library/easy_localization.dart';
import 'package:lamanda_petshopcr/src/models/product.dart';
import 'package:lamanda_petshopcr/src/theme/colors.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            product.name,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                    child: Text(
                  '${product.price.toString()} CRC',
                  style: TextStyle(
                      fontSize: 14,
                      color: ColorsApp.primaryColorBlue,
                      fontWeight: FontWeight.w700),
                )),
              )),
              Container(
                padding: EdgeInsets.all(15),
                width: 64,
                decoration: BoxDecoration(
                  color: ColorsApp.primaryColorBlue, //Color(0xFFFFE6E6),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Icon(
                  Icons.pets,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Text(
            product.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: GestureDetector(
            onTap: () {
              _bottomSheet(context);
            },
            child: Row(
              children: [
                Text(
                  "See More Detail",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: ColorsApp.primaryColorBlue),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: ColorsApp.primaryColorBlue,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  void _bottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return SingleChildScrollView(
            child: Container(
              color: Colors.black26,
              child: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Container(
                  height: 1500.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0))),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 20.0)),
                      Center(
                          child: Text(
                        AppLocalizations.of(context).tr('description'),
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Gotik",
                            fontSize: 16.0),
                      )),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 20.0, right: 20.0, bottom: 20.0),
                        child: Text(
                            AppLocalizations.of(context).tr('longLorem'),
                            style: TextStyle(
                                fontFamily: "Gotik",
                                color: Colors.black54,
                                letterSpacing: 0.3,
                                wordSpacing: 0.5)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          AppLocalizations.of(context).tr('spesifications'),
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15.0,
                              color: Colors.black,
                              letterSpacing: 0.3,
                              wordSpacing: 0.5),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                        child: Text(
                          AppLocalizations.of(context).tr('loremIpsum'),
                          style: TextStyle(
                              color: Colors.black54,
                              letterSpacing: 0.3,
                              wordSpacing: 0.5),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
