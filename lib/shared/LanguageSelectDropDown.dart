import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:road_ministry/main.dart';

Widget buildLanguageSelectorDropdown(BuildContext context) {
  LocaleProvider localeProvider = Provider.of<LocaleProvider>(context);
  Locale? _selectedLocale = localeProvider.locale;

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: DropdownButton<Locale>(
      value: _selectedLocale,
      dropdownColor: Color.fromARGB(255, 7, 102, 180),
      hint: Text(localeProvider.locale.languageCode == 'en' ? 'Qooqa' : 'ቋንቋ',
          style: TextStyle(color: Colors.white)),
      items: AppLocalizations.supportedLocales.map((Locale locale) {
        return DropdownMenuItem<Locale>(
          value: locale,
          child: Text(
            locale.languageCode == 'en' ? 'Afaan Oromoo' : 'አማርኛ',
            style: TextStyle(color: Colors.white),
          ),
        );
      }).toList(),
      onChanged: (Locale? newLocale) {
        if (newLocale != null) {
          localeProvider.setLocale(newLocale);
        }
      },
    ),
  );
}
