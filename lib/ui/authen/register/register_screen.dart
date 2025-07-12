import 'package:eventlyyy/ui/tabs/widgets/custom_elevated_button.dart';
import 'package:eventlyyy/ui/tabs/widgets/custom_text_form_field.dart';
import 'package:eventlyyy/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../home_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register_screen';

  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Register',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
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
                      prefixIcon: Image.asset('assets/images/icon_name.png'),
                      hintText: 'Name',
                      controller: nameController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.016),

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
                    CustomTextFormField(
                      obscureText: true,
                      prefixIcon: Image.asset('assets/images/icon_pass.png'),
                      hintText: 'Re Password',
                      controller: rePasswordController,
                      suffixIcon: Image.asset(
                        'assets/images/icon_3en_m2fola.png',
                      ),
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter Re Password';
                        }
                        if (text.length < 6) {
                          return 'Password must be at least 6 chars ';
                        }
                        if (passwordController.text !=
                            rePasswordController.text) {
                          return 'Re password does not match password';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: height * 0.04),
                    CustomElevatedButton(
                      onPressed: () {
                        register();
                      },
                      text: 'Create Account',
                    ),
                    SizedBox(height: height * 0.02),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already Have Account ?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Login',
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void register() {
    if (formKey.currentState?.validate() == true) {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }
  }
}
