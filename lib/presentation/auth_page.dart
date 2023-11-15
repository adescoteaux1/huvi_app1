
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:huvi_app1/presentation/login_vtwo_screen/login_vtwo_screen.dart';
import 'package:huvi_app1/presentation/uv_status_vone_page/uv_status_vone_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //logged in
          if (snapshot.hasData) {
            return UvStatusVonePage();
          }
          //not logged in
          else {
            return LoginVtwoScreen();
          }
        },
      ),
    );
  }
}