import 'package:budge/utils.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:budge/widgets/strategy_button.dart';

class StrategySettings extends StatefulWidget {
  @override
  State<StrategySettings> createState() => _StrategySettings();
}

class _StrategySettings extends State<StrategySettings> {
  @override
  void initState() {
    super.initState();
    print("Strategy Page");
  }

  int _radioValue1 = -1;
  int _radioValue2 = -1;
  int _radioValue3 = -1;
  int _radioValue4 = -1;
  int _radioValue5 = -1;

  void _handleRadioValueChange(int id, bool value) {
    print(id);
    print(bool);
//    setState(() {
//      _radioValue1 = value;
//
//      switch (_radioValue1) {
//        case 0:
//          print(0);
//          break;
//        case 1:
//          print(1);
//          break;
//        case 2:
//          print(2);
//          break;
//      }
//    });
  }

  Widget _buildText(BuildContext context) {
    return Container(
      alignment: Alignment(0, 0),
      padding: EdgeInsets.only(
          left: getSizeWidth(context, 4.7),
          right: getSizeWidth(context, 4.7),
          top: getSizeHeight(context, 4.2)),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                style: TextStyle(
                  color: Color(0xde000000),
                  fontWeight: FontWeight.w500,
                  fontFamily: "Avenir",
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                ),
                text:
                "What are you willing to do to \n live by your set values?"),
          ])),
    );
  }

