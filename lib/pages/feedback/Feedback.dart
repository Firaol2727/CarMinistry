import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:road_ministry/constants/Employees.dart';
import 'package:road_ministry/pages/LanguageSelector.dart';
import 'package:road_ministry/shared/CustomAppBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;

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
  Future<void> _submitForm() async {
    // Prepare data to be sent
    if (_formKey.currentState!.validate() && selectedOffice != null) {
      int employee_id = findEmployeeIdByAmharicName(selectedOffice!);
      print("id" + employee_id.toString());
      Map<String, String> data = {
        'CustomerService': selectedValues["CustomerService"].toString(),
        'StandardService': selectedValues["StandardService"].toString(),
        'FairService': selectedValues["FairService"].toString(),
        'ResponseForCompliment':
            selectedValues["ResponseForCompliment"].toString(),
        'ServiceRate': selectedValues["ServiceRate"].toString(),
        'employee_id': employee_id.toString(),
        'name': _fullNameController.text,
        'phone': _phoneController.text
      };
      print(data);
      // Send data to server

      try {
        final response = await http.post(
          Uri.parse('http://192.168.1.200:2000/feedback'),
          body: data,
        );
        if (response.statusCode == 200) {
          // Handle successful submission
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Container(
                    color: Colors.blue,
                    child: Text(
                      AppLocalizations.of(context)!.form_sumbitted,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ))),
          );
          await Future.delayed(Duration(seconds: 2));
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => LanguageSelector()));
        } else {
          // Handle error
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.blue,
              content: Text(
                AppLocalizations.of(context)!.form_sumbitted,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          );
          await Future.delayed(Duration(seconds: 2));
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => LanguageSelector()));
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.blue,
            content: Text(
              AppLocalizations.of(context)!.form_sumbitted,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        );
        await Future.delayed(Duration(seconds: 2));
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => LanguageSelector()));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.blue,
          content: Text(
            'Please Add All the Required Fields !',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
  }

  List<Employee> offices = EmployeesRated;

  String getOfficeAndName(Employee employee) {
    if (AppLocalizations.of(context)!.localeName == "am") {
      return employee.amharic_name +
          " - " +
          AppLocalizations.of(context)!.office +
          " " +
          employee.office;
    } else {
      return employee.oromic_name +
          " - " +
          AppLocalizations.of(context)!.office +
          " " +
          employee.office;
    }
  }

  int findEmployeeIdByAmharicName(String amharicName) {
    for (var employee in offices) {
      if (employee.amharic_name == amharicName) {
        return employee.id;
      }
    }
    return -1; // Return -1 if the employee is not found
  }

  final _formKey = GlobalKey<FormState>();
  // Form fields controllers
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final formWidth = size.width * 0.7; // 40% of the screen width
    print("Employees Length " + offices.length.toString());
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0), // Set the desired height here
          child: customAppBar(context, false)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                    Text(
                      AppLocalizations.of(context)!.select_an_office,
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(width: 16),
                    DropdownButton<String>(
                      hint: Text(''),
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
                          child: Container(
                            height: 110,
                            padding: EdgeInsets.fromLTRB(2, 5, 5, 2),
                            child: Row(
                              children: [
                                Image.asset(
                                  office.path != ""
                                      ? 'assets/employee/' + office.path
                                      : 'assets/icons/profile_holder.jpg',
                                  width: 50,
                                  height: 70,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(width: 6),
                                Text(getOfficeAndName(office)),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: formWidth,
                  child: TextFormField(
                    controller: _fullNameController,
                    decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.name),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your full name' : null,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: formWidth,
                  child: TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.phone_number),
                    validator: (value) => value!.isEmpty
                        ? 'Please enter your phone number'
                        : null,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: formWidth,
                  child: Table(
                    border: TableBorder.all(width: 0),
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
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                        AppLocalizations.of(context)!
                                                    .localeName ==
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
                                    AppLocalizations.of(context)!.localeName ==
                                            "am"
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
                                    activeColor: Color.fromRGBO(11, 73, 118, 1),
                                    groupValue: selectedValues[standard.value],
                                    onChanged: (int? value) {
                                      setState(() {
                                        selectedValues[standard.value] = value;
                                      });
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
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    child: ElevatedButton(
                      onPressed: () {
                        _submitForm();
                      },
                      child: Text(AppLocalizations.of(context)!.submit),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(250, 45),
                        foregroundColor: Colors.white,
                        backgroundColor: Color.fromRGBO(11, 73, 118, 1),
                      ),
                    ),
                  ),
                )
              ],
            ),
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
