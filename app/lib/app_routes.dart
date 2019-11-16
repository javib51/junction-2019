import 'package:budge/screens/inventory.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const inventory = '/inventory';

  static Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder>{
      AppRoutes.inventory: (context) => InventoryPage(),
    };
  }
}
