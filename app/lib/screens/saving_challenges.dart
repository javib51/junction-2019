import 'package:budge/utils.dart';
import 'package:flutter/material.dart';

class SavingChallengesPage extends StatefulWidget {
  @override
  State<SavingChallengesPage> createState() => _SavingChallengesPageState();
}

class _SavingChallengesPageState extends State<SavingChallengesPage> {
  @override
  void initState() {
    super.initState();
  }

  Widget _buildChallenge(BuildContext context, String title, String subtitle,
      String asset) {
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Avenir",
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: getSizeHeight(context, 0.8),
                        ),
                        Container(width: getSizeWidth(context, 60), child: Text(
                          subtitle,
                          maxLines: 3,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Avenir",
                            fontWeight: FontWeight.w400,
                            color: Color(0xff2f3f9e),
                          ),
                        ),),
                      ],
                    ),
                    SizedBox(
                      width: getSizeWidth(context, 2),
                    ),
                    Container(
                      height: getSizeWidth(context, 17),
                      width: getSizeWidth(context, 17),
                      child: new DecoratedBox(
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          new BorderRadius.all(new Radius.circular(10.0)),
//                        boxShadow: [
//                          new BoxShadow(
//                              color: Colors.black54,
////                  offset: new Offset(1.0, 2.0),
//                              blurRadius: 1.0)
//                        ],
                        ),
                        child: asset == null
                            ? Container(
                          child: Icon(Icons.error),
                        )
                            : Image.asset(asset, fit: BoxFit.contain),
//                    : CachedNetworkImage(
//                        imageUrl: imageUrl,
//                        fit: BoxFit.contain,
//                        placeholder: (context, url) =>
//                            Center(child: new CircularProgressIndicator()),
//                        errorWidget: (context, url, error) =>
//                            new Icon(Icons.error),
//                      ),
                      ),
                    ),
                  ],
                ),
              ),
              RaisedButton(
                child: Text(
                  "TAKE CHALLENGE",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                color: Color(0xff2f3f9e),
                onPressed: () {},
              )
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
        _buildChallenge(context, "Resell from your inventory",
            "Resell second hand and earn money", "./assets/images/like.png"),
        SizedBox(height: getSizeHeight(context, 3),),
        _buildChallenge(
            context,
            "Make an investment",
            "Invest your savings to achieve growth",
            "./assets/images/Investment.png"),
        SizedBox(height: getSizeHeight(context, 3),),
        _buildChallenge(context, "Daily Starbucks Purchase",
            "Save 105€/month by not buying this", "./assets/images/coffee.png"),
        SizedBox(height: getSizeHeight(context, 3),),
        _buildChallenge(
            context,
            "Take the bike to work",
            "Save 200€ month by taking the bike to work instead of the car",
            "./assets/images/bicycle.png"),
        SizedBox(height: getSizeHeight(context, 3),),
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
            "Saving Challenges",
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
