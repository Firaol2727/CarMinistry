import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:road_ministry/helpers/Services.helper.dart';
import 'package:road_ministry/pages/services/DetailService.dart';
import 'package:road_ministry/shared/CustomAppBar.dart';
import 'package:road_ministry/constants/Services.dart';

class VehicleServices extends StatelessWidget {
  const VehicleServices({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final buttonWidth = size.width * 0.18; // 40% of the screen width
    final buttonHeight = size.height * 0.18; // 10% of the screen height
    final gap = size.height * 0.02;
    double fontSize =
        AppLocalizations.of(context)!.time_it_takes == "am" ? 17.0 : 15.0;
    List<Services> data =
        getVehicleServices(AppLocalizations.of(context)!.localeName);
    return Scaffold(
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(100.0), // Set the desired height here
            child: customAppBar(context, false,
                title: AppLocalizations.of(context)!.office_name +
                    " " +
                    AppLocalizations.of(context)!.vehicle_services)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ServiceButton(context, buttonWidth, buttonHeight, data,
                      fontSize, 0, data[0].name, data[0].time_it_takes),
                  SizedBox(
                    width: gap,
                  ),
                  ServiceButton(context, buttonWidth, buttonHeight, data,
                      fontSize, 1, data[1].name, data[1].time_it_takes),
                  SizedBox(
                    width: gap,
                  ),
                  ServiceButton(context, buttonWidth, buttonHeight, data,
                      fontSize, 2, data[2].name, data[2].time_it_takes),
                  SizedBox(
                    width: gap,
                  ),
                  ServiceButton(context, buttonWidth, buttonHeight, data,
                      fontSize, 3, data[3].name, data[3].time_it_takes),
                  SizedBox(
                    width: gap,
                  ),
                  ServiceButton(context, buttonWidth, buttonHeight, data,
                      fontSize, 4, data[4].name, data[4].time_it_takes)
                ],
              ),
              SizedBox(
                height: gap,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ServiceButton(context, buttonWidth, buttonHeight, data,
                      fontSize, 5, data[5].name, data[5].time_it_takes),
                  SizedBox(
                    width: gap,
                  ),
                  ServiceButton(context, buttonWidth, buttonHeight, data,
                      fontSize, 6, data[6].name, data[6].time_it_takes),
                  SizedBox(
                    width: gap,
                  ),
                  ServiceButton(context, buttonWidth, buttonHeight, data,
                      fontSize, 7, data[7].name, data[7].time_it_takes),
                  SizedBox(
                    width: gap,
                  ),
                  ServiceButton(context, buttonWidth, buttonHeight, data,
                      fontSize, 8, data[8].name, data[8].time_it_takes),
                  SizedBox(
                    width: gap,
                  ),
                  ServiceButton(context, buttonWidth, buttonHeight, data,
                      fontSize, 9, data[9].name, data[9].time_it_takes)
                ],
              ),
              SizedBox(
                height: gap,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ServiceButton(context, buttonWidth, buttonHeight, data,
                      fontSize, 10, data[10].name, data[10].time_it_takes),
                  SizedBox(
                    width: gap,
                  ),
                  ServiceButton(context, buttonWidth, buttonHeight, data,
                      fontSize, 11, data[11].name, data[11].time_it_takes),
                  SizedBox(
                    width: gap,
                  ),
                  ServiceButton(context, buttonWidth, buttonHeight, data,
                      fontSize, 12, data[12].name, data[12].time_it_takes),
                  SizedBox(
                    width: gap,
                  ),
                  ServiceButton(context, buttonWidth, buttonHeight, data,
                      fontSize, 13, data[13].name, data[13].time_it_takes),
                  SizedBox(
                    width: gap,
                  ),
                  ServiceButton(context, buttonWidth, buttonHeight, data,
                      fontSize, 14, data[14].name, data[14].time_it_takes)
                ],
              ),
              SizedBox(
                height: gap,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ServiceButton(context, buttonWidth, buttonHeight, data,
                      fontSize, 15, data[15].name, data[15].time_it_takes),
                  SizedBox(
                    width: gap,
                  ),
                  ServiceButton(context, buttonWidth, buttonHeight, data,
                      fontSize, 16, data[16].name, data[16].time_it_takes),
                  SizedBox(
                    width: gap,
                  ),
                  ServiceButton(context, buttonWidth, buttonHeight, data,
                      fontSize, 17, data[17].name, data[17].time_it_takes),
                  SizedBox(
                    width: gap,
                  ),
                  ServiceButton(context, buttonWidth, buttonHeight, data,
                      fontSize, 18, data[18].name, data[18].time_it_takes),
                  SizedBox(
                    width: gap,
                  )
                ],
              )
            ],
          ),
        ));
  }

  GestureDetector ServiceButton(
      BuildContext context,
      double buttonWidth,
      double buttonHeight,
      List<Services> data,
      double fontSize,
      int index,
      String name,
      int minutes) {
    String time_decription = displayTimeItTakes(context, minutes);

    return GestureDetector(
      onTap: () {
        // DriverService
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailService(
                    index: index,
                    type_service: 'vehicle',
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
                flex: 7, // 80% of the space
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
                flex: 3, // 20% of the space
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

String displayTimeItTakes(BuildContext context, int minutes) {
  return AppLocalizations.of(context)!.localeName == "am"
      ? AppLocalizations.of(context)!.time_it_takes +
          " " +
          minutes.toString() +
          " " +
          AppLocalizations.of(context)!.minute
      : AppLocalizations.of(context)!.time_it_takes +
          " " +
          AppLocalizations.of(context)!.minute +
          " " +
          minutes.toString();
}
