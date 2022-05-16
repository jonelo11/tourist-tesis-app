import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// Screens
import 'package:tourist_app/screens/login_screen.dart';
import 'package:tourist_app/screens/registration_screen.dart';
import 'package:tourist_app/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tourist App',
        initialRoute: 'home',
        routes: {
          'login': (_) => const LoginScreen(),
          'register': (_) => const RegistrationScreen(),
          'home': (_) => const HomeScreen()
        },
        theme: ThemeData(
          primaryColor: Colors.green[400],
        ));
  }
}
