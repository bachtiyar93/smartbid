import 'package:apphelper/apphelpers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smartbid/controller/providers.dart';
import 'package:smartbid/routes.dart';
import 'package:smartbid/ui/base.dart';
import 'package:smartbid/ui/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        navigatorKey: AppHelpers.navigation.navigatorKey,
        scaffoldMessengerKey: AppHelpers.navigation.messengerKey,
        initialRoute: Main.base,
        routes: ({
          Main.base:(_)=> const Base(),
          Main.home:(_)=> const Home(),
        }),
      ),
    );
  }
}