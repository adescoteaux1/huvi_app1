import 'package:flutter/gestures.dart';
import 'package:huvi_app1/core/app_export.dart';
import 'package:huvi_app1/presentation/login_vtwo_screen/login_vtwo_screen.dart';
import 'package:huvi_app1/presentation/sign_up_vone_screen/sign_up_vone_screen.dart';
import 'package:huvi_app1/widgets/custom_elevated_button.dart';
import 'package:huvi_app1/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:huvi_app1/routes/app_routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class WelcomeVtwoScreen extends StatelessWidget {
  final SupabaseClient supabase;

  const WelcomeVtwoScreen({Key? key, required this.supabase})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 50.h,
            vertical: 39.v,
          ),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgHuvilogo1removebgpreview,
                height: 275.v,
                width: 250.h,
              ),
              SizedBox(height: 51.v),
              Text(
                "HUVI",
                style: theme.textTheme.displayMedium,
              ),
              Spacer(),
              Text(
                "Welcome!",
                style: theme.textTheme.headlineLarge,
              ),
              SizedBox(height: 23.v),
                CustomElevatedButton(
                  onTap: () {
                          // Replace 'YourRouteNameHere' with the actual route name to navigate to the login screen.
                          
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  SignUpVoneScreen()),
                          );
                        },
                  text: "Get Started",
                  buttonStyle: CustomButtonStyles.fillYellow,
                ),
              SizedBox(height: 36.v),
              InkWell(
                onTap: () {
                  // Replace 'YourRouteNameHere' with the actual route name to navigate to the login screen.
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  LoginVtwoScreen()),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Already have an account? ",
                        style: CustomTextStyles.bodyMediumBlack90001_1,
                      ),
                      TextSpan(
                        text: "Log in",
                        style: CustomTextStyles.bodyMediumSecondaryContainer.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginVtwoScreen()),
                            );
                          },
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 25.v),
            ],
          ),
        ),
      ),
    );
  }
}
