import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:road_ministry/main.dart';
import 'package:road_ministry/pages/MainPage.dart';
import 'package:provider/provider.dart';
import 'package:road_ministry/shared/CustomAppBar.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final gapVertical = size.height * 0.2;
    LocaleProvider localeProvider = Provider.of<LocaleProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0), // Set the desired height here
          child: customAppBar(context, true)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: gapVertical,
            ),
            Text(
              AppLocalizations.of(context)!.select_local,
              style: TextStyle(
                  color: Color.fromRGBO(11, 73, 118, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                localeProvider.setLocale(AppLocalizations.supportedLocales[0]);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPage(),
                    ));
              },
              child: Text('አማርኛ'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(250, 45),
                foregroundColor: Colors.white,
                backgroundColor: Color.fromRGBO(11, 73, 118, 1),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                localeProvider.setLocale(AppLocalizations.supportedLocales[1]);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              },
              child: Text('Afaan Oromoo'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(250, 45),
                foregroundColor: Colors.white,
                backgroundColor: Color.fromRGBO(11, 73, 118, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
