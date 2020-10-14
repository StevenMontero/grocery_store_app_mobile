import 'package:flutter/material.dart';
import 'package:lamanda_petshopcr/src/library/language_library/easy_localization.dart';
import 'package:lamanda_petshopcr/src/widgets/Category/category_item.dart';

class CategoryRowMenue extends StatelessWidget {
  final List<ItemCategory> items;

  CategoryRowMenue({@required this.items});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        items[0],
        items[1],
        items[2],
        items[3],
      ],
    );
  }
}
