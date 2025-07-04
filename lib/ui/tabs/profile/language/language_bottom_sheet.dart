import 'package:eventlyyy/l10n/app_localizations.dart';
import 'package:eventlyyy/providers/app_language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              languageProvider.changeLanguage('en');
            },
            child: languageProvider.appLanguage == 'en'
                ? getSelectedLanguageItem(
                    textLanguage: AppLocalizations.of(context)!.english,
                  )
                : getUnSelectedLanguageItem(
                    textLanguage: AppLocalizations.of(context)!.english,
                  ),
          ),
          SizedBox(height: 16),
          InkWell(
            onTap: () {
              languageProvider.changeLanguage('ar');
            },
            child: languageProvider.appLanguage == 'ar'
                ? getSelectedLanguageItem(
                    textLanguage: AppLocalizations.of(context)!.arabic,
                  )
                : getUnSelectedLanguageItem(
                    textLanguage: AppLocalizations.of(context)!.arabic,
                  ),
          ),
        ],
      ),
    );
  }

  Widget getSelectedLanguageItem({required String textLanguage}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          textLanguage,
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

  Widget getUnSelectedLanguageItem({required String textLanguage}) {
    return Text(
      textLanguage,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}
