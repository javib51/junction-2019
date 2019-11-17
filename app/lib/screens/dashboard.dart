import 'package:budge/utils.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:budge/app_routes.dart';
import 'package:budge/data.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
  }

  List<String> _getChallenges(){
    List<String> challenges = new List();
    print(DataStore.instance.swi_stra);
    if(!DataStore.instance.swi_stra && !DataStore.instance.resell_stra &&
        !DataStore.instance.invest_stra && !DataStore.instance.auto_stra && !DataStore.instance.cut_stra){
      challenges.add("No user input");
      challenges.add("No user input");
    }
    if(DataStore.instance.swi_stra){
      challenges.add("No enough data for brand switching");
    }
    if(DataStore.instance.resell_stra){
      challenges.add("Resell from your inventory");
    }
    if(DataStore.instance.invest_stra){
      challenges.add("Make an investment");
    }
    if(DataStore.instance.auto_stra){
      challenges.add("Autosave challenge underdevelopment");
    }
    if(DataStore.instance.cut_stra && DataStore.instance.he_value ==3){
      challenges.add("Take the bike to work");
    }
    if(DataStore.instance.cut_stra){
      challenges.add("Daily Starbucks Purchase");
    }
    return challenges;
  }

  Widget _buildInventory(BuildContext context) {
    return GestureDetector(
      onTap: (){Navigator.pushNamed(context, AppRoutes.inventory);},
      child: Container(
//      height: getSizeHeight(context, 16.9),
        width: getSizeWidth(context, 99.1),
        child: new DecoratedBox(
          decoration: new BoxDecoration(
            color: Colors.white,
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
                Text(
                  "Your Inventory",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: getSizeHeight(context, 2),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: getSizeWidth(context, 4.2),
                    right: getSizeWidth(context, 3.2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: getSizeWidth(context, 17),
                        width: getSizeWidth(context, 17),
                        child: new DecoratedBox(
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            new BorderRadius.all(new Radius.circular(10.0)),
                          ),
                          child: Image.asset("./assets/images/bicycle.png",
                              fit: BoxFit.contain),
                        ),
                      ),
                      Container(
                        height: getSizeWidth(context, 17),
                        width: getSizeWidth(context, 17),
                        child: new DecoratedBox(
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            new BorderRadius.all(new Radius.circular(10.0)),
                          ),
                          child: Image.asset("./assets/images/high-heels.png",
                              fit: BoxFit.contain),
                        ),
                      ),
                      Container(
                        height: getSizeWidth(context, 17),
                        width: getSizeWidth(context, 17),
                        child: new DecoratedBox(
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            new BorderRadius.all(new Radius.circular(10.0)),
                          ),
                          child: Image.asset("./assets/images/photo-camera.png",
                              fit: BoxFit.contain),
                        ),
                      ),
                      Container(
                        height: getSizeWidth(context, 17),
                        width: getSizeWidth(context, 17),
                        child: new DecoratedBox(
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            new BorderRadius.all(new Radius.circular(10.0)),
                          ),
                          child: Image.asset("./assets/images/surfboard.png",
                              fit: BoxFit.contain),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildValues(BuildContext context) {
    return Container(
//      height: getSizeHeight(context, 16.9),
      width: getSizeWidth(context, 99.1),
      child: new DecoratedBox(
        decoration: new BoxDecoration(
          color: Colors.white,
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
              Text(
                "Your Values",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getSizeHeight(context, 2),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: getSizeWidth(context, 4.7),
                  right: getSizeWidth(context, 4.7),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Stack(children: <Widget>[
                          Container(
                            height: getSizeWidth(context, 17),
                            width: getSizeWidth(context, 17),
                            child: new DecoratedBox(
                              decoration: new BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.all(
                                    new Radius.circular(10.0)),
                              ),
                              child: Image.asset(
                                  "./assets/images/green-earth.png",
                                  fit: BoxFit.contain),
                            ),
                          ),
                          Container(
                            alignment: Alignment(0, 0),
                            height: 20,
                            width: 20,
                            margin: EdgeInsets.only(
                                left: getSizeWidth(context, 12)),
//              margin: EdgeInsets.only(
//                  left: getSizeWidth(context, 5.3),
//                  right: getSizeWidth(context, 5.3)),
                            decoration: BoxDecoration(
                              color: Color(0xff979797),
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child:
                            Text(
                              DataStore.instance.sus_value == -1 ? "-" : DataStore.instance.sus_value.toString(),
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),]),
                        SizedBox(
                          height: getSizeHeight(context, 2),
                        ),
                        Text(
                          "Sustainability",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Avenir",
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: getSizeWidth(context, 2),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Stack(children: <Widget>[
                          Container(
                            height: getSizeWidth(context, 17),
                            width: getSizeWidth(context, 17),
                            child: new DecoratedBox(
                              decoration: new BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.all(
                                    new Radius.circular(10.0)),
                              ),
                              child: Image.asset(
                                  "./assets/images/heart.png",
                                  fit: BoxFit.contain),
                            ),
                          ),
                          Container(
                            alignment: Alignment(0, 0),
                            height: 20,
                            width: 20,
                            margin: EdgeInsets.only(
                                left: getSizeWidth(context, 12)),
//              margin: EdgeInsets.only(
//                  left: getSizeWidth(context, 5.3),
//                  right: getSizeWidth(context, 5.3)),
                            decoration: BoxDecoration(
                              color: Color(0xff979797),
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child:
                            Text(
                              DataStore.instance.he_value == -1 ? "-" : DataStore.instance.he_value.toString(),
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),]),
                        SizedBox(
                          height: getSizeHeight(context, 2),
                        ),
                        Text(
                          "Health",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Avenir",
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: getSizeWidth(context, 2),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Stack(children: <Widget>[
                          Container(
                            height: getSizeWidth(context, 17),
                            width: getSizeWidth(context, 17),
                            child: new DecoratedBox(
                              decoration: new BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.all(
                                    new Radius.circular(10.0)),
                              ),
                              child: Image.asset(
                                  "./assets/images/piggy-bank.png",
                                  fit: BoxFit.contain),
                            ),
                          ),
                          Container(
                            alignment: Alignment(0, 0),
                            height: 20,
                            width: 20,
                            margin: EdgeInsets.only(
                                left: getSizeWidth(context, 12)),
//              margin: EdgeInsets.only(
//                  left: getSizeWidth(context, 5.3),
//                  right: getSizeWidth(context, 5.3)),
                            decoration: BoxDecoration(
                              color: Color(0xff979797),
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child:
                            Text(
                              DataStore.instance.sav_value == -1 ? "-" : DataStore.instance.sav_value.toString(),
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),]),
                        SizedBox(
                          height: getSizeHeight(context, 2),
                        ),
                        Text(
                          "Savings",
                          style: TextStyle(
                            fontSize: 16,
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubChallenge(
      BuildContext context, String text, double percentage) {
    return Container(
//      height: getSizeHeight(context, 16.9),
      width: getSizeWidth(context, 37.1),
      child: new DecoratedBox(
        decoration: new BoxDecoration(
          color: Color(0xff8facdb),
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
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getSizeHeight(context, 2),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: new LinearPercentIndicator(
                  width: getSizeWidth(context, 30.3),
                  animation: true,
                  lineHeight: 13.0,
                  animationDuration: 2200,
                  percent: percentage,
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

  Widget _buildChallenge(BuildContext context) {
    return Container(
//      height: getSizeHeight(context, 16.9),
      width: getSizeWidth(context, 99.1),
      child: new DecoratedBox(
        decoration: new BoxDecoration(
          color: Colors.white,
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
            left: getSizeWidth(context, 3.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Your Challenges",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getSizeHeight(context, 2),
              ),
              Padding(
                padding: EdgeInsets.only(
//                  left: getSizeWidth(context, 4.7),
                  right: getSizeWidth(context, 4.2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildSubChallenge(
                        context, _getChallenges()[0], 0.35),
//                    SizedBox(width: getSizeWidth(context,2),),
                    _buildSubChallenge(
                        context, _getChallenges()[1], 0.2),
                  ],
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
//                  left: getSizeWidth(context, 4.7),
                  right: getSizeWidth(context, 4.2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Your Wishlist",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Avenir",
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: getSizeWidth(context, 20),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 30,
                        color: Color(0xff141a46),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getSizeHeight(context, 2),
              ),
              Padding(
                padding: EdgeInsets.only(
//                  left: getSizeWidth(context, 4.7),
                  right: getSizeWidth(context, 4.2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: getSizeWidth(context, 22),
                      width: getSizeWidth(context, 22),
                      child: new DecoratedBox(
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          new BorderRadius.all(new Radius.circular(10.0)),
                        ),
                        child: Image.asset("./assets/images/smartwatch.png",
                            fit: BoxFit.contain),
                      ),
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

  Widget _buildBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: getSizeWidth(context, 6.4)),
      children: <Widget>[
        SizedBox(
          height: getSizeHeight(context, 5.9),
        ),
        _buildInventory(context),
        SizedBox(
          height: getSizeHeight(context, 3),
        ),
        _buildValues(context),
        SizedBox(
          height: getSizeHeight(context, 3),
        ),
        _buildChallenge(context),
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
            "Dashboard",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.value_settings);},
            ),
          ],
        ),
        body: _buildBody(context),
      ),
    );
  }
}