

import 'package:flutter/material.dart';

class SidebarProvider with ChangeNotifier{

  String _currentPage = '';

  String get currentPage => _currentPage;

  void setCurrentPageUrl(String routeName)async{
    _currentPage = routeName;
    await Future.delayed(const Duration(milliseconds: 100));
    notifyListeners();
  }

  static late AnimationController sidebarController;
  static bool isMenuOpen = false;

  static Animation<double>movement = Tween<double>(begin: -200, end: 0).animate(
    CurvedAnimation(parent: sidebarController, curve: Curves.easeInOut)
  );

  static Animation<double>opacity = Tween<double>(begin: 0, end: 1).animate(
    CurvedAnimation(parent: sidebarController, curve: Curves.easeInOut)
  );

  static void openMenu(){
    isMenuOpen = true;
    sidebarController.forward();
  }

  static void closeMenu(){
    isMenuOpen = false;
    sidebarController.reverse();
  }

  static void toggleMenu(){
    isMenuOpen = !isMenuOpen;
    isMenuOpen
      ? sidebarController.reverse()
      : sidebarController.forward();
  }
  
}