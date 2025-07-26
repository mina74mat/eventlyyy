import 'package:eventlyyy/ui/authen/register/register_screen.dart';
import 'package:eventlyyy/ui/home_screen.dart';
import 'package:eventlyyy/ui/tabs/widgets/custom_elevated_button.dart';
import 'package:eventlyyy/ui/tabs/widgets/custom_text_form_field.dart';
import 'package:eventlyyy/utils/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../utils/dialog_utils.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login_screen';

  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: height * 0.02),
              Image.asset(
                'assets/images/logo_evently.png',
                height: height * 0.28,
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextFormField(
                      prefixIcon: Image.asset('assets/images/icon_email.png'),
                      hintText: 'Email',
                      controller: emailController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter email';
                        }

                        final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                        ).hasMatch(text.trim());
                        if (!emailValid) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.016),
                    CustomTextFormField(
                      obscureText: true,
                      prefixIcon: Image.asset('assets/images/icon_pass.png'),
                      hintText: 'Password',
                      controller: passwordController,
                      suffixIcon: Image.asset(
                        'assets/images/icon_3en_m2fola.png',
                      ),
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter Password';
                        }
                        if (text.length < 6) {
                          return 'Password must be at least 6 chars ';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.016),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forget Password?',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryLight,
                              decorationStyle: TextDecorationStyle.double,
                              color: AppColors.primaryLight,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.016),
                    CustomElevatedButton(
                      onPressed: () {
                        login();
                      },
                      text: 'login',
                    ),
                    SizedBox(height: height * 0.016),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t Have Account ?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              RegisterScreen.routeName,
                            );
                          },
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryLight,
                              decorationStyle: TextDecorationStyle.double,
                              color: AppColors.primaryLight,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.016),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            endIndent: width * 0.03,
                            indent: width * 0.09,
                            thickness: 2,
                            color: AppColors.primaryLight,
                          ),
                        ),
                        Text(
                          'or',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryLight,
                            fontSize: 18,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            endIndent: width * 0.09,
                            indent: width * 0.03,
                            thickness: 2,
                            color: AppColors.primaryLight,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.02),

                    CustomElevatedButton(
                      backgroundColor: Colors.white,
                      icon: true,
                      iconWidget: Image.asset('assets/images/logo_google.png'),
                      onPressed: () {
                        signInWithGoogle();
                      },
                      text: 'Login With Google',
                      textColor: AppColors.primaryLight,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() async {
    if (formKey.currentState?.validate() == true) {
      DialogUtils.showLoading(context: context);
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        DialogUtils.hideLoading(context: context);
        DialogUtils.showMessage(context: context, message: 'Login Successfully',
            posActionName: 'Ok',
            posAction: () {
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            });
        print('login successful');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(
              context: context, message: 'Login Successfully');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }

  Future<void> signInWithGoogle() async {
    DialogUtils.showLoading(context: context);
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        DialogUtils.hideLoading(context: context);
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser
          .authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      DialogUtils.hideLoading(context: context);
      DialogUtils.showMessage(
        context: context,
        message: 'Login with Google Successfully',
        posActionName: 'Ok',
        posAction: () {
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        },
      );

      print('Google login successful');
    } catch (e) {
      DialogUtils.hideLoading(context: context);
      print('Google login error: $e');
      DialogUtils.showMessage(
          context: context, message: 'Login with Google failed');
    }
  }


}
