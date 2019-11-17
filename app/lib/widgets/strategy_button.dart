import 'package:flutter/material.dart';
import 'package:budge/utils/functions.dart';
import 'package:budge/data.dart';
//import 'package:budge/globals.dart' as globals;
//
//globals.

class PaymentMethodButton extends StatefulWidget {
  final Function onPressed;

  //final String iconPath;
  final String title;
  final bool initState;
  final bool isDisabled;
  final int id;


  PaymentMethodButton(
      {Key key,
      this.onPressed,
      //this.iconPath,
      this.title,
      this.initState,
      this.isDisabled,
      this.id})
      : super(key: key);

  @override
  _PaymentMethodButtonState createState() => _PaymentMethodButtonState();
}

class _PaymentMethodButtonState extends State<PaymentMethodButton> {
  bool isChecked;
  Color _splashColor;
  double _elevation;
  Color _color;
  double _highlightElevation;

  @override
  void initState() {
    super.initState();
    if (widget.initState) {
      isChecked = true;
    } else {
      isChecked = false;
    }
  }

  void _handleChange(value) {
//    if (widget.isDisabled) {
//      return null;
//    } else {
      setState(() {
        isChecked = value;
        switch (widget.id) {
          case 0:
            DataStore.instance.swi_stra = value;
            break;
          case 1:
            DataStore.instance.resell_stra = value;
            break;
          case 2:
            DataStore.instance.invest_stra = value;
            break;
          case 3:
            DataStore.instance.auto_stra = value;
            break;
          case 4:
            DataStore.instance.cut_stra = value;
            break;
        }
      });//}
  }

  void _handlePress() {
    if (widget.isDisabled) {
      _splashColor = null;
      _elevation = 0;
      _color = Colors.grey[600];
      _highlightElevation = 0;
      return null;
    } else {
      setState(() {
        isChecked = !isChecked;
      });
      _splashColor = Color(0xff2f3f9e);
      _highlightElevation = 2;
      _elevation = 8;
      _color = Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: _handlePress,
        height: getSizeHeight(context, 10),
        splashColor: _splashColor,
        color: _color,
        elevation: _elevation,
        highlightElevation: _highlightElevation,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
                color: Color(0xff979797),
                width: 1.0,
                style: BorderStyle.solid)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
//            Container(
//              margin: EdgeInsets.only(left: getSizeWidth(context, 11)),
//              child: Image.asset(widget.iconPath,
//                  height: getSizeWidth(context, 37)),
//            ),
            Container(
              margin: EdgeInsets.only(right: getSizeWidth(context, 3)),
              child: Checkbox(
                value: isChecked,
                onChanged: _handleChange,
              ),
            ),
            Container(
              child: Text(
                widget.title,
                style: TextStyle(
                    color: Color(0xff2f3f9e),
                    fontWeight: FontWeight.w500,
                    fontFamily: "Roboto",
                    fontStyle: FontStyle.normal,
                    fontSize: 16),
              ),
            ),
          ],
        ));
  }
}
