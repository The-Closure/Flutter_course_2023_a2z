import 'package:flutter/material.dart';

class ThemeProvier extends ChangeNotifier {

  ThemeData theme = ThemeData.dark();
  

  void changeTheme(){
    final bool isDark = theme == ThemeData.dark();
    if (isDark){
      theme = ThemeData.light();
      print(theme.toString() + ' ello');
    }
    else {
      theme = ThemeData.dark();
      print(theme.toString()+ '======');
    }
    notifyListeners();
  }

}