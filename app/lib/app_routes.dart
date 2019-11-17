import 'package:budge/screens/dashboard.dart';
import 'package:budge/screens/inventory.dart';
import 'package:budge/screens/saving_challenges.dart';
import 'package:budge/screens/start_challenge.dart';
import 'package:budge/screens/strategy_settings.dart';
import 'package:budge/screens/value_settings.dart';
import 'package:budge/screens/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:budge/screens/inventory_item.dart';
import 'package:budge/screens/inventory_item2.dart';
import 'package:budge/screens/inventory_item3.dart';

class AppRoutes {
  static const inventory = '/inventory';
  static const inventory_item = '/inventory/item';
  static const inventory_item2 = '/inventory/item2';
  static const inventory_item3 = '/inventory/item3';
  static const saving_challenges = '/challenges';
  static const start_challenge = '/challenge/start';
  static const value_settings = '/values';
  static const strategy_settings = '/strategy';
  static const wish_list = '/wishlist';
  static const dashboard = '/dashboard';

  static Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder>{
      AppRoutes.inventory: (context) => InventoryPage(),
      AppRoutes.saving_challenges: (context) => SavingChallengesPage(),
      AppRoutes.start_challenge: (context) => StartChallengesPage(),
      AppRoutes.value_settings: (context) => ValueSettings(),
      AppRoutes.strategy_settings: (context) => StrategySettings(),
      AppRoutes.wish_list: (context) => WishListPage(),
      AppRoutes.dashboard: (context) => DashboardPage(),
      AppRoutes.inventory_item: (context) => InventoryItemPage(),
      AppRoutes.inventory_item2: (context) => InventoryItemPage2(),
      AppRoutes.inventory_item3: (context) => InventoryItemPage3(),
    };
  }
}
