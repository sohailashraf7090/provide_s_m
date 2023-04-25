import 'package:flutter/material.dart';
import 'package:provide_s_m/provider/auth_provider.dart';
import 'package:provide_s_m/provider/count_provider.dart';
import 'package:provide_s_m/provider/dark_theme_provider.dart';
import 'package:provide_s_m/provider/example._two_provider.dart';
import 'package:provide_s_m/provider/favourite_provider.dart';
import 'package:provide_s_m/screen/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => ExampleTwoProvider()),
          ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChanger()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeChanger.themeMode,
            darkTheme: ThemeData(
                brightness: Brightness.dark,
                primaryColor: Colors.green,
                primarySwatch: Colors.green),
            theme: ThemeData(
                brightness: Brightness.light,
                primaryColor: Colors.red,
                primarySwatch: Colors.red),
            home: const LoginPage(),
          );
        }));
  }
}
