import 'package:budge/screens/inventory.dart';
import 'package:budge/screens/saving_challenges.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const inventory = '/inventory';
  static const saving_challenges = '/challenges';

  static Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder>{
      AppRoutes.inventory: (context) => InventoryPage(),
      AppRoutes.saving_challenges: (context) => SavingChallengesPage(),
    };
  }
}
