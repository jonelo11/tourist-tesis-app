import 'package:flutter/material.dart';

// Bottom Navigation Bar
import 'package:tourist_app/widgets/bottom_navigation.dart';
import 'package:tourist_app/widgets/routes_bnavigation.dart';
import 'package:tourist_app/widgets/sidebar_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int index = 0;
  BottomNavigation ?myBNB;

  @override
  void initState() {
    myBNB = BottomNavigation(currentIndex: (i){
      setState(() {
        index = i;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SidebarMenu(),
      appBar: AppBar(
        title: const Text('Bienvenido'),
        centerTitle: true,
        backgroundColor: Colors.green[400],

      ),
      bottomNavigationBar: myBNB,
      body: Routes(index: index),
    );
  }
}