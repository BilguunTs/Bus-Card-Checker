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

class MySvgBG extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '<svg viewBox="0.0 0.0 375.0 812.0" ><defs><linearGradient id="gradient" x1="1.0" y1="-0.006568" x2="0.0" y2="1.0"><stop offset="0.0" stop-color="#0088cbff" stop-opacity="0.0" /><stop offset="1.0" stop-color="#fffbe497"  /></linearGradient></defs><path  d="M 0 0 L 375 0 L 375 812 L 0 812 L 0 0 Z" fill="url(#gradient)" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
      allowDrawingOutsideViewBox: true,
    );
  }
}

class WithSvgBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: <Widget>[
      Positioned(
          child: Container(
            alignment: Alignment.center,
            child: MySvgBG(),
            color: Colors.white70,
            padding: const EdgeInsets.all(0),
          ),
          top: 0),
      NFCButton()
    ]);
  }
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Hi");
  }
}

Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (BuildContext context) {
        return WithSvgBackground();
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
