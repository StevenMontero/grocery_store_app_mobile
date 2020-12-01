import 'package:flutter/material.dart';
import 'package:lamanda_petshopcr/src/models/product.dart';
import 'package:lamanda_petshopcr/src/widgets/custom_app_bar.dart';
import 'components/body.dart';

class DetailsProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(
        leadingIcon: Icons.arrow_back_ios,
      ),
      body: Body(
          product: Product(
              'Alimento',
              'El rico sabor de los cereales complementa la dieta a base de carne de tu perro, proporcionándole todos los beneficios que necesita gracias a su complejo vitamínico mineral con Omega 3 y 6. Es el alimento balanceado para perros que ayuda a tu mascota a tener huesos sanos y fuertes, excelente visión, pelaje brillante y mayor vitalidad.',
              1000000,
              'https://www.alimentoraza.com/wp-content/uploads/2019/12/Perrosadultos-PolloCarneCerealesyArroz.jpg',
              'codeProduct1',
              12,
              'Caninos')),
    );
  }
}
