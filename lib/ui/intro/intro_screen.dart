import 'package:eventlyyy/ui/onboarding_screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../providers/app_language_provider.dart';
import '../../providers/app_theme_provider.dart';

class IntroScreen extends StatefulWidget {
  static const String routeName = 'intro_screen';

  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/logo_eventlyyyy.png',
                width: double.infinity,
                height: height * 0.07,
                alignment: Alignment.center,
              ),
              SizedBox(height: height * 0.01),
              Image.asset(
                'assets/images/being-creative.png',
                width: double.infinity,
                height: height * 0.44,
                alignment: Alignment.center,
              ),
              SizedBox(height: height * 0.01),
              Text(
                AppLocalizations.of(context)!.personalize_your_experience,
                style: TextStyle(
                  color: Color(0xff5669FF),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: height * 0.01),
              Text(
                AppLocalizations.of(context)!.description1,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),

              SizedBox(height: height * 0.03),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.language,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xff5669FF),
                    ),
                  ),
                  Consumer<AppLanguageProvider>(
                    builder: (context, languageProvider, child) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            width: 2,
                            color: Color(0xff5669FF),
                          ),
                        ),
                        height: height * 0.05,
                        width: width * 0.21,
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                languageProvider.changeLanguage('en');
                              },
                              child: Container(
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: languageProvider.appLanguage == 'en'
                                      ? Border.all(
                                          color: Color(0xff5669FF),
                                          width: 4,
                                        )
                                      : null,
                                ),
                                child: Image.asset(
                                  'assets/images/lr.png',
                                  width: 28,
                                  height: 28,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                languageProvider.changeLanguage('ar');
                              },
                              child: Container(
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: languageProvider.appLanguage == 'ar'
                                      ? Border.all(
                                          color: Color(0xff5669FF),
                                          width: 4,
                                        )
                                      : null,
                                ),
                                child: Image.asset(
                                  'assets/images/eg.png',
                                  width: 28,
                                  height: 28,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),

              SizedBox(height: height * 0.01),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.theme,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xff5669FF),
                    ),
                  ),
                  Consumer<AppThemeProvider>(
                    builder: (context, themeProvider, child) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            width: 2,
                            color: Color(0xff5669FF),
                          ),
                        ),
                        height: height * 0.05,
                        width: width * 0.21,
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                themeProvider.changeTheme(ThemeMode.light);
                              },
                              child: Container(
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: !themeProvider.isDarkMode()
                                      ? Border.all(
                                          color: Color(0xff5669FF),
                                          width: 4,
                                        )
                                      : null,
                                ),
                                child: Image.asset(
                                  'assets/images/sun.png',
                                  width: 28,
                                  height: 28,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                themeProvider.changeTheme(ThemeMode.dark);
                              },
                              child: Container(
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: themeProvider.isDarkMode()
                                      ? Border.all(
                                          color: Color(0xff5669FF),
                                          width: 4,
                                        )
                                      : null,
                                ),
                                child: Image.asset(
                                  'assets/images/moon.png',
                                  width: 28,
                                  height: 28,
                                  color: Color(0xff5669FF),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),

              SizedBox(height: height * 0.05),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff5669FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(16),
                  ),
                  padding: EdgeInsets.all(15),
                ),

                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, OnBoardingScreen.routeName);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.let_is_start,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
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
}

Widget getSelectedLanguageItem({required String textTheme}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        textTheme,
        style: TextStyle(
          color: Color(0xff5669FF),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      Icon(Icons.check, color: Color(0xff5669FF), size: 30),
    ],
  );
}

Widget getUnSelectedLanguageItem({required String textTheme}) {
  return Text(
    textTheme,
    style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  );
}
