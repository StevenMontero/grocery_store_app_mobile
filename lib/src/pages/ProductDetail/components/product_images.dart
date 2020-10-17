import 'package:flutter/material.dart';
import 'package:lamanda_petshopcr/src/models/product.dart';
import 'package:lamanda_petshopcr/src/theme/colors.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 300,
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.product.codeProduct,
              child: Image.network(
                widget.product.photoUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        // SizedBox(height: getProportionateScreenWidth(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(4, (index) => buildSmallProductPreview(index)),
          ],
        )
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: ColorsApp.primaryColorBlue
                  .withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image.network(
          widget.product.photoUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
