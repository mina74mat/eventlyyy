import 'package:eventlyyy/providers/app_language_provider.dart';
import 'package:eventlyyy/providers/app_theme_provider.dart';
import 'package:eventlyyy/ui/home_screen.dart';
import 'package:eventlyyy/ui/intro/intro_screen.dart';
import 'package:eventlyyy/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppLanguageProvider()),
        ChangeNotifierProvider(create: (context) => AppThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: IntroScreen.routeName,
      routes: {
        // SplashScreen.routeName : (context)=> SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        IntroScreen.routeName: (context) => IntroScreen(),
      },

      // darkTheme: AppTheme.darkTheme,
      // themeMode: ThemeMode.dark,
      locale: Locale(languageProvider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.appTheme,
    );
  }
}
