import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grayhat_flutter_challange_app/provider/product_provider.dart';
import 'package:grayhat_flutter_challange_app/screens/detail_screen.dart';
import 'package:grayhat_flutter_challange_app/screens/home_screen.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ProductProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              color: Colors.black,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w500),
        ),
      ),
      routes: {
        HomeScreen.route: (context) => const HomeScreen(),
        DetailScreen.route: (context) => DetailScreen(),
      },
      home: const HomeScreen(),
    );
  }
}
