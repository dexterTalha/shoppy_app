import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppy_app/screens/main_screen.dart';
import 'package:shoppy_app/screens/otp_verification.dart';
import 'package:shoppy_app/screens/splash_screen.dart';

import 'bloc/theme.dart';
import 'helpers/shared_pref.dart';
import 'screens/sign_in.dart';
import 'util/const.dart';

void main() async {
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool theme = false;

    SharedPref().getTheme().then((value) {
      theme = value;
      print(value);
    });

    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) {
        ThemeChanger themeChanger;
        themeChanger = ThemeChanger(
              theme ? Constants.darkTheme : Constants.lightTheme);
              return themeChanger;
      },
      child: MaterialAppTheme(),
    );
  }
}

class MaterialAppTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    ThemeData d;
    SharedPref().getTheme().then((value) {
      theme.setTheme(value ? Constants.darkTheme :Constants.lightTheme);
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: theme.getTheme(),
      home: MainScreen(),
    );
  }
}
