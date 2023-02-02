
import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState>navigatorKey = GlobalKey<NavigatorState>();

  static pushNamed(String name) => navigatorKey.currentState!.pushNamed(name);

  static pushReplacementNamed(String name) => navigatorKey.currentState!.pushReplacementNamed(name);
}