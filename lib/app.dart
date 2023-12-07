import 'package:flutter/material.dart';
import 'package:huvi_app1/routes/app_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
 /*
/// Entry widget of the app.
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
 
  @override
  State<App> createState() => _AppState();
}
 
class _AppState extends State<App> {
  final _appRouter = AppRouter();
 
  @override
  void initState() {
    super.initState();
 
    /// Listen for authentication events and redirect to
    /// correct page when key events are detected.
    SupabaseAuth.instance.onAuthChange.listen((event) {
      if (event == AuthChangeEvent.signedIn) {
        _appRouter
          ..popUntilRoot()
          ..replace(const HomeRoute());
      } else if (event == AuthChangeEvent.signedOut) {
        _appRouter
          ..popUntilRoot()
          ..replace(const SignInRoute());
      }
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
*/