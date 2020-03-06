import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{

  static const String KEY_EMAIL = "email";
  static const String KEY_NAME = "name";
  static const String KEY_MOBILE = "mobile";
  static const String KEY_THEME = "theme";
  static const String KEY_ISLOGIN = "islogin";
  static const String KEY_UID = "uid";
  
  setTheme(bool isDark) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool(SharedPref.KEY_THEME, isDark);
  }

  createSession(uid, name, email, mobile) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(SharedPref.KEY_UID, uid);
    pref.setString(SharedPref.KEY_NAME, name);
    pref.setString(SharedPref.KEY_EMAIL, email);
    pref.setString(SharedPref.KEY_MOBILE, mobile);
    pref.setBool(SharedPref.KEY_ISLOGIN, true);

  }

  logoutUser() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(SharedPref.KEY_ISLOGIN, false);
  }

  Future<bool> isLoggedIn() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.get(SharedPref.KEY_ISLOGIN) ?? false;
  }

  getTheme() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(SharedPref.KEY_THEME) ?? false;
  }

}