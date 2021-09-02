import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common_widgets/app_theme.dart';
import 'package:flutter_ecommerce_app/common_widgets/config.dart';
import 'package:flutter_ecommerce_app/screens/dynamic_widgets.dart';
import 'package:flutter_ecommerce_app/screens/splash_screen.dart';
import 'package:flutter_ecommerce_app/services/user_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await UserPreferences().init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      //2
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Codzify Ecommerce App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: currentTheme.currentTheme,
      // home: const SplashScreen(),
      home: const DynamicWidgetsPage(),
    );
  }
}
