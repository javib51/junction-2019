import 'package:budge/utils.dart';
import 'package:budge/utils/functions.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class WishListPage extends StatefulWidget {
  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  @override
  void initState() {
    super.initState();
  }

  Widget _buildNewChallenge(BuildContext context, String title, String asset) {
    return Container(
//      height: getSizeHeight(context, 16.9),
      width: getSizeWidth(context, 80.1),
      child: new DecoratedBox(
        decoration: new BoxDecoration(
          color: Color(0xffe8e8e8),
          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
          boxShadow: [
            new BoxShadow(
                color: Colors.black54,
//                  offset: new Offset(1.0, 2.0),
                blurRadius: 1.0)
          ],
        ),
        child: Container(
          padding: EdgeInsets.only(
            top: getSizeHeight(context, 2.2),
            bottom: getSizeHeight(context, 2.2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: getSizeWidth(context, 4),
                  right: getSizeWidth(context, 2.2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: getSizeWidth(context, 17),
                      width: getSizeWidth(context, 17),
                      child: new DecoratedBox(
                        decoration: new BoxDecoration(
                          borderRadius:
                          new BorderRadius.all(new Radius.circular(10.0)),
                        ),
                        child: asset == null
                            ? Container(
                          child: Icon(Icons.error),
                        )
                            : Image.asset(asset, fit: BoxFit.contain),
                      ),
                    ),
                    SizedBox(
                      width: getSizeWidth(context, 4),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Avenir",
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: getSizeHeight(context, 1),
                        ),
                        Container(
//                          height: getSizeHeight(context, 5.6),
                          width: getSizeWidth(context, 50),
                          child: RaisedButton(
                            child: Text(
                              "SAVE UPTO €200",
                              style: TextStyle(
                                fontSize: 14,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChallenge(BuildContext context, String title, double actualMoney,
      double totalMoney, String asset) {
    return Container(
//      height: getSizeHeight(context, 16.9),
      width: getSizeWidth(context, 80.1),
      child: new DecoratedBox(
        decoration: new BoxDecoration(
          color: Color(0xffe8e8e8),
          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
          boxShadow: [
            new BoxShadow(
                color: Colors.black54,
//                  offset: new Offset(1.0, 2.0),
                blurRadius: 1.0)
          ],
        ),
        child: Container(
          padding: EdgeInsets.only(
            top: getSizeHeight(context, 2.2),
            bottom: getSizeHeight(context, 2.2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: getSizeWidth(context, 4),
                  right: getSizeWidth(context, 2.2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: getSizeWidth(context, 17),
                      width: getSizeWidth(context, 17),
                      child: new DecoratedBox(
                        decoration: new BoxDecoration(
                          borderRadius:
                          new BorderRadius.all(new Radius.circular(10.0)),
                        ),
                        child: asset == null
                            ? Container(
                          child: Icon(Icons.error),
                        )
                            : Image.asset(asset, fit: BoxFit.contain),
                      ),
                    ),
                    SizedBox(
                      width: getSizeWidth(context, 4),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Avenir",
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: getSizeHeight(context, 0.8),
                        ),
                        Text(
                          "€$actualMoney",
                          style: TextStyle(
                            color: Color(0xff2f3f9e),
                            fontSize: 16,
                            fontFamily: "Avenir",
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: getSizeHeight(context, 1),
                        ),
                        Text(
                          "out of €$totalMoney needed",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontFamily: "Avenir",
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: getSizeHeight(context, 1),),
              Padding(
                padding: EdgeInsets.only(
                  left: getSizeWidth(context, 4),
                  right: getSizeWidth(context, 2.2),
                ),
                child: new LinearPercentIndicator(
                  width: getSizeWidth(context, 69.3),
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2200,
                  percent: actualMoney/totalMoney,
//                    linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Color(0xe82f3f9e),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWishList(BuildContext context) {
    return Container(
//      height: getSizeHeight(context, 16.9),
      width: getSizeWidth(context, 99.1),
      child: new DecoratedBox(
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
          boxShadow: [new BoxShadow(color: Colors.black54, blurRadius: 1.0)],
        ),
        child: Container(
          padding: EdgeInsets.only(
            top: getSizeHeight(context, 2.2),
            bottom: getSizeHeight(context, 2.2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Challenges to complete to get your Smartwatch",
                style: TextStyle(
                  color: Color(0xff2f3f9e),
                  fontSize: 18,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getSizeHeight(context, 3),
              ),
              _buildChallenge(context, "Save on Starbucks purchases", 35, 100,
                  "./assets/images/piggy-bank.png"),
              SizedBox(
                height: getSizeHeight(context, 1),
              ),
              Icon(
                Icons.add,
                color: Color(0xff2f3f9e),
              ),
              SizedBox(
                height: getSizeHeight(context, 1),
              ),
              _buildChallenge(context, "Resell from your inventory", 100, 500,
                  "./assets/images/green-earth.png"),
              SizedBox(
                height: getSizeHeight(context, 1),
              ),
              Icon(
                Icons.add,
                color: Color(0xff2f3f9e),
              ),
              SizedBox(
                height: getSizeHeight(context, 1),
              ),
              _buildNewChallenge(context, "Take the bike to work",
                  "./assets/images/bicycle.png"),
            ],
          ),
        ),
      ),
    );
//    _buildChallenge(context, "Resell from your inventory",
//        "Resell second hand and earn money", "./assets/images/like.png"),
//    SizedBox(
//    height: getSizeHeight(context, 3),
//    ),
//    _buildChallenge(
//    context,
//    "Make an investment",
//    "Invest your savings to achieve growth",
//    "./assets/images/Investment.png"),
//    SizedBox(
//    height: getSizeHeight(context, 3),
//    ),
//    _buildChallenge(context, "Daily Starbucks Purchase",
//    "Save 105€/month by not buying this", "./assets/images/coffee.png"),
//    SizedBox(
//    height: getSizeHeight(context, 3),
//    ),
//    _buildChallenge(
//    context,
//    "Take the bike to work",
//    "Save 200€ month by taking the bike to work instead of the car",
//    "./assets/images/bicycle.png"),
//    SizedBox(
//    height: getSizeHeight(context, 3),
//    ),
  }

  Widget _buildBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: getSizeWidth(context, 6.4)),
      children: <Widget>[
        SizedBox(
          height: getSizeHeight(context, 7),
        ),
        Container(
          height: getSizeWidth(context, 40),
          width: getSizeWidth(context, 40),
          child: new CircularPercentIndicator(
            radius: 140.0,
            lineWidth: 10.0,
            percent: 0.8,
            center: Container(
              height: getSizeWidth(context, 20),
              width: getSizeWidth(context, 20),
              child: Image.asset("./assets/images/smartwatch.png",
                  fit: BoxFit.contain),
            ),
            backgroundColor: Colors.transparent,
            progressColor: Colors.blue,
          ),
        ),
        SizedBox(
          height: getSizeHeight(context, 3),
        ),
        Text(
          "€130.00",
          style: TextStyle(
            color: Color(0xff2f3f9e),
            fontSize: 20,
            fontFamily: "Avenir",
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: getSizeHeight(context, 1),
        ),
        Text(
          "out of €450 needed",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontFamily: "Avenir",
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: getSizeHeight(context, 3),
        ),
        _buildWishList(context),
        SizedBox(
          height: getSizeHeight(context, 3),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff141a46),
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text(
            "Wishlist",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: _buildBody(context),
      ),
    );
  }
}
