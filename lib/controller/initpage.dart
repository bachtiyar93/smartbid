import 'dart:developer';

import 'package:apphelper/apphelpers.dart';
import 'package:flutter/material.dart';
import 'package:smartbid/routes.dart';

class InitPage extends ChangeNotifier{
  void run()=> WidgetsBinding.instance.addPostFrameCallback((_){
  AppHelpers.navigation.openPageNamedNoNav(Main.home);
  });

}