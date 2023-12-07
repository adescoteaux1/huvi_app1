import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'package:get_it/get_it.dart';
import 'package:huvi_app1/core/utils/auth_repository.dart';
import 'package:huvi_app1/core/utils/database.dart';
import 'package:huvi_app1/core/utils/supabase_auth.dart';
import 'package:huvi_app1/presentation/auth_page.dart';
import 'package:huvi_app1/presentation/welcome_vtwo_screen/welcome_vtwo_screen.dart';
import 'package:huvi_app1/theme/theme_helper.dart';
import 'package:huvi_app1/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://jlaeonshmaqkwztitqld.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpsYWVvbnNobWFxa3d6dGl0cWxkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDEyODM1NDUsImV4cCI6MjAxNjg1OTU0NX0.vliW18yuZr34-2XdO36ahJorxJkotHkZiSwJRO3fhRE',
    authFlowType: AuthFlowType.pkce,
  );

  final supabase = SupabaseClient(
    'https://jlaeonshmaqkwztitqld.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpsYWVvbnNobWFxa3d6dGl0cWxkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDEyODM1NDUsImV4cCI6MjAxNjg1OTU0NX0.vliW18yuZr34-2XdO36ahJorxJkotHkZiSwJRO3fhRE',
  );

  final auth = supabase.auth;
/*
  supabase = createClient(supabaseUrl, supabaseAnonKey, {
  auth: {
    storage: AsyncStorage,
    autoRefreshToken: true,
    persistSession: true,
    detectSessionInUrl: false,
  },
});

  /// Use the global `getIt` instance to register `AuthRepository`
  getIt.registerSingleton<Database>(SqlDatabase());
  getIt.registerSingleton<AuthRepository>(SupabaseAuth(getIt<Database>()));
*/ 

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(MyApp(supabase: supabase));

}

class MyApp extends StatelessWidget {
  final SupabaseClient supabase;

  const MyApp({Key? key, required this.supabase}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: 'HUVI',
      debugShowCheckedModeBanner: false,
      home: WelcomeVtwoScreen(supabase: this.supabase,),
      routes: AppRoutes.routes,
    );
  }
}

final supabase = Supabase.instance.client;