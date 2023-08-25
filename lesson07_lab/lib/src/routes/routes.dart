import 'package:flutter/material.dart';
import 'package:lesson07_lab/src/screens/bottom_nav_bar_screen.dart';
import 'package:lesson07_lab/src/screens/data_tables_screen.dart';
import 'package:lesson07_lab/src/screens/drawers_screen.dart';
import 'package:lesson07_lab/src/screens/home_screen.dart';
import 'package:lesson07_lab/src/screens/listview_listtiles_screen.dart';
import 'package:lesson07_lab/src/screens/selectable_text_screen.dart';
import 'package:lesson07_lab/src/screens/stack_screen.dart';
import 'package:lesson07_lab/src/screens/tab_bars_screen.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    "/": (context) => HomeScreen(),
    "/bottomNav": (context) => const BottomNavBarScreen(),
    "/dataTable": (context) => DataTablesScreen(),
    "/drawers": (context) => const DrawersScreen(),
    "/listView": (context) => const ListviewListtilesScreen(),
    "/selectableText": (context) => const SelectableTextScreen(),
    "/stack": (context) => const StackScreen(),
    "/tabs": (context) => const TabBarsScreen(),
  };
}
