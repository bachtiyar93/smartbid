import 'package:apphelper/apphelpers.dart';
import 'package:flutter/material.dart';
import 'package:smartbid/routes.dart';

class InitPage extends ChangeNotifier{
  void run() {
    return WidgetsBinding.instance.addPostFrameCallback((_)=> AppHelpers.navigation.openPage(Main.home));
  }

}