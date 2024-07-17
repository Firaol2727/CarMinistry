import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:road_ministry/pages/feedback/Feedback.dart';
import 'package:road_ministry/pages/officeFinder/OfficeFinder.dart';
import 'package:road_ministry/pages/services/SelectMainService.dart';
import 'package:road_ministry/shared/CustomAppBar.dart';
import 'package:road_ministry/pages/compliment/Compliment.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final buttonWidth = size.width * 0.4; // 40% of the screen width
    final buttonHeight = size.height * 0.3; // 10% of the screen height
    final verticalGap = size.height * 0.1; // 10% of the screen height
    final horizontalGap = size.height * 0.08; // 10% of the screen height
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0), // Set the desired height here
          child: customAppBar(context, false)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButton(
                    context,
                    SelectMainService(),
                    AppLocalizations.of(context)!.services,
                    AppLocalizations.of(context)!.service_description,
                    buttonWidth,
                    buttonHeight),
                SizedBox(width: horizontalGap), // Space between buttons
                buildButton(
                    context,
                    Officefinder(),
                    AppLocalizations.of(context)!.direction,
                    AppLocalizations.of(context)!.direction_description,
                    buttonWidth,
                    buttonHeight),
              ],
            ),
            SizedBox(height: horizontalGap), // Space between rows
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButton(
                  context,
                  ComplimentForm(),
                  AppLocalizations.of(context)!.comment,
                  AppLocalizations.of(context)!.comment_description,
                  buttonWidth,
                  buttonHeight,
                ),
                SizedBox(width: horizontalGap), // Space between buttons
                buildButton(
                    context,
                    FeedBackForm(),
                    AppLocalizations.of(context)!.rate,
                    AppLocalizations.of(context)!.rate_description,
                    buttonWidth,
                    buttonHeight),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context, Widget NextPage, String title,
      String description, double width, double height) {
    final size = MediaQuery.of(context).size;
    final gapVertical = size.width * 0.1;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NextPage),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 4),
              Center(
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white70,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
