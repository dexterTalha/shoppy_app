import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shoppy_app/bloc/bloc_login.dart';
import 'package:shoppy_app/bloc/theme.dart';
import 'package:shoppy_app/screens/sign_up.dart';
import 'package:shoppy_app/util/const.dart';

import 'main_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    final loginBloc = BlocLogin(context);

    ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image1.png'),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter)),
          ),
          Form(
            key: _formKey,
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 230),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                color: themeChanger.getTheme() == Constants.darkTheme? Colors.black : Colors.white
              ),
              child: Padding(
                padding: EdgeInsets.all(23),
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: Container(
                        color: Color(0xfff5f5f5),
                        child: StreamBuilder<String>(
                          stream: loginBloc.email,
                          builder:(context, snap) => TextFormField(
                            onChanged: loginBloc.emailChanged,

                            controller: _usernameController,
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'SFUIDisplay'),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                ),
                                labelText: 'Username',
                                prefixIcon: Icon(Icons.person_outline, color: Colors.black,),
                                labelStyle: TextStyle(fontSize: 18, color: Colors.black,),
                                errorText: snap.error
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Color(0xfff5f5f5),
                      child: StreamBuilder<String>(
                        stream: loginBloc.password,
                        builder:(context, snap) =>  TextFormField(
                          onChanged: loginBloc.passwordChanged,
                          controller: _passwordController,

                          obscureText: true,
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'SFUIDisplay'),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock_outline, color: Colors.black,),
                              labelStyle: TextStyle(fontSize: 18, color: Colors.black,),
                              errorText: snap.error
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: StreamBuilder<bool>(
                        stream: loginBloc.submit,
                      builder:(context, snap) => MaterialButton(
                          onPressed:
                             () => snap.hasData ?loginBloc.login : null,
                          child: Text(
                            'SIGN IN',
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
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Center(
                        child: Text(
                          'Forgot your password?',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.body1.color,
                              fontFamily: 'SFUIDisplay',
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            //to signup
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                          },
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Don't have an account?",
                                  style: TextStyle(
                                    fontFamily: 'SFUIDisplay',
                                    color: Theme.of(context).textTheme.body1.color,
                                    fontSize: 15,
                                  )),
                              TextSpan(
                                  text: "Sign Up",
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
            ),
          )
        ],
      ),
    );
  }
}
