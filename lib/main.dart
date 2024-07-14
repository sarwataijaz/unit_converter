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
  String _selectedValue = 'Length';

  List<String> _allUnits = ['Length', 'Area', 'Mass', 'Pressure'];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFFEDD9E),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: Padding(
          padding: EdgeInsets.only(
              top: 30.sp, bottom: 30.sp, left: 15.sp, right: 15.sp),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "U",
                    style: GoogleFonts.abyssinicaSil(
                        textStyle: TextStyle(
                            color: Color(0xFFCC800E),
                            fontSize: 28.sp,
                            decoration: TextDecoration.underline),
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "nit ",
                    style: GoogleFonts.abyssinicaSil(
                        textStyle: TextStyle(
                          color: Color(0xFFCC800E),
                          fontSize: 26.sp,
                        ),
                        fontStyle: FontStyle.italic),
                  ),
                  TextSpan(
                    text: "C",
                    style: GoogleFonts.abyssinicaSil(
                        textStyle: TextStyle(
                            color: Color(0xFFCC800E),
                            fontSize: 28.sp,
                            decoration: TextDecoration.underline),
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "onverter",
                    style: GoogleFonts.abyssinicaSil(
                        textStyle: TextStyle(
                          color: Color(0xFFCC800E),
                          fontSize: 26.sp,
                        ),
                        fontStyle: FontStyle.italic),
                  ),
                ])),
                Padding(
                  padding: EdgeInsets.only(left: 10.0.sp),
                  child: Image.asset(
                    'assets/iconsssss.png',
                    height: 12.h,
                    width: 12.w,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 30.sp, bottom: 30.sp, left: 15.sp, right: 15.sp),
              child: Container(
                width: screenWidth,
                height: 13.h,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8.0),
                    color: Color(0xFFFFF1D4)),
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 15.sp, bottom: 15.sp, left: 15.sp, right: 15.sp),
                child: Container(
                  height: 10.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color(0xFFFEFEFE)),
                    child: DropdownButton(
                      value: _selectedValue,
                      elevation: 10,
                      style: TextStyle(color: Colors.black),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedValue = value!;
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
                                    textStyle: TextStyle(fontSize: 20.sp),
                                    fontWeight: FontWeight.bold
                                  ))),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),

          ]),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
