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

//background-image: linear-gradient( 94.3deg,  rgba(26,33,64,1) 10.9%, rgba(81,84,115,1) 87.1% );
Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.1, 0.9],
                colors: [
                  Color.fromRGBO(100, 130, 159, 100),
                  Color.fromRGBO(103, 56, 96, 100),
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
