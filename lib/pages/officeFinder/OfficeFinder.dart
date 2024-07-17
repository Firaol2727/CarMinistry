import 'package:flutter/material.dart';
import 'package:road_ministry/constants/Employees.dart';
import 'package:road_ministry/constants/Services.dart';
import 'package:road_ministry/shared/CustomAppBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Officefinder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(100.0), // Set the desired height here
            child: customAppBar(context, false)),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Wrap(
                spacing: 10.0, // gap between adjacent items
                runSpacing: 30.0, // gap between lines

                children: Employees.map((Employee employee) {
                  return Officers(
                      employee.path,
                      AppLocalizations.of(context)!.localeName == "am"
                          ? employee.amharic_name
                          : employee.oromic_name,
                      AppLocalizations.of(context)!.localeName == "am"
                          ? employee.position
                          : employee.oromic_position,
                      OfficeNumber: employee.office);
                }).toList(),
              ),
            ),
          ),
        ));
  }

  Widget Officers(String image_path, String name, String position,
      {String OfficeNumber = ""}) {
    return Container(
      width: 190,
      height: 275,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 190,
            height: 40,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                position,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                ),
                maxLines: null, // Allow unlimited lines
                overflow: TextOverflow
                    .visible, // Allow text to overflow and wrap to the next line
              ),
            ),
          ),
          SizedBox(height: 5),
          Center(
            child: ClipOval(
              child: Image.asset(
                image_path != ""
                    ? 'assets/employee/' + image_path
                    : 'assets/icons/profile_holder.jpg',
                width: 140,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Container(
            width: 190,
            height: 40,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                ),
                maxLines: null, // Allow unlimited lines
                overflow: TextOverflow
                    .visible, // Allow text to overflow and wrap to the next line
              ),
            ),
          ),
          SizedBox(height: 1),
          Container(
            width: 190,
            height: 40,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Office No " + OfficeNumber,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                ),
                maxLines: null, // Allow unlimited lines
                overflow: TextOverflow
                    .visible, // Allow text to overflow and wrap to the next line
              ),
            ),
          ),
        ],
      ),
    );
  }
}
