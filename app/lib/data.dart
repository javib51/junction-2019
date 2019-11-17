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
  Map<String, dynamic> kmarket = new Map();

  static final DataStore instance = new DataStore._internal();

  factory DataStore() {
    return instance;
  }

  DataStore._internal();

  Future<void> getInventory() async {
    List<String> res = await getEcommerces();
    Map<String, dynamic> kmarket = await getKmarket();
//    instance.kmarket = kmarket;
    if (kmarket.isNotEmpty) {
      instance.kmarket = Map();
      var temp = kmarket['results']
          .map((e) {
            var title = e['labelName']['english'];
            try {
              instance.kmarket[title] = e['pictureUrls']?.first['original'];
            } catch (e) {}
            return title;
          })
          .toList()
          .sublist(0, 4);
      instance.inventory = res..addAll(new List<String>.from(temp));
    } else {
      instance.inventory = res;
    }
  }

  Future<List<String>> getEcommerces() async {
    var url = Uri.http('ecommerces-node.azurewebsites.net', 'products');

    http.Response resp = await http.get(url, headers: {});
    if (resp.statusCode == 200) {
      print('got Ecommerces');
      return new List<String>.from(json.decode(resp.body));
    } else {
      print('fucking error');
      return List();
    }
  }

  Future<Map<String, dynamic>> getKmarket() async {
    var url = Uri.https('kesko.azure-api.net', 'v1/search/products');

    KmarketReq req = new KmarketReq(query: "kvinoa", view: View(limit: 3));
    String body = kmarketReqToJson(req);

    http.Response resp = await http.post(url, body: body, headers: {
      "Ocp-Apim-Subscription-Key": "443059e5b2f84aee8ec883edacdfeea5",
    });

    if (resp.statusCode == 200) {
      print('got kmarket');
      return json.decode(resp.body);
    } else {
      print('fucking error');
      return Map<String, dynamic>();
    }
  }
}

KmarketReq kmarketReqFromJson(String str) =>
    KmarketReq.fromJson(json.decode(str));

String kmarketReqToJson(KmarketReq data) => json.encode(data.toJson());

class KmarketReq {
  String query;
  View view;

  KmarketReq({
    this.query,
    this.view,
  });

  factory KmarketReq.fromJson(Map<String, dynamic> json) => KmarketReq(
        query: json["query"],
        view: View.fromJson(json["view"]),
      );

  Map<String, dynamic> toJson() => {
        "query": query,
        "view": view.toJson(),
      };
}

class View {
  int limit;

  View({
    this.limit,
  });

  factory View.fromJson(Map<String, dynamic> json) => View(
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "limit": limit,
      };
}
