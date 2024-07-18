import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:road_ministry/helpers/Services.helper.dart';
import 'package:road_ministry/pages/services/DetailService.dart';
import 'package:road_ministry/pages/services/VehicleServiceList.dart';
import 'package:road_ministry/shared/CustomAppBar.dart';
import 'package:road_ministry/shared/LanguageSelectDropDown.dart';
import 'package:road_ministry/constants/Services.dart';

class DriverService extends StatelessWidget {
  const DriverService({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final buttonWidth = size.width * 0.22; // 40% of the screen width
    final buttonHeight = size.height * 0.19; // 10% of the screen height
    final gap = size.height * 0.01;
    double fontSize = 17;
    List<Services> data =
        getDriverServices(AppLocalizations.of(context)!.localeName);
    return Scaffold(
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(100.0), // Set the desired height here
            child: customAppBar(context, false,
                title: AppLocalizations.of(context)!.office_name +
                    " " +
                    AppLocalizations.of(context)!.driver_services)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ServiceButton(context, 0, buttonWidth, buttonHeight, data,
                      fontSize, data[0].name, data[0].time_it_takes),
                  SizedBox(
                    width: gap,
                  ),
                  ServiceButton(context, 1, buttonWidth, buttonHeight, data,
                      fontSize, data[1].name, data[0].time_it_takes),
                  SizedBox(
                    width: gap,
                  ),
                  ServiceButton(context, 2, buttonWidth, buttonHeight, data,
                      fontSize, data[2].name, data[0].time_it_takes),
                  SizedBox(
                    width: gap,
                  ),
                  ServiceButton(context, 3, buttonWidth, buttonHeight, data,
                      fontSize, data[3].name, data[3].time_it_takes),
                ],
              ),
              SizedBox(
                height: gap,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ServiceButton(context, 4, buttonWidth, buttonHeight, data,
                      fontSize, data[4].name, data[4].time_it_takes),
                  SizedBox(
                    width: gap,
                  ),
                  ServiceButton(context, 5, buttonWidth, buttonHeight, data,
                      fontSize, data[5].name, data[5].time_it_takes),
                  SizedBox(
                    width: gap,
                  ),
                  ServiceButton(context, 6, buttonWidth, buttonHeight, data,
                      fontSize, data[6].name, data[6].time_it_takes),
                  SizedBox(
                    width: gap,
                  ),
                  ServiceButton(context, 7, buttonWidth, buttonHeight, data,
                      fontSize, data[7].name, data[7].time_it_takes)
                ],
              ),
              SizedBox(
                height: gap,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ServiceButton(context, 8, buttonWidth, buttonHeight, data,
                      fontSize, data[8].name, data[8].time_it_takes),
                  SizedBox(
                    width: gap,
                  ),
                  ServiceButton(context, 9, buttonWidth, buttonHeight, data,
                      fontSize, data[9].name, data[9].time_it_takes),
                  SizedBox(
                    width: gap,
                  ),
                  ServiceButton(context, 10, buttonWidth, buttonHeight, data,
                      fontSize, data[10].name, data[10].time_it_takes),
                  SizedBox(
                    width: gap,
                  ),
                  ServiceButton(context, 11, buttonWidth, buttonHeight, data,
                      fontSize, data[11].name, data[11].time_it_takes)
                ],
              ),
              SizedBox(
                height: gap,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ServiceButton(context, 12, buttonWidth, buttonHeight, data,
                      fontSize, data[12].name, data[12].time_it_takes),
                  SizedBox(
                    width: gap,
                  ),
                  ServiceButton(context, 13, buttonWidth, buttonHeight, data,
                      fontSize, data[13].name, data[13].time_it_takes),
                  SizedBox(
                    width: gap,
                  ),
                ],
              ),
              SizedBox(
                height: gap,
              )
            ],
          ),
        ));
  }

  GestureDetector ServiceButton(
      BuildContext context,
      int index,
      double buttonWidth,
      double buttonHeight,
      List<Services> data,
      double fontSize,
      String name,
      int minutes) {
    String time_decription = displayTimeItTakes(context, minutes);
    return GestureDetector(
      onTap: () {
        // VehicleServices
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailService(
                    index: index,
                    type_service: 'driver',
                  )),
        );
      },
      child: Material(
        elevation: 4.0,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            // gradient: LinearGradient(
            //       colors: [
            //         Colors.blue,
            //         Colors.green,
            //       ],
            //       begin: Alignment.topLeft,
            //       end: Alignment.bottomRight,
            //     ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color.fromRGBO(11, 73, 118, 1), // Border color
              width: 0.8, // Border width
            ),
          ),
          width: buttonWidth,
          height: buttonHeight,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 8, // 80% of the space
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      (index + 1).toString() + ". " + name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w800,
                        color: Color.fromRGBO(11, 73, 118, 1),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4.0), // Add some space between the texts
              Flexible(
                flex: 2, // 20% of the space
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      time_decription,
                      style: TextStyle(
                          fontSize:
                              AppLocalizations.of(context)!.time_it_takes ==
                                      "am"
                                  ? 15.0
                                  : 14.0,
                          color: Color.fromARGB(255, 106, 119, 10)),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
