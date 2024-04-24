import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartbid/controller/initpage.dart';

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return
    Consumer<InitPage>(builder: (context, state, child){
      state.run();
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }
}
