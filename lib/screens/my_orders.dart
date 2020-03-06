import 'package:flutter_icons/feather.dart';
import 'package:shoppy_app/widgets/badge.dart';
import 'package:flutter/material.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "My Orders",
          style: TextStyle(fontFamily: 'SFUIDisplay'),
        ),
        actions: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: IconBadge(
                icon: Feather.getIconData("shopping-cart"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}