import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gotrue/src/types/auth_response.dart';
import 'package:huvi_app1/core/app_export.dart';
import 'package:huvi_app1/main.dart';
import 'package:huvi_app1/presentation/uv_status_vone_container_screen/uv_status_vone_container_screen.dart';
import 'package:huvi_app1/widgets/custom_elevated_button.dart';
import 'package:huvi_app1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:huvi_app1/presentation/login_vtwo_screen/login_vtwo_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:huvi_app1/core/utils/constants.dart';


class SignUpVoneScreen extends StatelessWidget {
  //final SupabaseClient supabase;
  SignUpVoneScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  
  get context => null;

  Future<String> signUpEmailAndPassword(String email, String password) async {
    
    final response = await supabase.auth.signUp(email: email, password: password);
 
    final userId = response.user?.id;
    if (userId == null) {
      throw UnimplementedError();
    }
    setUser(userId);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  UvStatusVoneContainerScreen()),
    );
    return userId;
    
  }

/*
  void signUserUp() async {
    showDialog(
      context: context, 
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
 
    try {
      if(passwordController.text == confirmPasswordController.text) {
        final email = emailController.text;
        final password = passwordController.text;
        
        final response = await Supabase.auth.signUp(
        email: email,
        password: password,
      );
        setLoading(true);
          const {
            data: { session },
            error,
          } = await supabase.auth.signUp(
        email: emailController.text,
          password: passwordController.text,
          );

          if (error) Alert.alert(error.message);
          if (!session)
            Alert.alert("Please check your inbox for email verification!");
          setLoading(false);
        }

        //create the user
        
        //await FirebaseAuth.instance.//createUserWithEmailAndPassword(
        await supabase.auth.signUp(
        email: emailController.text,
          password: passwordController.text,
          );

        //create a user document and add to firestore
        //createUserDocument(userCredential);

      } else {
        showErrorMessage("Passwords Don't Match");
      }

      // pop the loading circle
      Navigator.pop(context);

    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      //WRONG EMAIL
      showErrorMessage(e.code);
    }
  }

  //Create a user document and collect them in firestore
  Future<void> createUserDocument(UserCredential? userCredential) async {
    if (userCredential != null && userCredential.user != null) {
      await FirebaseFirestore.instance
        .collection("Users")
        .doc(userCredential.user!.email)
        .set({'email': userCredential.user!.email});
    }
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
*/

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
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 24.v,),
            child: Column(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgHuvilogo1removebgpreview,
                  height: 110.v,
                  width: 100.h,
                ),
                SizedBox(height: 7.v),
                Text(
                  "Welcome to HUVI",
                  style: theme.textTheme.headlineMedium,
                ),
                SizedBox(height: 11.v),
                Text(
                  "Sign up for your HUVI account",
                  style: CustomTextStyles.bodyMediumBluegray600,
                ),
                SizedBox(height: 12.v),
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
                SizedBox(height: 24.v),
                CustomTextFormField(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
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
                SizedBox(height: 24.v),
                CustomElevatedButton(
                  onTap: () { if (passwordController.text == confirmPasswordController.text) {
                      signUpEmailAndPassword(emailController.text, passwordController.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  UvStatusVoneContainerScreen()),
                      );
                    };
                  },
                  text: "Sign Up",
                  buttonStyle: CustomButtonStyles.fillYellow,
                  
                ),
                SizedBox(height: 35.v),
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
                SizedBox(height: 32.v),
                CustomElevatedButton(
                  text: "Continue with Google",
                  leftIcon: Container(
                    margin: EdgeInsets.only(right: 30.h),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgIconsLogogoogle,
                    ),
                  ),
                  buttonStyle: CustomButtonStyles.fillWhiteA,
                  buttonTextStyle: CustomTextStyles.titleSmallYellow700,
                ),
                SizedBox(height: 16.v),
                CustomElevatedButton(
                  text: "Continue with Facebook",
                  leftIcon: Container(
                    margin: EdgeInsets.only(right: 30.h),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgIconsLogofacebook,
                    ),
                  ),
                  buttonStyle: CustomButtonStyles.fillWhiteA,
                  buttonTextStyle: CustomTextStyles.titleSmallYellow700,
                ),
                SizedBox(height: 10.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: CustomTextStyles.bodyMediumYellow700,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.h),
                      child: TextButton(
                        onPressed: () {
                          // Replace 'YourRouteNameHere' with the actual route name to navigate to the login screen.
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  LoginVtwoScreen()),
                          );
                        },
                        child: Text(
                          "Login",
                          style: CustomTextStyles.bodyMediumYellow700_1.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 281.h,
                  margin: EdgeInsets.fromLTRB(10.h, 1.v, 10.h, 5.v),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "By creating an account, you accept our\n",
                          style: CustomTextStyles.bodySmallBluegray600_1,
                        ),
                        TextSpan(
                          text: "Terms and conditions",
                          style: theme.textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: " you read our ",
                          style: CustomTextStyles.bodySmallBluegray600_1,
                        ),
                        TextSpan(
                          text: "Privacy Policy.",
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
