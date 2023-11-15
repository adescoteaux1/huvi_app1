import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'package:huvi_app1/presentation/auth_page.dart';
import 'package:huvi_app1/presentation/welcome_vtwo_screen/welcome_vtwo_screen.dart';
import 'package:huvi_app1/theme/theme_helper.dart';
import 'package:huvi_app1/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: 'HUVI',
      debugShowCheckedModeBanner: false,
      home: WelcomeVtwoScreen(),
      routes: AppRoutes.routes,
    );
  }
}
