import 'package:flutter/material.dart';
import 'package:road_ministry/constants/Services.dart';
import 'package:road_ministry/shared/CustomAppBar.dart';

class Officefinder extends StatelessWidget {
  List<String> data = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    ""
  ];
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

                children: data.map((String requirement) {
                  return Officers(
                      Container(), "requirementWidth", "requirementHeight",
                      OfficeNumber: "2");
                }).toList(),
              ),
            ),
          ),
        ));
  }

  Widget Officers(Widget image, String name, String position,
      {String OfficeNumber = ""}) {
    return Container(
      width: 280,
      height: 300,
      decoration: BoxDecoration(color: Colors.green),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 280,
            height: 200,
            decoration: BoxDecoration(color: Colors.red),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "Users Full Name",
              style: TextStyle(
                fontSize: 14,
              ),
              maxLines: null, // Allow unlimited lines
              overflow: TextOverflow
                  .visible, // Allow text to overflow and wrap to the next line
            ),
          ),
          Text(
            "Office NO",
            style: TextStyle(
              fontSize: 12,
            ),
            maxLines: null, // Allow unlimited lines
            overflow: TextOverflow
                .visible, // Allow text to overflow and wrap to the next line
          )
        ],
      ),
    );
  }
}