//  Widget _buildValue(BuildContext context) {
//    return Container(
//      child: Column(children: <Widget>[
//        Container(
//          alignment: Alignment(0, 0),
//          padding: EdgeInsets.only(
//              left: getSizeWidth(context, 28),
//              right: getSizeWidth(context, 28)),
//          child: new Container(
//              decoration: new BoxDecoration(
//                border: new Border.all(
//                    color: Color(0xff979797),
//                    width: 1.0,
//                    style: BorderStyle.solid),
//              ),
//              child: new Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    new Container(
//                      padding: EdgeInsets.only(
//                          left: getSizeWidth(context, 14),
//                          right: getSizeWidth(context, 14)),
//                      child: new Image.asset(
//                        "./assets/images/green-earth.png",
//                        fit: BoxFit.scaleDown,
//                      ),
//                    ),
//                    SizedBox(
//                      height: getSizeHeight(context, 1),
//                    ),
//                    Text(
//                      "Sustainability",
//                      textAlign: TextAlign.center,
//                      style: const TextStyle(
//                          color: Colors.black,
//                          fontWeight: FontWeight.w500,
//                          fontFamily: "Avenir",
//                          fontStyle: FontStyle.normal,
//                          fontSize: 18.0),
//                    ),
//                    new Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Column(
//                          children: <Widget>[
//                            new Radio(
//                              value: 0,
//                              groupValue: _radioValue1,
//                              onChanged: _handleRadioValueChange1,
//                            ),
//                            new Text(
//                              "1",
//                              textAlign: TextAlign.center,
//                              style: const TextStyle(
//                                  color: Colors.black,
//                                  fontWeight: FontWeight.w500,
//                                  fontFamily: "Avenir",
//                                  fontStyle: FontStyle.normal,
//                                  fontSize: 15.0),
//                            ),
//                          ],
//                        ),
//                        Column(
//                          children: <Widget>[
//                            new Radio(
//                              value: 1,
//                              groupValue: _radioValue1,
//                              onChanged: _handleRadioValueChange1,
//                            ),
//                            new Text(
//                              "2",
//                              textAlign: TextAlign.center,
//                              style: const TextStyle(
//                                  color: Colors.black,
//                                  fontWeight: FontWeight.w500,
//                                  fontFamily: "Avenir",
//                                  fontStyle: FontStyle.normal,
//                                  fontSize: 15.0),
//                            ),
//                          ],
//                        ),
//                        Column(
//                          children: <Widget>[
//                            new Radio(
//                              value: 2,
//                              groupValue: _radioValue1,
//                              onChanged: _handleRadioValueChange1,
//                            ),
//                            new Text(
//                              "3",
//                              textAlign: TextAlign.center,
//                              style: const TextStyle(
//                                  color: Colors.black,
//                                  fontWeight: FontWeight.w500,
//                                  fontFamily: "Avenir",
//                                  fontStyle: FontStyle.normal,
//                                  fontSize: 15.0),
//                            ),
//                          ],
//                        )
//                      ],
//                    ),
//                  ])),
//        ),
//        SizedBox(
//          height: getSizeHeight(context, 1),
//        ),
//        Container(
//          alignment: Alignment(0, 0),
//          padding: EdgeInsets.only(
//              left: getSizeWidth(context, 28),
//              right: getSizeWidth(context, 28)),
//          child: new Container(
//              decoration: new BoxDecoration(
//                border: new Border.all(
//                    color: Color(0xff979797),
//                    width: 1.0,
//                    style: BorderStyle.solid),
//              ),
//              child: new Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    new Container(
//                      padding: EdgeInsets.only(
//                          left: getSizeWidth(context, 14),
//                          right: getSizeWidth(context, 14)),
//                      child: new Image.asset(
//                        "./assets/images/heart.png",
//                        fit: BoxFit.scaleDown,
//                      ),
//                    ),
//                    SizedBox(
//                      height: getSizeHeight(context, 1),
//                    ),
//                    Text(
//                      "Personal Health",
//                      textAlign: TextAlign.center,
//                      style: const TextStyle(
//                          color: Colors.black,
//                          fontWeight: FontWeight.w500,
//                          fontFamily: "Avenir",
//                          fontStyle: FontStyle.normal,
//                          fontSize: 18.0),
//                    ),
//                    new Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Column(
//                          children: <Widget>[
//                            new Radio(
//                              value: 0,
//                              groupValue: _radioValue2,
//                              onChanged: _handleRadioValueChange2,
//                            ),
//                            new Text(
//                              "1",
//                              textAlign: TextAlign.center,
//                              style: const TextStyle(
//                                  color: Colors.black,
//                                  fontWeight: FontWeight.w500,
//                                  fontFamily: "Avenir",
//                                  fontStyle: FontStyle.normal,
//                                  fontSize: 15.0),
//                            ),
//                          ],
//                        ),
//                        Column(
//                          children: <Widget>[
//                            new Radio(
//                              value: 1,
//                              groupValue: _radioValue2,
//                              onChanged: _handleRadioValueChange2,
//                            ),
//                            new Text(
//                              "2",
//                              textAlign: TextAlign.center,
//                              style: const TextStyle(
//                                  color: Colors.black,
//                                  fontWeight: FontWeight.w500,
//                                  fontFamily: "Avenir",
//                                  fontStyle: FontStyle.normal,
//                                  fontSize: 15.0),
//                            ),
//                          ],
//                        ),
//                        Column(
//                          children: <Widget>[
//                            new Radio(
//                              value: 2,
//                              groupValue: _radioValue2,
//                              onChanged: _handleRadioValueChange2,
//                            ),
//                            new Text(
//                              "3",
//                              textAlign: TextAlign.center,
//                              style: const TextStyle(
//                                  color: Colors.black,
//                                  fontWeight: FontWeight.w500,
//                                  fontFamily: "Avenir",
//                                  fontStyle: FontStyle.normal,
//                                  fontSize: 15.0),
//                            ),
//                          ],
//                        )
//                      ],
//                    ),
//                  ])),
//        ),
//        SizedBox(
//          height: getSizeHeight(context, 1),
//        ),
//        Container(
//          alignment: Alignment(0, 0),
//          padding: EdgeInsets.only(
//              left: getSizeWidth(context, 28),
//              right: getSizeWidth(context, 28)),
//          child: new Container(
//              decoration: new BoxDecoration(
//                border: new Border.all(
//                    color: Color(0xff979797),
//                    width: 1.0,
//                    style: BorderStyle.solid),
//              ),
//              child: new Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    new Container(
//                      padding: EdgeInsets.only(
//                          left: getSizeWidth(context, 14),
//                          right: getSizeWidth(context, 14)),
//                      child: new Image.asset(
//                        "./assets/images/piggy-bank.png",
//                        fit: BoxFit.scaleDown,
//                      ),
//                    ),
//                    SizedBox(
//                      height: getSizeHeight(context, 1),
//                    ),
//                    Text(
//                      "Savings",
//                      textAlign: TextAlign.center,
//                      style: const TextStyle(
//                          color: Colors.black,
//                          fontWeight: FontWeight.w500,
//                          fontFamily: "Avenir",
//                          fontStyle: FontStyle.normal,
//                          fontSize: 18.0),
//                    ),
//                    new Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Column(
//                          children: <Widget>[
//                            new Radio(
//                              value: 0,
//                              groupValue: _radioValue3,
//                              onChanged: _handleRadioValueChange3,
//                            ),
//                            new Text(
//                              "1",
//                              textAlign: TextAlign.center,
//                              style: const TextStyle(
//                                  color: Colors.black,
//                                  fontWeight: FontWeight.w500,
//                                  fontFamily: "Avenir",
//                                  fontStyle: FontStyle.normal,
//                                  fontSize: 15.0),
//                            ),
//                          ],
//                        ),
//                        Column(
//                          children: <Widget>[
//                            new Radio(
//                              value: 1,
//                              groupValue: _radioValue3,
//                              onChanged: _handleRadioValueChange3,
//                            ),
//                            new Text(
//                              "2",
//                              textAlign: TextAlign.center,
//                              style: const TextStyle(
//                                  color: Colors.black,
//                                  fontWeight: FontWeight.w500,
//                                  fontFamily: "Avenir",
//                                  fontStyle: FontStyle.normal,
//                                  fontSize: 15.0),
//                            ),
//                          ],
//                        ),
//                        Column(
//                          children: <Widget>[
//                            new Radio(
//                              value: 2,
//                              groupValue: _radioValue3,
//                              onChanged: _handleRadioValueChange3,
//                            ),
//                            new Text(
//                              "3",
//                              textAlign: TextAlign.center,
//                              style: const TextStyle(
//                                  color: Colors.black,
//                                  fontWeight: FontWeight.w500,
//                                  fontFamily: "Avenir",
//                                  fontStyle: FontStyle.normal,
//                                  fontSize: 15.0),
//                            ),
//                          ],
//                        )
//                      ],
//                    ),
//                  ])),
//        ),
//        SizedBox(
//          height: getSizeHeight(context, 4),
//        ),
//        Container(
//          height: getSizeHeight(context, 5.6),
//          width: getSizeWidth(context, 20),
//          child: RaisedButton(
//            child: Text(
//              "Next",
//              style: TextStyle(
//                fontSize: 18,
//                fontFamily: "Avenir",
//                fontWeight: FontWeight.w400,
//                color: Colors.white,
//              ),
//            ),
//            color: Color(0xff2f3f9e),
//            onPressed: () {},
//          ),
//        ),
//      ]),
//    );
//  }

