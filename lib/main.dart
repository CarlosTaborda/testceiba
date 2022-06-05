import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:testceiba/routes.dart';
import 'package:testceiba/theme.dart';

void main() {
  runApp(const ProviderScope(
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme(Theme.of(context)).getTheme(),
      initialRoute: "/home_screen",
      routes: routes,
    );
  }
}
