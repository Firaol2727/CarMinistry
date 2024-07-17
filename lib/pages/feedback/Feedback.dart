import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:road_ministry/constants/Employees.dart';
import 'package:road_ministry/shared/CustomAppBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FeedBackForm extends StatefulWidget {
  @override
  _FeedBackFormState createState() => _FeedBackFormState();
}

class _FeedBackFormState extends State<FeedBackForm> {
  Map<String, int?> selectedValues = {
    'CustomerService': null,
    'StandardService': null,
    'FairService': null,
    'ResponseForCompliment': null,
    'ServiceRate': null,
  };

  List<Standard> standards = [
    Standard('CustomerService', 'አገልግሎት ሰጪ ባለሙያ የተገልጋይ አቀባበል ሁኔታ',
        'Haala simannaa maamiltootaa dhiyeessaa tajaajilaa'),
    Standard('StandardService', 'በስታንዳርዱ  መሠረት አገልግሎት ስለማግኘትዎ',
        "Akkaataa istaandaardiitiin tajaajila argachuu"),
    Standard('FairService', 'ፍትሃዊ አገልግሎት ስለማግኘትዎ',
        "Tajaajila haqa qabeessa argachuu"),
    Standard('ResponseForCompliment', 'ለቅሬታዎ ግልጽና ፈጣን ምላሽ ስለመሰጠቱ',
        "Deebii ifaafi ariifataa komii keessaniif kennamu ilaalchisee"),
    Standard('ServiceRate', 'አጠቃላይ የሚሰጠውን አገልግሎት እንዴት ይመዝኑታል',
        "Tajaajila waliigalaa akkamitti madaaltu?"),
  ];

  List<Rating> ratings = [
    Rating('Excellent', 'እጅግ በጣም ጥሩ', "Baay'ee bayyeessaa"),
    Rating('VeryGood', 'በጣም ጥሩ', "Baay'ee gaarii"),
    Rating('Good', 'ጥሩ', 'Gaarii'),
    Rating('Bad', 'ዝቅተኛ', "Gadi bu'aa")
  ];

  String? selectedOffice;
  List<Employee> offices = Employees;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0), // Set the desired height here
          child: customAppBar(context, false)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Text(
                AppLocalizations.of(context)!.service_rate_title,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Service Office: '),
                  SizedBox(width: 16),
                  DropdownButton<String>(
                    hint: Text('Select an office'),
                    focusColor: Colors.green[50],
                    padding: EdgeInsets.fromLTRB(4, 0, 2, 0),
                    value: selectedOffice,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedOffice = newValue;
                      });
                    },
                    items: offices.map((Employee office) {
                      return DropdownMenuItem<String>(
                        value: office.amharic_name,
                        child: Text(office.amharic_name +
                            " - "
                                "Office " +
                            " " +
                            "1" +
                            office.office),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Table(
                border: TableBorder.all(width: 0),
                columnWidths: {
                  0: FixedColumnWidth(
                      300.0), // First column with a fixed width of 200.0
                  1: FixedColumnWidth(
                      120.0), // Second column with a fixed width of 100.0
                  2: FixedColumnWidth(120.0),
                  3: FixedColumnWidth(120.0),
                  4: FixedColumnWidth(120.0),
                },
                children: [
                  TableRow(
                    children: [
                      TableCell(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                            AppLocalizations.of(context)!.localeName == "am"
                                ? Evaluation.amharic_name
                                : Evaluation.oromic_name),
                      )),
                      ...ratings
                          .map((Rating rating) => TableCell(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    AppLocalizations.of(context)!.localeName ==
                                            "am"
                                        ? rating.amharic_name
                                        : rating.oromic_name),
                              )))
                          .toList(),
                    ],
                  ),
                  ...standards.map((standard) {
                    return TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                AppLocalizations.of(context)!.localeName == "am"
                                    ? standard.amharic_name
                                    : standard.oromic_name),
                          ),
                        ),
                        ...ratings.asMap().entries.map((entry) {
                          int index = entry.key;
                          // String rating = entry.value.value;
                          return TableCell(
                            child: Center(
                              child: Radio<int>(
                                value: index,
                                focusColor: Colors.blue[50],
                                groupValue: selectedValues[standard.value],
                                onChanged: (int? value) {
                                  setState(() {
                                    selectedValues[standard.value] = value;
                                  });

                                  print(selectedValues);
                                },
                              ),
                            ),
                          );
                        }).toList(),
                      ],
                    );
                  }).toList(),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(AppLocalizations.of(context)!.submit),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(250, 45),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Standard {
  String value;
  String amharic_name;
  String oromic_name;

  Standard(this.value, this.amharic_name, this.oromic_name);
}

class Rating {
  String value;
  String amharic_name;
  String oromic_name;
  Rating(this.value, this.amharic_name, this.oromic_name);
}

class Evaluation {
  static String amharic_name = "የግምገማ ነጥብ ደረጃ";
  static String oromic_name = "Sadarkaa Qabxii Madaallii";
}
