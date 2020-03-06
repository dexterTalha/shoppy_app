import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPageRoute extends CupertinoPageRoute {


  Widget newPage;
  CustomPageRoute({
    @required this.newPage
  })
      : super(builder: (BuildContext context) => newPage);


  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return ScaleTransition(
      scale: animation,
      child: FadeTransition(opacity: animation, child: newPage));
  }
}