//  List<Widget> _buildValues(BuildContext context) {
//    return [
//      _buildValue(context, "Winter Coat"),
//    ];
//  }

  Widget _buildMethods(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: getSizeHeight(context, 2),
          right: getSizeHeight(context, 5),
          left: getSizeHeight(context, 5)),
      child: Column(children: <Widget>[
        PaymentMethodButton(
          title: "Switch products/brands",
          //iconPath: "assets/images/payment_cash.png",
          isDisabled: false,
          initState: false,
        ),
        Padding(padding: EdgeInsets.only(top: getSizeWidth(context, 2))),
//        PaymentMethodButton(
//          title: "Paypal",
//          iconPath: "assets/images/payment_cash.png",
//          isDisabled: true,
//          initState: false,
//        ),
//        Padding(padding: EdgeInsets.only(top: verticalDistance(context, 38))),
//        AddPaymentButton(),
      ]),
    );
  }

  Widget _buildMethods1(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: getSizeHeight(context, 2),
          right: getSizeHeight(context, 5),
          left: getSizeHeight(context, 5)),
      child: Column(children: <Widget>[
        PaymentMethodButton(
          title: "Resell or rent out items",
          //iconPath: "assets/images/payment_cash.png",
          isDisabled: false,
          initState: false,
        ),
        Padding(padding: EdgeInsets.only(top: getSizeWidth(context, 2))),
//        PaymentMethodButton(
//          title: "Paypal",
//          iconPath: "assets/images/payment_cash.png",
//          isDisabled: true,
//          initState: false,
//        ),
//        Padding(padding: EdgeInsets.only(top: verticalDistance(context, 38))),
//        AddPaymentButton(),
      ]),
    );
  }

  Widget _buildMethods2(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: getSizeHeight(context, 2),
          right: getSizeHeight(context, 5),
          left: getSizeHeight(context, 5)),
      child: Column(children: <Widget>[
        PaymentMethodButton(
          title: "Make investments",
          //iconPath: "assets/images/payment_cash.png",
          isDisabled: false,
          initState: false,
        ),
        Padding(padding: EdgeInsets.only(top: getSizeWidth(context, 2))),
//        PaymentMethodButton(
//          title: "Paypal",
//          iconPath: "assets/images/payment_cash.png",
//          isDisabled: true,
//          initState: false,
//        ),
//        Padding(padding: EdgeInsets.only(top: verticalDistance(context, 38))),
//        AddPaymentButton(),
      ]),
    );
  }
  Widget _buildMethods3(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: getSizeHeight(context, 2),
          right: getSizeHeight(context, 5),
          left: getSizeHeight(context, 5)),
      child: Column(children: <Widget>[
        PaymentMethodButton(
          title: "Autosave towards your \n savings goals",
          //iconPath: "assets/images/payment_cash.png",
          isDisabled: false,
          initState: false,
        ),
        Padding(padding: EdgeInsets.only(top: getSizeWidth(context, 2))),
//        PaymentMethodButton(
//          title: "Paypal",
//          iconPath: "assets/images/payment_cash.png",
//          isDisabled: true,
//          initState: false,
//        ),
//        Padding(padding: EdgeInsets.only(top: verticalDistance(context, 38))),
//        AddPaymentButton(),
      ]),
    );
  }
  Widget _buildMethods4(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: getSizeHeight(context, 2),
          right: getSizeHeight(context, 5),
          left: getSizeHeight(context, 5)),
      child: Column(children: <Widget>[
        PaymentMethodButton(
          title: "Cut out the extra",
          //iconPath: "assets/images/payment_cash.png",
          isDisabled: false,
          initState: false,
        ),
        Padding(padding: EdgeInsets.only(top: getSizeWidth(context, 2))),

        SizedBox(
          height: getSizeHeight(context, 4),
        ),
        Container(
          height: getSizeHeight(context, 5.6),
          width: getSizeWidth(context, 20),
          child: RaisedButton(
            child: Text(
              "NEXT",
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
//        PaymentMethodButton(
//          title: "Paypal",
//          iconPath: "assets/images/payment_cash.png",
//          isDisabled: true,
//          initState: false,
//        ),
//        Padding(padding: EdgeInsets.only(top: verticalDistance(context, 38))),
//        AddPaymentButton(),
      ]),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildText(context),
        SizedBox(
          height: getSizeHeight(context, 4.1),
        ),
        _buildMethods(context),
        _buildMethods1(context),
        _buildMethods2(context),
        _buildMethods3(context),
        _buildMethods4(context),
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
            "Set Your Strategy",
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontFamily: "Avenir",
                fontStyle: FontStyle.normal,
                fontSize: 20.0),
          ),
        ),
        body: _buildBody(context),
      ),
    );
  }
}