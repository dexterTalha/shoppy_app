import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoppy_app/helpers/customer_page_route.dart';
import 'package:shoppy_app/helpers/shared_pref.dart';
import 'package:shoppy_app/screens/main_screen.dart';
import 'package:shoppy_app/screens/sign_in.dart';
import 'package:shoppy_app/util/const.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
 
  Timer _timer;
  bool islogin;
   
  AnimationController animationController;
  Animation<Color> animationOne;
  Animation<Color> animationTwo;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    animationOne = ColorTween(begin: Colors.white, end: Constants.lightAccent).animate(animationController);
    animationTwo = ColorTween(end: Colors.white, begin: Constants.lightAccent).animate(animationController);

    animationController.forward();

    animationController.addListener((){
      if(animationController.status == AnimationStatus.completed){
        animationController.reverse();
      }else if(animationController.status == AnimationStatus.dismissed){
        animationController.forward();
      }
    });
    SharedPref().isLoggedIn().then((onValue){
      islogin = onValue;
    });
    handleTimeOut();
  }

  handleTimeOut(){
    _timer = Timer(const Duration(seconds: 3), (){
      Navigator.pushReplacement(context, CustomPageRoute(newPage: islogin ? MainScreen() : SignInScreen()));
      //Navigator.pop(context);
    });
    
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffff2d55), Color(0xffff2d78)],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ShaderMask(
              blendMode: BlendMode.srcATop,
              shaderCallback: (bounds){
                return LinearGradient(
                  colors: [animationOne.value, animationTwo.value],
                  stops: [0.0, 0.5]
                ).createShader(bounds);
              },
              child: FlutterLogo(
                textColor: Colors.white,
                style: FlutterLogoStyle.horizontal,
                size: 200,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    _timer.cancel();
    super.dispose();    
  }
}
