import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:road_ministry/pages/services/SelectMainService.dart';
import 'package:road_ministry/shared/LanguageSelectDropDown.dart';

Widget customAppBar(BuildContext context, bool? first, {String title = ""}) {
  first ??= false;
  final size = MediaQuery.of(context).size;
  final title_width = size.width * 0.7;
  return Container(
    color: Color.fromRGBO(11, 73, 118, 1), // Border color
    child: SafeArea(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (!first)
              IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            else
              SizedBox(),
            Container(
              width: title_width,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: CircleAvatar(
                          minRadius: 40,
                          backgroundImage: AssetImage('assets/icons/logo.jpg')),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Center(
                      child: Text(
                        title == ""
                            ? AppLocalizations.of(context)!.welcome
                            : title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.4,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        maxLines: null, // Allow unlimited lines
                        overflow: TextOverflow
                            .visible, // Allow text to overflow and wrap to the next line
                      ),
                    ),
                  ),
                ],
              ),
            ),
            buildLanguageSelectorDropdown(context),
          ],
        ),
      ),
    ),
  );
}
