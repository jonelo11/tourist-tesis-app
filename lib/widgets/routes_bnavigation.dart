import 'package:flutter/material.dart';

// Screens
import 'package:tourist_app/screens/informacion_screen.dart';
import 'package:tourist_app/screens/qr_screen.dart';
import 'package:tourist_app/screens/zona_screen.dart';

class Routes extends StatelessWidget {

  final int index;
  const Routes({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Widget> myList = [
      const QrScreen(),
      const ZonaScreen(),
      const InformacionScreen()
    ];

    return myList[index];
  }
}