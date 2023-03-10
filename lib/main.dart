import 'package:altabellguest/Providers/categorywise_menu_provider.dart';
import 'package:altabellguest/Providers/menu_card_provider.dart';
import 'package:altabellguest/Providers/orderProvider.dart';
import 'package:altabellguest/Providers/user_provider.dart';

import 'package:altabellguest/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => MenuCardProvider()),
        ChangeNotifierProvider(create: (_) => CategoryMenuProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
      ],
      child: MaterialApp(
        title: 'Uff Guest',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const NavigationHandler(),
        // routes: {
        //   '/bottomCart': (context) => const NavigationHandler(),
        // },
      ),
    );
  }
}
