import 'dart:convert';

import 'package:http/http.dart' as http;

class DataStore {
 // your variables
  int sus_value = -1;
  int he_value = -1;
  int sav_value = -1;

  bool swi_stra = false;
  bool resell_stra = false;
  bool invest_stra = false;
  bool auto_stra = false;
  bool cut_stra = false;

  List<String> inventory = List();
  static final DataStore instance = new DataStore._internal();

  factory DataStore() {
    return instance;
  }

  DataStore._internal();

  Future<void> getInventory() async {
      var url = Uri.http('ecommerces-node.azurewebsites.net', 'products');

      http.Response resp = await http.get(url, headers: {
      });

      if (resp.statusCode == 200) {
        instance.inventory=new List<String>.from(json.decode(resp.body));
        print('got inventory');
      } else {
        print('fucking error');
      }
  }
}