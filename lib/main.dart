import 'package:cozy/pages/splash_page.dart';
import 'package:cozy/providers/place_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main () {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PlaceProvider(),
      child: MaterialApp(
        home: SplashPage(),
      ),
    );
  }
}