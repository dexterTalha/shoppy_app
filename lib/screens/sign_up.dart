import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppy_app/bloc/theme.dart';
import 'package:shoppy_app/screens/sign_in.dart';
import '../util/const.dart';
import 'main_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {

    ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);

    return WillPopScope(
      onWillPop: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInScreen()));
      },
          child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image1.png'),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter)),
                      
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 170),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: themeChanger.getTheme() == Constants.darkTheme? Colors.black : Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(top:15, bottom:10),
                child: ListView(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Container(
                        color: Color(0xfff5f5f5),
                        child: TextFormField(
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'SFUIDisplay'),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Username',
                              prefixIcon: Icon(Icons.person_outline, color: Colors.black),
                              labelStyle: TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Container(
                        color: Color(0xfff5f5f5),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'SFUIDisplay'),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Mobile',
                              prefixIcon: Icon(Icons.phone_iphone, color: Colors.black),
                              labelStyle: TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Container(
                        color: Color(0xfff5f5f5),
                        child: TextFormField(
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'SFUIDisplay'),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.mail_outline, color: Colors.black),
                              labelStyle: TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Container(
                        color: Color(0xfff5f5f5),
                        child: TextFormField(
                          obscureText: true,
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'SFUIDisplay'),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock_outline, color: Colors.black),
                              labelStyle: TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                      ),
                    ),
                    Container(
                      color: Color(0xfff5f5f5),
                      child: TextFormField(
                        obscureText: true,
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'SFUIDisplay'),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Confirm Password',
                            prefixIcon: Icon(Icons.lock_outline, color: Colors.black),
                            labelStyle: TextStyle(fontSize: 15, color: Colors.black)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()));
                        }, //since this is only a UI app
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'SFUIDisplay',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Color(0xffff2d55),
                        elevation: 0,
                        minWidth: 400,
                        height: 50,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            //to signup
                          },
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Already member?",
                                  style: TextStyle(
                                    fontFamily: 'SFUIDisplay',
                                    color: Colors.black,
                                    fontSize: 15,
                                  )),
                              TextSpan(
                                  text: "Sign in",
                                  style: TextStyle(
                                    fontFamily: 'SFUIDisplay',
                                    color: Color(0xffff2d55),
                                    fontSize: 15,
                                  ))
                            ]),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
