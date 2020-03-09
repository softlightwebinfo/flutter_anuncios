import 'package:flutter/material.dart';
import '../settings.dart';

Widget buildAppBar({@required BuildContext context}) {
  return Container(
    height: 80,
    width: MediaQuery.of(context).size.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.menu,
            color: colorTheme,
            size: 30,
          ),
          onPressed: () {},
        ),
        Image.network(
          "https://www.musicosdelmundo.com/static/images/logo_mobile.png",
          height: double.infinity,
          width: 150,
          fit: BoxFit.fitWidth,
        ),
        InkWell(
          onTap: () {},
          child: Text(
            "Anuncios",
            style: TextStyle(
              color: colorTheme,
              fontSize: 18,
            ),
          ),
        ),
      ],
    ),
  );
}
