import 'package:flutter/material.dart';
import 'package:lamanda_petshopcr/src/theme/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key key, this.text, this.press, this.color})
      : super(key: key);
  final String text;
  final Function press;
  final ColorsApp color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: ColorsApp.primaryColorBlue,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
