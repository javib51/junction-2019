import 'package:budge/screens/inventory.dart';
import 'package:budge/screens/saving_challenges.dart';
import 'package:budge/screens/start_challenge.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const inventory = '/inventory';
  static const saving_challenges = '/challenges';
  static const start_challenge = '/challenge/start';

  static Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder>{
      AppRoutes.inventory: (context) => InventoryPage(),
      AppRoutes.saving_challenges: (context) => SavingChallengesPage(),
      AppRoutes.start_challenge: (context) => StartChallengesPage(),
    };
  }
}
