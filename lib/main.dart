import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'Provider/favorite_provider.dart';
import 'Provider/provider_state.dart';
import 'View/Splash/splash.dart';
void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (_) => FavouriteItem()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
    child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home:  const SplashScreen(),
    ),
    );
  }
}


