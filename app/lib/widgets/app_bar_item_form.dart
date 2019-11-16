import 'package:flutter/material.dart';

import '../utils.dart';

// ignore: must_be_immutable
class AppBarItemForm extends StatelessWidget implements PreferredSizeWidget {
  final Function onTapBack;
  final Function onTapSave;
  final String title;
  AppBar _appBar;

  AppBarItemForm({@required this.onTapSave, @required this.onTapBack, @required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _appBar = AppBar(
      elevation: 0.0,
      backgroundColor: Color(0xff2f3f9e),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: onTapBack,
      ),
      actions: <Widget>[
        Container(
          padding: EdgeInsets.only(right: getSizeWidth(context, 28)),
          child: FlatButton(
            color: Colors.white,
            onPressed: onTapSave,
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto",
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0),
            ),
          ),
        ),
      ],
    );
    return _appBar;
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      (_appBar != null) ? _appBar.preferredSize : Size.fromHeight(55.0);
}
