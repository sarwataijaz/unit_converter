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
  String _selectedLengthValue = 'Meter';

  List<String> _allUnits = ['Length', 'Area', 'Mass', 'Pressure'];
  List<String> _lengthUnits = [
    'Meter',
    'Centimeter',
    'Millimeter',
    'Kilometer'
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
                          height: 18.h,
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
                                      value: _selectedLengthValue,
                                      elevation: 10,
                                      style: TextStyle(color: Colors.black),
                                      onChanged: (String? value) {
                                        setState(() {
                                          _selectedLengthValue = value!;
                                        });
                                      },
                                      isExpanded: true,
                                      padding: EdgeInsets.all(20.0.sp),
                                      iconEnabledColor: Color(0xFFFFBC57),
                                      iconSize: 35,
                                      underline: Container(),
                                      // Remove the underline
                                      dropdownColor: Colors.white,
                                      items: _lengthUnits.map((String value) {
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(value,
                                                  style: GoogleFonts.actor(
                                                      textStyle: TextStyle(
                                                          fontSize: 18.sp),
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
                            height: 18.h,
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
                                        value: _selectedLengthValue,
                                        elevation: 10,
                                        style: TextStyle(color: Colors.black),
                                        onChanged: (String? value) {
                                          setState(() {
                                            _selectedLengthValue = value!;
                                          });
                                        },
                                        isExpanded: true,
                                        padding: EdgeInsets.all(20.0.sp),
                                        iconEnabledColor: Color(0xFFFFBC57),
                                        iconSize: 35,
                                        underline: Container(),
                                        // Remove the underline
                                        dropdownColor: Colors.white,
                                        items: _lengthUnits.map((String value) {
                                          return DropdownMenuItem(
                                            value: value,
                                            child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(value,
                                                    style: GoogleFonts.actor(
                                                        textStyle: TextStyle(
                                                            fontSize: 18.sp),
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
                            child: Text("calculate",
                                style: GoogleFonts.actor(
                                    textStyle: TextStyle(
                                        fontSize: 18.sp),
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
