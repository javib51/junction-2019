import 'package:budge/utils.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class InventoryPage extends StatefulWidget {
  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  @override
  void initState() {
    super.initState();
    print("Inventory Page");
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

  Widget _buildItem(BuildContext context, String title) {
    return Container(
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
                'https://firebasestorage.googleapis.com/v0/b/trukatu-dev-1.appspot.com/o/blank-profile-picture-973460_640.png?alt=media&token=026ca169-fa4f-4871-9a30-954f9b4222a8',
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
                    "Winter Coat",
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
                      percent: 0.8,
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
                          onPressed: () {},
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
                          onPressed: () {},
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
                          "Durable",
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
                          "Clothes",
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
    );
  }

  List<Widget> _buildItems(BuildContext context) {
    return [
      _buildItem(context, "Winter Coat"),
    ];
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
            "YOUR INVENTORY",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        body: _buildBody(context),
      ),
    );
  }
}
