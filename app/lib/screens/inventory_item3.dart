import 'package:budge/widgets/app_bar_item_form.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../data.dart';
import '../utils.dart';

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

class InventoryItemPage3 extends StatefulWidget {
  final String title;
  InventoryItemPage3(this.title);
  @override
  State<InventoryItemPage3> createState() => _InventoryItemPage3State();
}

class _InventoryItemPage3State extends State<InventoryItemPage3> {
  @override
  void initState() {
    super.initState();
  }

  Widget _buildTags(BuildContext context) {
    return Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: getSizeWidth(context, 4.1),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xfff2e5a1)),
                  color: Color(0xfff2e5a1),
                ),
                width: getSizeWidth(context, 22),
                padding: EdgeInsets.all(5),
                child: Text(
                  "Durable",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xfff2e5a1)),
                  color: Color(0xfff2e5a1),
                ),
                width: getSizeWidth(context, 22),
                padding: EdgeInsets.all(5),
                child: Text(
                  _getCat1(widget.title),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xfff2e5a1)),
                  color: Color(0xfff2e5a1),
                ),
                width: getSizeWidth(context, 22),
                padding: EdgeInsets.all(5),
                child: Text(
                  "Old",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                width: getSizeWidth(context, 4.1),
              ),
            ]));
  }

  Widget _buildItem(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            CircularProfileAvatar(
              getImage(widget.title),
              //'https://firebasestorage.googleapis.com/v0/b/trukatu-dev-1.appspot.com/o/blank-profile-picture-973460_640.png?alt=media&token=026ca169-fa4f-4871-9a30-954f9b4222a8',
              radius: 60,
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
              height: getSizeHeight(context, 1.6),
            ),
            Text(
              _getTitle(widget.title),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 19,
                fontFamily: "Avenir",
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ));
  }

  Widget _buildLifeSpan(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                left: getSizeWidth(context, 2.8),
                right: getSizeWidth(context, 2.8)),
            child: LinearPercentIndicator(
              linearStrokeCap: LinearStrokeCap.butt,
              animation: true,
              lineHeight: getSizeHeight(context, 1.9),
              animationDuration: 1000,
              percent: 0.8,
//                    linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Color(0xe82f3f9e),
            ),
          ),
          Container(
              alignment: Alignment(0.0, 0.0),
              height: getSizeHeight(context, 7),
              width: getSizeWidth(context, 89.5),
//              margin: EdgeInsets.only(
//                  left: getSizeWidth(context, 5.3),
//                  right: getSizeWidth(context, 5.3)),
              decoration: new BoxDecoration(
                border: new BorderDirectional(
                  start: new BorderSide(
                      color: Color(0xff979797),
                      width: 2.0,
                      style: BorderStyle.solid),
                  end: new BorderSide(
                      color: Color(0xff979797),
                      width: 2.0,
                      style: BorderStyle.solid),
                ),
              ),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        style: TextStyle(
                          color: Color(0xff2f3f9e),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Avenir",
                          fontStyle: FontStyle.italic,
                          fontSize: 12,
                        ),
                        text: "Average Lifespan ~ 2 years"),
                  ]))),
          Row(
            children: <Widget>[
              SizedBox(
                width: getSizeWidth(context, 4.5),
              ),
              Container(
                height: 8,
                width: 8,
//              margin: EdgeInsets.only(
//                  left: getSizeWidth(context, 5.3),
//                  right: getSizeWidth(context, 5.3)),
                decoration: BoxDecoration(
                  color: Color(0xff979797),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              SizedBox(
                width: getSizeWidth(context, 87),
              ),
              Container(
                height: 8,
                width: 8,
//              margin: EdgeInsets.only(
//                  left: getSizeWidth(context, 5.3),
//                  right: getSizeWidth(context, 5.3)),
                decoration: BoxDecoration(
                  color: Color(0xff979797),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: getSizeWidth(context, 1),
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        style: TextStyle(
                          color: Color(0xde000000),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Avenir",
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                        ),
                        text: "Bought on"),
                  ])),
              SizedBox(
                width: getSizeWidth(context, 50),
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        style: TextStyle(
                          color: Color(0xde000000),
                          fontWeight: FontWeight.w500,
                          fontFamily: "Avenir",
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                        ),
                        text: "Should last till"),
                  ])),
              SizedBox(
                width: getSizeWidth(context, 1),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: getSizeWidth(context, 2),
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        style: TextStyle(
                          color: Color(0xde000000),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Avenir",
                          fontStyle: FontStyle.italic,
                          fontSize: 12,
                        ),
                        text: "10th September 2018"),
                  ])),
              SizedBox(
                width: getSizeWidth(context, 34),
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        style: TextStyle(
                          color: Color(0xde000000),
                          fontWeight: FontWeight.w500,
                          fontFamily: "Avenir",
                          fontStyle: FontStyle.italic,
                          fontSize: 12,
                        ),
                        text: "10th Septmber 2019"),
                  ])),
              SizedBox(
                width: getSizeWidth(context, 2),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildButtoms(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
          Container(
              alignment: Alignment(0, 0),
              padding: EdgeInsets.only(
                  left: getSizeWidth(context, 10),
                  right: getSizeWidth(context, 10)),
              child: new Container(
                width: getSizeWidth(context, 70),
                height: getSizeHeight(context, 32),
                decoration: new BoxDecoration(
                  border: new Border.all(
                      color: Color(0xff979797),
                      width: 1.0,
                      style: BorderStyle.solid),
                  borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: getSizeHeight(context, 3),
                    ),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                              style: TextStyle(
                                color: Color(0xde000000),
                                fontWeight: FontWeight.w500,
                                fontFamily: "Avenir",
                                fontStyle: FontStyle.italic,
                                fontSize: 13,
                              ),
                              text: "I don't own this anymore"),
                        ])),
                    SizedBox(
                      height: getSizeHeight(context, 3),
                    ),
                    Container(
                      height: getSizeHeight(context, 5.6),
                      width: getSizeWidth(context, 42),
                      child: RaisedButton(
                        child: Text(
                          "THREW IT AWAY",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Avenir",
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        color: Color(0xff2f3f9e),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      height: getSizeHeight(context, 2),
                    ),
                    Container(
                      height: getSizeHeight(context, 5.6),
                      width: getSizeWidth(context, 25),
                      child: RaisedButton(
                        child: Text(
                          "SOLD IT",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Avenir",
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        color: Color(0xff2f3f9e),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      height: getSizeHeight(context, 2),
                    ),
                    Container(
                      height: getSizeHeight(context, 5.6),
                      width: getSizeWidth(context, 35),
                      child: RaisedButton(
                        child: Text(
                          "GAVE AWAY",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Avenir",
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        color: Color(0xff2f3f9e),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              )
          )
        ]));
//    child: new Column(
//    mainAxisAlignment: MainAxisAlignment.center,
//    children: <Widget>[])
  }

  Widget _buildBody(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: getSizeHeight(context, 3.1),
        ),
        _buildTags(context),
        SizedBox(
          height: getSizeHeight(context, 5.1),
        ),
        _buildItem(context),
        SizedBox(
          height: getSizeHeight(context, 5.2),
        ),
        _buildLifeSpan(context),
        SizedBox(
          height: getSizeHeight(context, 5),
        ),
        _buildButtoms(context)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        appBar: AppBarItemForm(
            onTapBack: () {
              Navigator.of(context).pop(true);
            },
            title: "Inventory Item"),
        body: _buildBody(context),
      ),
    );
  }

}
Widget _buildTags(BuildContext context) {
  return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: getSizeWidth(context, 4.1),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xfff2e5a1)),
                color: Color(0xfff2e5a1),
              ),
              width: getSizeWidth(context, 22),
              padding: EdgeInsets.all(5),
              child: Text(
                "Durable",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xfff2e5a1)),
                color: Color(0xfff2e5a1),
              ),
              width: getSizeWidth(context, 22),
              padding: EdgeInsets.all(5),
              child: Text(
                "ItemCategory",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xfff2e5a1)),
                color: Color(0xfff2e5a1),
              ),
              width: getSizeWidth(context, 22),
              padding: EdgeInsets.all(5),
              child: Text(
                "Old",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              width: getSizeWidth(context, 4.1),
            ),
          ]));
}
