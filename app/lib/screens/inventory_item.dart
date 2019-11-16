import 'package:flutter/material.dart';

class InventoryItemPage extends StatefulWidget {
  @override
  State<InventoryItemPage> createState() => _InventoryItemPageState();
}

class _InventoryItemPageState extends State<InventoryItemPage> {
  @override
  void initState() {
    super.initState();
  }

  Widget _buildBody(BuildContext context) {
    return Container();
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
            "YOUR INVENTORY",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        body: _buildBody(context),
      ),
    );
  }
}