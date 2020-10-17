import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemCategory extends StatelessWidget {
  final String title;
  final String image;
  final Function onTap;
  const ItemCategory({Key key, this.title, this.image, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      width: 90.0,
      child: RaisedButton(
        color: Colors.white,
        onPressed: onTap,
        elevation: 0.5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              image,
              height: 25,
            ),
            Padding(padding: EdgeInsets.only(top: 5.0)),
            Text(
              title,
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
