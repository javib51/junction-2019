import 'dart:ffi';
import 'dart:math';

import 'package:budge/data.dart';
import 'package:budge/utils.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../app_routes.dart';
import 'package:random_string/random_string.dart';

import 'inventory_item.dart';
import 'inventory_item2.dart';
import 'inventory_item3.dart';

class InventoryPage extends StatefulWidget {
  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  var something = "";

  @override
  void initState() {
    super.initState();
    print("Inventory Page");
    DataStore.instance.getInventory().then((t) {
      setState(() {
        something += ".";
      });
    });
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: getSizeWidth(context, 4.7),
          right: getSizeWidth(context, 4.7),
          top: getSizeHeight(context, 1.2)),
      child: new DecoratedBox(
        decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
            boxShadow: [
              new BoxShadow(
                  color: Colors.black54,
//                  offset: new Offset(1.0, 2.0),
                  blurRadius: 1.0)
            ]),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 17),
              //width: 40,
              child: Icon(Icons.search, color: Colors.grey),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                padding: EdgeInsets.only(left: 17),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
//                    hintText: 'Try "Drone"',
                  ),
                  onTap: () {
//                    showSearch(
//                      context: context,
//                      delegate: ItemSearchDelegate(),
//                    );
                  },
                  autofocus: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  double _getPercentage(String e) {
    switch(e) {
      case "eletronicos":
        return 0.85;
      case "utilidades_domesticas":
        return 0.8;
      case "brinquedos":
        return 0.60;
      case "consoles_games":
        return 0.95;
      case "relogios_presentes":
        return 0.20;
      default:
        return 0.3;
    }
  }

  String _getTitle(String e) {
    switch(e) {
      case "eletronicos":
        return "Canon 80d";
      case "utilidades_domesticas":
        return "Roomba 605";
      case "brinquedos":
        return "Catan";
      case "consoles_games":
        return "Battlefield V";
      case "relogios_presentes":
        return "Rolex Submariner";
      default:
        return e;
    }
  }

  String _getCat1(String e) {
    switch(e) {
      case "eletronicos":
        return "Electronics";
      case "utilidades_domesticas":
        return "Domestic";
      case "brinquedos":
        return "Games";
      case "consoles_games":
        return "Games";
      case "relogios_presentes":
        return "Watch";
      default:
        return "Food";
    }
  }

  String _getCat2(String e) {
    switch(e) {
      case "eletronicos":
        return "Durable";
      case "utilidades_domesticas":
        return "Durable";
      case "brinquedos":
        return "Durable";
      case "consoles_games":
        return "Durable";
      case "relogios_presentes":
        return "Durable";
      default:
        return "No Durable";
    }
  }

  String getImage(String e) {
    switch(e) {
      case "eletronicos":
        return "https://static.bhphoto.com/images/images2500x2500/1455749513_1225875.jpg";
      case "utilidades_domesticas":
        return "https://images-na.ssl-images-amazon.com/images/I/61K7QbCPtyL._SX355_.jpg";
      case "brinquedos":
        return "https://images-na.ssl-images-amazon.com/images/I/81G3u55HEHL._SX466_.jpg";
      case "consoles_games":
        return "https://images-na.ssl-images-amazon.com/images/I/81GOvlbRtmL._SL1500_.jpg";
      case "relogios_presentes":
        return "https://cdn2.chrono24.com/images/uhren/images_97/s6/12467697_xxl_v1569241825636.jpg";
      default:
        return DataStore.instance.kmarket[e];
    }
//    return;
  }

  Widget _buildItem(BuildContext context, String title) {
    return GestureDetector(
      // WE NEED TO SEND ARGUMENTS TO THE NEXT SCREEN (NAME OF ITEM)
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InventoryItemPage(title),
          ),
        );
      },
