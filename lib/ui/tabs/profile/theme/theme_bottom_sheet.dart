import 'package:eventlyyy/l10n/app_localizations.dart';
import 'package:eventlyyy/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              themeProvider.changeTheme(ThemeMode.light);
            },
            child: !(themeProvider.isDarkMode())
                ? getSelectedLanguageItem(
                    textTheme: AppLocalizations.of(context)!.light,
                  )
                : getUnSelectedLanguageItem(
                    textTheme: AppLocalizations.of(context)!.light,
                  ),
          ),
          SizedBox(height: 16),
          InkWell(
            onTap: () {
              themeProvider.changeTheme(ThemeMode.dark);
            },
            child: themeProvider.isDarkMode()
                ? getSelectedLanguageItem(
                    textTheme: AppLocalizations.of(context)!.dark,
                  )
                : getUnSelectedLanguageItem(
                    textTheme: AppLocalizations.of(context)!.dark,
                  ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
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
}
