import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:huvi_app1/core/utils/supabase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
/*
class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);
 
  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}
 
class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
 
    /// Load auth session.
    ///
    /// Wait a minium `delayed` time in any case
    /// to avoid flashing screen.
    Future.wait([
      SupabaseAuth.instance.initialSession,
      Future.delayed(
        const Duration(milliseconds: 2000),
      ),
    ]).then((responseList) {
      final session = responseList.first as Session?;
 
      /// Redirect to either home or sign in routes based on current session.
      context.router.replace(
        session != null ? const HomeRoute() : const SignInRoute(),
      );
    }).catchError((_) {
      context.router.replace(const SignInRoute());
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
*/