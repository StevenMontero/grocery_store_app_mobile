import 'package:flutter/material.dart';
//import 'package:lamanda_petshopcr/src/models/product.dart';

class DataSearch extends SearchDelegate {
  //final peliculas = ['Hola', 'Adios'];
  final peliculasRecientes = ['Spiderman', 'Capitan America'];

  @override
  List<Widget> buildActions(BuildContext context) {
    // las acciones de nuestro appbar
    return [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // lo que aparece a la izquierda del app bar un icono por ejemplo
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    // crea los resultados que vamos a mostrar
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Muestra las sujerencias a como vamos escribiendo
    if (query.isEmpty) {
      return Container();
    }
    return Container();
    // return FutureBuilder(
    //   future: peliculasProvider.buscarPeliculas(query),
    //   builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
    //     if (snapshot.hasData) {
    //       final peliculas = snapshot.data;
    //       return ListView(
    //           children: peliculas.map((pelicula) {
    //         return ListTile(
    //           leading: FadeInImage(
    //               placeholder: AssetImage('assets/img/no-image.jpg'),
    //               image: NetworkImage(pelicula.getPosterImage()),
    //               fit: BoxFit.cover),
    //           title: Text(pelicula.name),
    //           subtitle: Text('${pelicula.price}'),
    //           onTap: () {
    //             close(context, null);
    //             Navigator.pushNamed(context, '/detalle', arguments: pelicula);
    //           },
    //         );
    //       }).toList());
    //     } else {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //   },
    // );
  }
}
