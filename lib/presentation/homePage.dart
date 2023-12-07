/*import 'package:flutter/material.dart';
import 'package:supabase_flutter_auth/supabase_flutter_auth.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Supabase Auth Example'),
      ),
      body: SupabaseAuth(
        builder: (BuildContext context, SupabaseAuthState authState) {
          if (authState == SupabaseAuthState.authenticated) {
            // User is authenticated, show the home screen
            return HomeScreen();
          } else {
            // User is not authenticated, show the login screen
            return LoginScreen();
          }
        },
      ),
    );
  }
}
*/