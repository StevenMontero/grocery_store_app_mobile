import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lamanda_petshopcr/src/pages/Search/search_delegate.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          searchBar(context),
          Expanded(
            child: Center(
              child: Container(
                  height: 300,
                  width: 300,
                  child: SvgPicture.asset('assets/icons/online_shopping_.svg')),
            ),
          ),
        ],
      ),
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
