import 'package:examapp/screen/detail/detail_screen.dart';
import 'package:examapp/screen/home/home_screen.dart';
import 'package:flutter/material.dart';

import 'screen/adddata/adddata_screen.dart';
Map<String,WidgetBuilder> app_routes ={
  '/':(context) => const HomeScreen(),
  'detail':(context) => const DetailScreen(),
  'add':(context) => const AddScreen(),

};