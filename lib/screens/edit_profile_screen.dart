import 'package:shoppy_app/widgets/badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/feather.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Update Profile",
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Form(
          key: _formKey,
          child: Stack(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Container(
                      color: Color(0xfff5f5f5),
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'SFUIDisplay'),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Full Name',
                            prefixIcon:
                                Icon(Icons.person_outline, color: Colors.black),
                            labelStyle:
                                TextStyle(fontSize: 15, color: Colors.black)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Container(
                      color: Color(0xfff5f5f5),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'SFUIDisplay'),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Mobile',
                            prefixIcon:
                                Icon(Icons.phone_iphone, color: Colors.black),
                            labelStyle:
                                TextStyle(fontSize: 15, color: Colors.black)),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Text("Gender",
                          style: TextStyle(
                              fontFamily: 'SFUIDisplay',
                              fontSize: 16,
                              color: Theme.of(context).textTheme.title.color))),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        addRadioButton(0, 'Male'),
                        addRadioButton(1, 'Female'),
                        addRadioButton(2, 'Others'),
                      ],
                    ),
                  ),
                 Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Container(
                      color: Color(0xfff5f5f5),
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'SFUIDisplay'),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Address',
                            labelStyle:
                                TextStyle(fontSize: 15, color: Colors.black)),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: MaterialButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {}
                    },
                    child: Text(
                      'SAVE CHANGES',
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
              )
            ],
          ),
        ),
      ),
    );
  }

  List gender = ["Male", "Female", "Other"];

  String select;

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          autofocus: true,
          activeColor: Theme.of(context).accentColor,
          value: gender[btnValue],
          groupValue: select,
          onChanged: (value) {
            setState(() {
              print(value);
              select = value;
            });
          },
        ),
        Text(title)
      ],
    );
  }
}
