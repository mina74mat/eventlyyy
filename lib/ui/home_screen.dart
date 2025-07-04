import 'package:eventlyyy/l10n/app_localizations.dart';
import 'package:eventlyyy/ui/tabs/profile/profile_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProfileTab());
  }
}
