import 'package:flutter/material.dart';


class CustomAppbar extends AppBar {
  CustomAppbar({Key? key, required String title}) : super(
    key: key,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/img/appicon32x32.png"),
        const SizedBox(width: 5),
        Text(title)
      ],
    ),
    centerTitle: true
  );

}