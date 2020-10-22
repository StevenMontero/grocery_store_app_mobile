import 'package:flutter/material.dart';
import 'package:lamanda_petshopcr/src/models/product.dart';
import 'package:lamanda_petshopcr/src/theme/colors.dart';
import 'package:lamanda_petshopcr/src/widgets/custom_button.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(product: product),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(
                  product: product,
                ),
                TopRoundedContainer(
                    color: Colors.white, child: quantityChange()),
                TopRoundedContainer(
                  color: Color(0xFFF6F7F9),
                  child: Column(
                    children: [
                      TopRoundedContainer(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 50,
                            right: 50,
                            bottom: 40,
                            top: 10,
                          ),
                          child: CustomButton(
                            text: "Add To Cart",
                            press: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget quantityChange() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        /// Decrease of value item
        Container(
          height: 50.0,
          width: 50.0,
          child: RaisedButton(
              color: ColorsApp.primaryColorBlue,
              onPressed: () {},
              child: Text(
                "+",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Text('1'),
        ),

        /// Increasing value of item
        Container(
          height: 50.0,
          width: 50.0,
          child: RaisedButton(
              color: ColorsApp.primaryColorBlue,
              onPressed: () {},
              child: Text(
                "-",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              )),
        ),
      ],
    );
  }
}
