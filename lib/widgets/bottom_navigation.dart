import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {

  final Function currentIndex;

  const BottomNavigation({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (int i){
        setState(() { 
          index = i;
          widget.currentIndex(i);
        });
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.green[400],
      iconSize: 25.0,
      selectedFontSize: 14.0,
      unselectedFontSize: 12.0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code),
          label: 'QR'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on),
          label: 'Zona'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'Info'
        ),
      ],
    );
  }
}