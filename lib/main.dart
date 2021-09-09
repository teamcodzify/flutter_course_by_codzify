import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/animations/fade_in_text_animation_starter.dart';
import 'package:flutter_ecommerce_app/animations/shape_shifting_animation.dart';
import 'package:flutter_ecommerce_app/common_widgets/app_theme.dart';
import 'package:flutter_ecommerce_app/common_widgets/config.dart';
import 'package:flutter_ecommerce_app/screens/counter.dart';
import 'package:flutter_ecommerce_app/screens/counter_service.dart';
import 'package:flutter_ecommerce_app/screens/dynamic_widgets.dart';
import 'package:flutter_ecommerce_app/screens/splash_screen.dart';
import 'package:flutter_ecommerce_app/services/user_preferences.dart';
import 'package:provider/provider.dart';

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
    currentAppTheme.addListener(() {
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
      themeMode: currentAppTheme.currentTheme,
      // home: const SplashScreen(),
      // home: const DynamicWidgetsPage(),
      // home: AnimatedContainerDemo(),
      // home: FadeInDemo(),
      home: ChangeNotifierProvider<CounterService>(
        create: (context) => CounterService(),
        child: Counter(),
      ),
    );
  }
}


// 1. extend your class/serivce/widget with ChangeNotifier
// 2. This notifier is coming from foundation.dart package
// 3. Wrap the widget with ChangerNotifierProvider<type>
// 4. This change notifier provider is coming from the provider.dart package
// 5. In the widget where you want to use the service, 
  // service = Provider.of<type>(context)
  // service.increment
  // service.value