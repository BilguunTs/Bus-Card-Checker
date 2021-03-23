import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:BusCardChecker/pages/request_service_flow.dart';
import 'package:BusCardChecker/utils/constants.dart';
import 'package:BusCardChecker/pages/home.dart';
import 'package:BusCardChecker/Logo.dart';
import 'package:BusCardChecker/NFCButton.dart';
import 'package:flutter_svg/flutter_svg.dart';

/**
this section will be part of the main widget 
trying to add background and will shift into smth
testing the new comment section would be suffice
testing the new comment section would be insuffice
 */
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      allowFontScaling: false,
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Constants.primaryColor,
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.openSansTextTheme(),
        ),
        initialRoute: "/",
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }
}

Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.1, 0.5, 0.7, 0.9],
                colors: [
                  Colors.orange,
                  Colors.orange.shade100,
                  Colors.orange.shade200,
                  Colors.orange.shade400,
                ],
              ),
            ),
            child: NFCButton());
        //return Home();
      });
    case "/repair-flow":
      return MaterialPageRoute(builder: (BuildContext context) {
        return RequestServiceFlow();
      });
    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        return Home();
      });
  }
}
