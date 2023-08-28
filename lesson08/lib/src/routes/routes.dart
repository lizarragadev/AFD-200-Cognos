import 'package:flutter/material.dart';
import 'package:lesson08/src/screens/bottom_sheet_screen.dart';
import 'package:lesson08/src/screens/checkbox_radio_screen.dart';
import 'package:lesson08/src/screens/expansion_panel_screen.dart';
import 'package:lesson08/src/screens/home_screen.dart';
import 'package:lesson08/src/screens/pickers_dialog_screen.dart';
import 'package:lesson08/src/screens/slider_switch_screen.dart';
import 'package:lesson08/src/screens/textfields_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (context) => const HomeScreen(),
    '/bottomSheet': (context) => const BottomSheetScreen(),
    '/checkRadio': (context) => const CheckboxRadioScreen(),
    '/expansionPanel': (context) => const ExpansionPanelScreen(),
    '/pickers': (context) => const PickersDialogScreen(),
    '/sliderSwitch': (context) => const SliderSwitchScreen(),
    '/textFields': (context) => const TextfieldsScreen(),
  };
}