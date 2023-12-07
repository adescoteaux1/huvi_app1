import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:huvi_app1/core/app_export.dart';
import 'package:huvi_app1/main.dart';
import 'package:huvi_app1/presentation/uv_status_vone_container_screen/uv_status_vone_container_screen.dart';
import 'package:huvi_app1/presentation/uv_status_vone_page/uv_status_vone_page.dart';
import 'package:huvi_app1/widgets/custom_elevated_button.dart';
import 'package:huvi_app1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:huvi_app1/presentation/sign_up_vone_screen/sign_up_vone_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LoginVtwoScreen extends StatefulWidget {

  LoginVtwoScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<LoginVtwoScreen> createState() => _LoginVtwoScreenState();
}

class _LoginVtwoScreenState extends State<LoginVtwoScreen> {

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();


  Future<String> signInEmailAndPassword(String email, String password) async {
    final response = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
 
    final userId = response.user?.id;
    if (userId == null) {
      throw UnimplementedError();
    }
 
    return userId;
  }

  Future<AuthResponse> _googleSignIn() async {
    /// TODO: update the Web client ID with your own.
    ///
    /// Web Client ID that you registered with Google Cloud.
    const webClientId = 'my-web.apps.googleusercontent.com';

    /// TODO: update the iOS client ID with your own.
    ///
    /// iOS Client ID that you registered with Google Cloud.
    const iosClientId = 'my-ios.apps.googleusercontent.com';

    // Google sign in on Android will work without providing the Android
    // Client ID registered on Google Cloud.

    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    return supabase.auth.signInWithIdToken(
      provider: Provider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

/*
  Future<void> login() async {
    final client = GetIt.instance<SupabaseClient>();
    var data;
    var error;
    { data, error } = await client.auth
        .signInWithPassword(email: emailController.text, password: passwordController.text);

    if (result.data != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Login Successful"),
      ));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else if (result.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(result.error!.message),
      ));
    }
  }
*/
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Text(message)
        );
      },
    );
  }

  void signUserIn() async {
    showDialog(
      context: context, 
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try { 
      await supabase.auth.signInWithPassword(
      email: emailController.text,
      password: passwordController.text,
      );
    } on AuthException catch (e) {
      Navigator.pop(context);
      //WRONG EMAIL
      if (e == 'user-not-found') {
        print('No user found for that email.');
        
        //show error to user
        showErrorMessage("Invalid Email");
      } 
    }

/*
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
      );

      // pop the loading circle
      Navigator.pop(context);

    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      //WRONG EMAIL
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        
        //show error to user
        showErrorMessage("Invalid Email");
      } 
      //WRONG PASSWORD
      else if (e.code == 'wrong-password') {
        Navigator.pop(context);
        //show error to user
        showErrorMessage("Incorrect Email");
      } 
    }
    */
  }

  

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 33.v,),
            child: Column(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgHuvilogo1removebgpreview,
                  height: 110.v,
                  width: 90.h,
                  alignment: Alignment.center,
                ),
                SizedBox(height: 5.v),
                Text(
                  "Welcome Back!",
                  style: theme.textTheme.headlineMedium,
                ),
                SizedBox(height: 11.v),
                Text(
                  "Log in to your HUVI account",
                  style: CustomTextStyles.bodyMediumBluegray600,
                ),
                SizedBox(height: 45.v),
                CustomTextFormField(
                  controller: emailController,
                  hintText: "Email",
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 24.v),
                CustomTextFormField(
                  controller: passwordController,
                  hintText: "Password",
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  suffix: Container(
                    margin: EdgeInsets.fromLTRB(30.h, 14.v, 13.h, 14.v),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgEye,
                    ),
                  ),
                  suffixConstraints: BoxConstraints(
                    maxHeight: 49.v,
                  ),
                  obscureText: true,
                  contentPadding: EdgeInsets.only(
                    left: 13.h,
                    top: 16.v,
                    bottom: 16.v,
                  ),
                ),
                SizedBox(height: 20.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Forgot password? ",
                          style: CustomTextStyles.bodyMediumYellow700_2,
                        ),
                        TextSpan(
                          text: "Reset your password",
                          style:
                              CustomTextStyles.bodyMediumYellow700_3.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 23.v),
                CustomElevatedButton(
                  onTap: () {
                          // Replace 'YourRouteNameHere' with the actual route name to navigate to the login screen.
                          signInEmailAndPassword(emailController.text, passwordController.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  UvStatusVoneContainerScreen()),
                          );
                        },
                  text: "Login",
                  buttonStyle: CustomButtonStyles.fillYellow,
                ),
                SizedBox(height: 45.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 6.v,
                        bottom: 9.v,
                      ),
                      child: SizedBox(
                        width: 103.h,
                        child: Divider(),
                      ),
                    ),
                    Text(
                      "Or better yet...",
                      style: CustomTextStyles.bodyMediumLightblue400,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 6.v,
                        bottom: 9.v,
                      ),
                      child: SizedBox(
                        width: 103.h,
                        child: Divider(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.v),
                CustomElevatedButton(
                  text: "Continue with Google",
                  leftIcon: Container(
                    margin: EdgeInsets.only(right: 30.h),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgIconsLogogoogle,
                    ),
                  ),
                  onTap: () => {
                    _googleSignIn(),
                  },
                  buttonStyle: CustomButtonStyles.fillGray,
                  buttonTextStyle: CustomTextStyles.titleSmallYellow700,
                ),
                SizedBox(height: 16.v),
                CustomElevatedButton(
                  text: "Continue with Apple",
                  leftIcon: Container(
                    margin: EdgeInsets.only(right: 30.h),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgIconsLogofacebook,
                    ),
                  ),
                  buttonStyle: CustomButtonStyles.fillGray,
                  buttonTextStyle: CustomTextStyles.titleSmallYellow700,
                ),
                SizedBox(height: 35.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 1.v),
                      child: Text(
                        "Don’t have an account?",
                        style: CustomTextStyles.bodyMediumYellow700,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.h),
                      child: TextButton(
                        onPressed: () {
                          // Replace 'YourRouteNameHere' with the actual route name to navigate to the login screen.
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  SignUpVoneScreen()),
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: CustomTextStyles.bodyMediumYellow700_1.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
