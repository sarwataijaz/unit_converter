import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Unit Converter',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  String _selectedUnitValue = 'Length';
  String _selectedSubUnitValue1 = 'Meter';
  String _selectedSubUnitValue2 = 'Centimeter';

  List<String> _allUnits = [
    'Length',
    'Time',
    'Mass',
    'Pressure',
    'Temperature'
  ];

  List<String> _lengthUnits = [
    'Meter',
    'Centimeter',
    'Millimeter',
    'Kilometer'
  ];

  List<String> _massUnits = ['Kilogram', 'Gram', 'Milligram', 'Pound'];

  List<String> _pressureUnits = [
    'Standard Atmosphere',
    'Pascal',
    'Torr',
    'Pound Per Square Inch',
  ];

  List<String> _timeUnits = ['Hour', 'Second', 'Millisecond', 'Day', 'Week'];

  List<String> _temperatureUnits = [
    'Degree Celsius',
    'Fahrenheit',
    'Kelvin',
  ];

  List<String> _currentList = [''];

  @override
  void initState() {
    super.initState();
    _currentList = _lengthUnits;
    _selectedUnitValue = 'Length';
    _selectedSubUnitValue1 = _currentList[0];
    _selectedSubUnitValue2 =
        _currentList[1]; // Ensure this is valid for initial load
  }

  void _checkUnits(String value) {
    setState(() {
      if (value == 'Mass') {
        _currentList = _massUnits;
      } else if (value == 'Time') {
        _currentList = _timeUnits;
      } else if (value == 'Pressure') {
        _currentList = _pressureUnits;
      } else if (value == 'Temperature') {
        _currentList = _temperatureUnits;
      } else {
        _currentList = _lengthUnits;
      }
      _controller1.text = '';
      _controller2.text = '';
    });

    print("List: $_currentList");
    _selectedSubUnitValue1 = _currentList[0];
    print(_selectedSubUnitValue1);
    _selectedSubUnitValue2 = _currentList[1];
    print(_selectedSubUnitValue2);
  }

  String recentlyTyped = '';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    print("Start: $_currentList");
    return Scaffold(
      backgroundColor: Color(0xFFFEDD9E),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: screenWidth,
          height: screenHeight,
          child: Padding(
            padding: EdgeInsets.only(top: 25.sp, left: 15.sp, right: 15.sp),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(),
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: "U",
                            style: GoogleFonts.shrikhand(
                                textStyle: TextStyle(
                                    color: Color(0xFFCC800E),
                                    fontSize: 28.sp,
                                    decoration: TextDecoration.underline),
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "nit  ",
                            style: GoogleFonts.shrikhand(
                                textStyle: TextStyle(
                                  color: Color(0xFFCC800E),
                                  fontSize: 26.sp,
                                ),
                                fontWeight: FontWeight.w700),
                          ),
                          TextSpan(
                            text: "C",
                            style: GoogleFonts.shrikhand(
                                textStyle: TextStyle(
                                    color: Color(0xFFCC800E),
                                    fontSize: 28.sp,
                                    decoration: TextDecoration.underline),
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "onverter",
                            style: GoogleFonts.shrikhand(
                                textStyle: TextStyle(
                                  color: Color(0xFFCC800E),
                                  fontSize: 26.sp,
                                ),
                                fontWeight: FontWeight.w700),
                          ),
                        ])),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(left: 12.0.sp),
                      //   child: Image.asset(
                      //     'assets/iconsssss.png',
                      //     height: 10.h,
                      //     width: 10.w,
                      //   ),
                      // ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 20.sp, left: 15.sp, right: 15.sp),
                    child: Container(
                      width: screenWidth,
                      height: 15.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8.0),
                          color: Color(0xFFFFF1D4)),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 20.sp,
                            bottom: 20.sp,
                            left: 20.sp,
                            right: 20.sp),
                        child: Container(
                          height: 10.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(15.0),
                              color: Color(0xFFFEFEFE)),
                          child: DropdownButton(
                            value: _selectedUnitValue,
                            elevation: 10,
                            style: TextStyle(color: Colors.black),
                            onChanged: (String? value) {
                              setState(() {
                                _selectedUnitValue = value!;
                                _checkUnits(_selectedUnitValue);
                              });
                            },
                            isExpanded: true,
                            padding: EdgeInsets.all(20.0.sp),
                            iconEnabledColor: Color(0xFFFFBC57),
                            iconSize: 35,
                            underline: Container(),
                            // Remove the underline
                            dropdownColor: Colors.white,
                            items: _allUnits.map((String value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Center(
                                    child: Text(value,
                                        style: GoogleFonts.actor(
                                            textStyle:
                                                TextStyle(fontSize: 20.sp),
                                            fontWeight: FontWeight.bold))),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 20.sp, left: 15.sp, right: 15.sp),
                    child: Column(
                      children: [
                        Container(
                          width: screenWidth,
                          height: 22.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8.0),
                              color: Color(0xFFFFF1D4)),
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 15.sp,
                                bottom: 15.sp,
                                left: 15.sp,
                                right: 15.sp),
                            child: Container(
                              height: 26.h,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Color(0xFFFEFEFE)),
                              child: Column(
                                children: [
                                  TextField(
                                    controller: _controller1,
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    style: GoogleFonts.actor(
                                      textStyle: TextStyle(
                                        fontSize: 25.sp,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: DropdownButton(
                                      value: _selectedSubUnitValue1,
                                      elevation: 10,
                                      style: TextStyle(color: Colors.black),
                                      onChanged: (String? value) {
                                        setState(() {
                                          _selectedSubUnitValue1 = value!;
                                          _controller2.text = '';
                                        });
                                      },
                                      isExpanded: true,
                                      padding: EdgeInsets.all(20.0.sp),
                                      iconEnabledColor: Color(0xFFFFBC57),
                                      iconSize: 35,
                                      underline: Container(),
                                      // Remove the underline
                                      dropdownColor: Colors.white,
                                      items: _currentList.map((String value) {
                                        print(_currentList);
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Center(
                                              child: Text(value,
                                                  style: GoogleFonts.actor(
                                                      textStyle: TextStyle(
                                                          fontSize: 20.sp),
                                                      fontWeight:
                                                          FontWeight.bold))),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.sp),
                          child: Container(
                            width: screenWidth,
                            height: 22.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(8.0),
                                color: Color(0xFFFFF1D4)),
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 15.sp,
                                  bottom: 15.sp,
                                  left: 15.sp,
                                  right: 15.sp),
                              child: Container(
                                height: 26.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Color(0xFFFEFEFE)),
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: _controller2,
                                      maxLines: 1,
                                      enabled: false,
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      style: GoogleFonts.actor(
                                        textStyle: TextStyle(
                                            fontSize: 25.sp, color: Colors.red),
                                      ),
                                    ),
                                    Expanded(
                                      child: DropdownButton(
                                        value: _selectedSubUnitValue2,
                                        elevation: 10,
                                        style: TextStyle(color: Colors.black),
                                        onChanged: (String? value) {
                                          setState(() {
                                            _selectedSubUnitValue2 = value!;
                                            _controller2.text = '';
                                          });
                                        },
                                        isExpanded: true,
                                        padding: EdgeInsets.all(20.0.sp),
                                        iconEnabledColor: Color(0xFFFFBC57),
                                        iconSize: 35,
                                        underline: Container(),
                                        // Remove the underline
                                        dropdownColor: Colors.white,
                                        items: _currentList.map((String value) {
                                          return DropdownMenuItem(
                                            value: value,
                                            child: Center(
                                                child: Text(value,
                                                    style: GoogleFonts.actor(
                                                        textStyle: TextStyle(
                                                            fontSize: 20.sp),
                                                        fontWeight:
                                                            FontWeight.bold))),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(25.0.sp),
                          child: ElevatedButton(
                            child: Text(
                              "calculate",
                              style: GoogleFonts.actor(
                                  textStyle: TextStyle(fontSize: 20.sp),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            onPressed: _calculate,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFFBC57),
                              fixedSize: Size(200, 50),
                              elevation: 12,
                              shape: BeveledRectangleBorder(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  void _calculate() {
    if (_selectedSubUnitValue1 == _selectedSubUnitValue2) {
      _showFlashError(context, 'Please select different units and try again.');
      return;
    }

    if (_controller1.text == '') {
      _showFlashError(context, 'Enter a value first.');
      return;
    }

    double finalAns = 0.0;
    double inputValue = double.parse(_controller1.text);

    // Length

    if (_selectedUnitValue == 'Length') {
      if (_selectedSubUnitValue1 == 'Meter') {
        switch (_selectedSubUnitValue2) {
          case 'Centimeter':
            finalAns = inputValue * 100;
            break;
          case 'Millimeter':
            finalAns = inputValue * 1000;
            break;
          case 'Kilometer':
            finalAns = inputValue / 1000;
            break;
        }
      } else if (_selectedSubUnitValue1 == 'Centimeter') {
        switch (_selectedSubUnitValue2) {
          case 'Meter':
            finalAns = inputValue / 100;
            break;
          case 'Millimeter':
            finalAns = inputValue * 10;
            break;
          case 'Kilometer':
            finalAns = inputValue / 100000;
            break;
        }
      } else if (_selectedSubUnitValue1 == 'Millimeter') {
        switch (_selectedSubUnitValue2) {
          case 'Meter':
            finalAns = inputValue / 1000;
            break;
          case 'Millimeter':
            finalAns = inputValue / 10;
            break;
          case 'Kilometer':
            finalAns = inputValue / 1000000;
            break;
        }
      } else {
        //kilometer
        switch (_selectedSubUnitValue2) {
          case 'Meter':
            finalAns = inputValue * 1000;
            break;
          case 'Millimeter':
            finalAns = inputValue * 1000000;
            break;
          case 'Centimeter':
            finalAns = inputValue * 100000;
            break;
        }
      }
    }

    // Time

    else if (_selectedUnitValue == 'Time') {
      if (_selectedSubUnitValue1 == 'Hour') {
        switch (_selectedSubUnitValue2) {
          case 'Second':
            finalAns = inputValue * 3600;
            break;
          case 'Millisecond':
            finalAns = inputValue * 3600000;
            break;
          case 'Day':
            finalAns = inputValue / 24;
            break;
          case 'Week':
            finalAns = inputValue / 168;
            break;
        }
      } else if (_selectedSubUnitValue1 == 'Second') {
        switch (_selectedSubUnitValue2) {
          case 'Hour':
            finalAns = inputValue / 3600;
            break;
          case 'Millisecond':
            finalAns = inputValue * 1000;
            break;
          case 'Day':
            finalAns = inputValue / 86400;
            break;
          case 'Week':
            finalAns = inputValue / 604800;
            break;
        }
      } else if (_selectedSubUnitValue1 == 'Millisecond') {
        switch (_selectedSubUnitValue2) {
          case 'Hour':
            finalAns = inputValue / 3600000;
            break;
          case 'Second':
            finalAns = inputValue / 1000;
            break;
          case 'Day':
            finalAns = inputValue / 864000000;
            break;
          case 'Week':
            finalAns = inputValue / 60480000000;
            break;
        }
      } else if (_selectedSubUnitValue1 == 'Day') {
        switch (_selectedSubUnitValue2) {
          case 'Hour':
            finalAns = inputValue * 24;
            break;
          case 'Second':
            finalAns = inputValue * 86400;
            break;
          case 'Millisecond':
            finalAns = inputValue * 864000000;
            break;
          case 'Week':
            finalAns = inputValue / 7;
            break;
        }
      } else if (_selectedSubUnitValue1 == 'Week') {
        switch (_selectedSubUnitValue2) {
          case 'Hour':
            finalAns = inputValue * 168;
            break;
          case 'Second':
            finalAns = inputValue * 604800;
            break;
          case 'Millisecond':
            finalAns = inputValue * 60480000000;
            break;
          case 'Day':
            finalAns = inputValue * 7;
            break;
        }
      }
    }

    // Mass
    else if (_selectedUnitValue == 'Mass') {
      if (_selectedSubUnitValue1 == 'Kilogram') {
        switch (_selectedSubUnitValue2) {
          case 'Gram':
            finalAns = inputValue * 1000;
            break;
          case 'Milligram':
            finalAns = inputValue * 1000000;
            break;
          case 'Pound':
            finalAns = inputValue * 2.205;
            break;
        }
      } else if (_selectedSubUnitValue1 == 'Gram') {
        switch (_selectedSubUnitValue2) {
          case 'Kilogram':
            finalAns = inputValue / 1000;
            break;
          case 'Milligram':
            finalAns = inputValue * 1000;
            break;
          case 'Pound':
            finalAns = inputValue / 453.6;
            break;
        }
      } else if (_selectedSubUnitValue1 == 'Milligram') {
        switch (_selectedSubUnitValue2) {
          case 'Kilogram':
            finalAns = inputValue / 1000000;
            break;
          case 'Gram':
            finalAns = inputValue / 1000;
            break;
          case 'Pound':
            finalAns = inputValue / 453600;
            break;
        }
      } else if (_selectedSubUnitValue1 == 'Pound') {
        switch (_selectedSubUnitValue2) {
          case 'Kilogram':
            finalAns = inputValue / 2.205;
            break;
          case 'Gram':
            finalAns = inputValue * 453.6;
            break;
          case 'Milligram':
            finalAns = inputValue * 453600;
            break;
        }
      }
    }

    // Pressure

    else if (_selectedUnitValue == 'Pressure') {
      if (_selectedSubUnitValue1 == 'Standard Atmosphere') {
        switch (_selectedSubUnitValue2) {
          case 'Pascal':
            finalAns = inputValue * 101300;
            break;
          case 'Torr':
            finalAns = inputValue * 760;
            break;
          case 'Pound Per Square Inch':
            finalAns = inputValue * 14.696;
            break;
        }
      } else if (_selectedSubUnitValue1 == 'Pascal') {
        switch (_selectedSubUnitValue2) {
          case 'Standard Atmosphere':
            finalAns = inputValue / 101300;
            break;
          case 'Torr':
            finalAns = inputValue / 133.3;
            break;
          case 'Pound Per Square Inch':
            finalAns = inputValue / 6895;
            break;
        }
      } else if (_selectedSubUnitValue1 == 'Torr') {
        switch (_selectedSubUnitValue2) {
          case 'Standard Atmosphere':
            finalAns = inputValue / 760;
            break;
          case 'Pascal':
            finalAns = inputValue * 133.3;
            break;
          case 'Pound Per Square Inch':
            finalAns = inputValue / 51.715;
            break;
        }
      } else if (_selectedSubUnitValue1 == 'Pound Per Square Inch') {
        switch (_selectedSubUnitValue2) {
          case 'Standard Atmosphere':
            finalAns = inputValue / 14.696;
            break;
          case 'Pascal':
            finalAns = inputValue * 6895;
            break;
          case 'Torr':
            finalAns = inputValue * 51.715;
            break;
        }
      }
    }

    // temperature
    else {
      if (_selectedSubUnitValue1 == 'Degree Celsius') {
        switch (_selectedSubUnitValue2) {
          case 'Fahrenheit':
            finalAns = (inputValue * (9/5)) + 32;
            break;
          case 'Kelvin':
            finalAns = inputValue + 273.15;
            break;
        }
      }

      else if (_selectedSubUnitValue1 == 'Fahrenheit') {
        switch (_selectedSubUnitValue2) {
          case 'Degree Celsius':
            finalAns = (inputValue - 32) * (5/9);
            break;
          case 'Kelvin':
            finalAns = (inputValue - 32) * (5/9) + 273.15;
            break;
        }
      }

      else if (_selectedSubUnitValue1 == 'Kelvin') {
        switch (_selectedSubUnitValue2) {
          case 'Degree Celsius':
            finalAns = inputValue - 273.15;
            break;
          case 'Fahrenheit':
            finalAns = (inputValue - 273.15) * (9/5) + 32;
            break;
        }
      }
    }

    if (finalAns == finalAns.truncate()) {
      int intAns = finalAns.toInt();
      setState(() {
        _controller2.text = intAns.toString();
      });
    } else {
      setState(() {
        _controller2.text = finalAns.toString();
      });
    }
  }

  void _showFlashError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Text(message, style: TextStyle(color: Colors.red, fontSize: 18.sp)),
        backgroundColor: Color(0xFFFFF1D4),
      ),
    );
  }
}
