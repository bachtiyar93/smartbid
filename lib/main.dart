import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smartbid/controller/providers.dart';
import 'package:smartbid/routes.dart';
import 'package:smartbid/ui/base.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'SmartBid',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.mulishTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Main.base,
        routes: ({
          Main.base:(_)=> const Base(),
        }),
      ),
    );
  }
}