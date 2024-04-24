import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:smartbid/controller/initpage.dart';
import 'package:smartbid/controller/managstate.dart';

List<SingleChildWidget> providers=[
  ChangeNotifierProvider(
      create: (_)=> InitPage()),
  ChangeNotifierProvider(create: (_)=> ManagState()),
];