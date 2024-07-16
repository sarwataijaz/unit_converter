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

  List<String> _massUnits = [
    'Kilogram',
    'Gram',
    'Milligram',
    'Pound'
  ];

  List<String> _pressureUnits = [
    'Standard Atmosphere',
    'Pascal',
    'Torr',
    'Pound Per Square Inch',
  ];

  List<String> _timeUnits = [
    'Hour',
    'Second',
    'Millisecond',
    'Microsecond',
    'Day',
    'Week'
  ];

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
    _selectedSubUnitValue2 = _currentList[1]; // Ensure this is valid for initial load
  }

  void _checkUnits(String value) {

    if (value == 'Mass') {
      setState(() {
        _currentList = _massUnits;
      });
    } else if(value == 'Time') {
      setState(() {
        _currentList = _timeUnits;
      });
    } else if(value == 'Pressure') {
      setState(() {
        _currentList = _pressureUnits;
      });
    } else if(value == 'Temperature') {
      setState(() {
        _currentList = _temperatureUnits;
      });
    } else {
      setState(() {
        _currentList = _lengthUnits;
      });
    }
    print("List: $_currentList");
    _selectedSubUnitValue1 = _currentList[0];
    print(_selectedSubUnitValue1);
    _selectedSubUnitValue2 = _currentList[1];
    print(_selectedSubUnitValue2);
  }

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
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: "U",
                          style: GoogleFonts.actor(
                              textStyle: TextStyle(
                                  color: Color(0xFFCC800E),
                                  fontSize: 28.sp,
                                  decoration: TextDecoration.underline),
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "nit  ",
                          style: GoogleFonts.actor(
                              textStyle: TextStyle(
                                color: Color(0xFFCC800E),
                                fontSize: 26.sp,
                              ),
                              fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: "C",
                          style: GoogleFonts.actor(
                              textStyle: TextStyle(
                                  color: Color(0xFFCC800E),
                                  fontSize: 28.sp,
                                  decoration: TextDecoration.underline),
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "onverter",
                          style: GoogleFonts.actor(
                              textStyle: TextStyle(
                                color: Color(0xFFCC800E),
                                fontSize: 26.sp,
                              ),
                              fontWeight: FontWeight.w700),
                        ),
                      ])),
                      Padding(
                        padding: EdgeInsets.only(left: 12.0.sp),
                        child: Image.asset(
                          'assets/iconsssss.png',
                          height: 10.h,
                          width: 10.w,
                        ),
                      ),
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
                          height: 19.h,
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
                              height: 18.h,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Color(0xFFFEFEFE)),
                              child: Column(
                                children: [
                                  TextField(
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                      fontSize: 20.sp,
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
                                                      textStyle:
                                                      TextStyle(fontSize: 20.sp),
                                                      fontWeight: FontWeight.bold))),
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
                            height: 19.h,
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
                                height: 18.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Color(0xFFFEFEFE)),
                                child: Column(
                                  children: [
                                    TextField(
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(
                                        fontSize: 20.sp,
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
                                                        textStyle:
                                                        TextStyle(fontSize: 20.sp),
                                                        fontWeight: FontWeight.bold))),
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
                            child: Text("calculate",
                                style: GoogleFonts.actor(
                                    textStyle: TextStyle(
                                        fontSize: 20.sp),
                                    fontWeight:
                                    FontWeight.bold,
                                  color: Colors.black
                                ),
                            ),
                            onPressed: () {},
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
}