//      onTap: () {
//        Navigator.pushNamed(context, AppRoutes.inventory_item);
//      },
      child: Container(
        //      height: getSizeHeight(context, 11.9),
        child: new DecoratedBox(
          decoration: new BoxDecoration(color: Color(0xffe8e8e8),
              //          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
              boxShadow: [
                new BoxShadow(
                    color: Colors.black54,
                    //                  offset: new Offset(1.0, 2.0),
                    blurRadius: 2.0)
              ]),
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: getSizeHeight(context, 2),
                horizontal: getSizeWidth(context, 6.1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProfileAvatar(
                  getImage(title),
//                  'https://firebasestorage.googleapis.com/v0/b/trukatu-dev-1.appspot.com/o/blank-profile-picture-973460_640.png?alt=media&token=026ca169-fa4f-4871-9a30-954f9b4222a8',
                  radius: 34,
                  backgroundColor: Colors.transparent,
                  borderWidth: 1,
                  initialsText: Text(
                    'ITEM',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: "Avenir",
                    ),
                  ),
                  borderColor: Colors.transparent,
                  elevation: 2.0,
                  cacheImage: true,
                ),
                SizedBox(
                  width: getSizeWidth(context, 5),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      _getTitle(title),
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Avenir",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: getSizeHeight(context, 1.3),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5.0),
                      child: new LinearPercentIndicator(
                        width: getSizeWidth(context, 59.3),
                        animation: true,
                        lineHeight: 20.0,
                        animationDuration: 2200,
                        percent: _getPercentage(title),
                        //                    linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Color(0xe82f3f9e),
                      ),
                    ),
                    SizedBox(
                      height: getSizeHeight(context, 1.3),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: getSizeHeight(context, 4.5),
                          width: getSizeHeight(context, 4.5),
                          child: new FloatingActionButton(
                            heroTag: randomString(10),
                            onPressed: () {
//                              Navigator.pushNamed(
//                                  context, AppRoutes.inventory_item3);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InventoryItemPage3(title),
                                ),
                              );
                            },
                            // todo: Send same arguments as above to next screen
                            child: new Icon(
                              Icons.clear,
                              color: Colors.white,
                              size: 25.0,
                            ),
                            shape: new CircleBorder(),
                            elevation: 2.0,
                            backgroundColor: Color(0xff676971),
                            //                      padding: const EdgeInsets.all(15.0),
                          ),
                        ),
                        SizedBox(
                          width: getSizeWidth(context, 2),
                        ),
                        Container(
                          height: getSizeHeight(context, 4.5),
                          width: getSizeHeight(context, 4.5),
                          child: new FloatingActionButton(
                            heroTag: randomString(10),
                            onPressed: () {
//                              Navigator.pushNamed(
//                                  context, AppRoutes.inventory_item2);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InventoryItemPage2(title),
                                ),
                              );
                            },
                            // todo: Send same arguments as above to next screen
                            child: new Icon(
                              Icons.cached,
                              color: Colors.white,
                              size: 25.0,
                            ),
                            shape: new CircleBorder(),
                            elevation: 2.0,
                            backgroundColor: Color(0xff676971),
                            //                      padding: const EdgeInsets.all(15.0),
                          ),
                        ),
                        SizedBox(
                          width: getSizeWidth(context, 10.5),
                        ),
                        Container(
                          color: Color(0xfff2e5a1),
                          padding: EdgeInsets.all(5),
                          child: Text(
                            _getCat2(title),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Avenir",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: getSizeWidth(context, 1),
                        ),
                        Container(
                          color: Color(0xfff2bfa1),
                          padding: EdgeInsets.all(5),
                          child: Text(
                            _getCat1(title),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Avenir",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildItems(BuildContext context) {
    return DataStore.instance.inventory.isEmpty
        ? []
        : DataStore.instance.inventory
            .map((e) => _buildItem(context, e))
            .toList();
  }

  Widget _buildBody(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildSearchBar(context),
        SizedBox(
          height: getSizeHeight(context, 4.1),
        ),
        ..._buildItems(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff141a46),
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text(
            "Your inventory",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        body: _buildBody(context),
      ),
    );
  }
}
