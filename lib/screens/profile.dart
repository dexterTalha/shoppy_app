import 'package:flutter/material.dart';
import 'package:flutter_icons/feather.dart';
import 'package:shoppy_app/animation/scale_delay_animation.dart';
import 'package:shoppy_app/util/const.dart';
import 'package:shoppy_app/widgets/badge.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String _fullName = "Nick Frost";
  final String _mobile = "+91 7894563210";
  final String _bio =
      "\"Hi, I am a Freelance developer working for hourly basis. If you wants to contact me to build your product leave a message.\"";
  final String _orders = "8";
  final String _cancelled = "2";
  final String _intransit = "5";

  Widget _buildCoverImage(Size screenSize) {
    return Container(
      height: screenSize.height / 2.6,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/2.jpeg'),
            fit: BoxFit.cover,
            colorFilter:
                ColorFilter.mode(Color(0x55ff2d77), BlendMode.srcATop)),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: ScaleDelayedAnimation(
        delay: 300,
        child: Container(
          width: 140.0,
          height: 140.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/1.jpeg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(80.0),
            border: Border.all(
              color: Colors.white,
              width: 4.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFullName() {
    TextStyle _nameTextStyle = TextStyle(
      fontFamily: 'SFUIDisplay',
      color: Theme.of(context).textTheme.title.color,
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
    );

    return ScaleDelayedAnimation(
      delay: 300,
      child: Text(
        _fullName,
        style: _nameTextStyle,
      ),
    );
  }

  Widget _buildStatus(BuildContext context) {
    return ScaleDelayedAnimation(
      delay: 300,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Text(
          _mobile,
          style: TextStyle(
            fontFamily: 'SFUIDisplay',
            color: Theme.of(context).textTheme.title.color,
            fontSize: 20.0,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String count) {
    TextStyle _statLabelTextStyle = TextStyle(
      fontFamily: 'SFUIDisplay',
      color: Constants.darkBG,
      fontSize: 16.0,
      fontWeight: FontWeight.w200,
    );

    TextStyle _statCountTextStyle = TextStyle(
      color: Constants.darkBG,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            count,
            style: _statCountTextStyle,
          ),
          Text(
            label,
            style: _statLabelTextStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildStatContainer() {
    return ScaleDelayedAnimation(
      delay: 300,
      child: Container(
        height: 60.0,
        margin: EdgeInsets.only(top: 8.0),
        decoration: BoxDecoration(
          color: Color(0xFFEFF4F7),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildStatItem("Orders", _orders),
            _buildStatItem("In Transit", _intransit),
            _buildStatItem("Cancelled", _cancelled),
          ],
        ),
      ),
    );
  }

  Widget _buildBio(BuildContext context) {
    TextStyle bioTextStyle = TextStyle(
      fontFamily: 'SFUIDisplay',
      fontWeight: FontWeight.w400, //try changing weight to w500 if not thin
      fontStyle: FontStyle.italic,
      color: Color(0xFF799497),
      fontSize: 16.0,
    );

    return ScaleDelayedAnimation(
      delay: 300,
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: EdgeInsets.all(8.0),
        child: Text(
          _bio,
          textAlign: TextAlign.center,
          style: bioTextStyle,
        ),
      ),
    );
  }

  Widget _buildSeparator(Size screenSize) {
    return ScaleDelayedAnimation(
      delay: 300,
      child: Container(
        width: screenSize.width / 1.6,
        height: 2.0,
        color: Theme.of(context).textTheme.title.color,
        margin: EdgeInsets.only(top: 4.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Profile",
          style: TextStyle(
            fontFamily: 'SFUIDisplay'
          ),
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
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              _buildCoverImage(screenSize),
              Positioned(
                  top: (screenSize.height / 2.6) * 0.35,
                  left: MediaQuery.of(context).size.width * 0.35,
                  child: _buildProfileImage()),
              Positioned(
                  bottom: (screenSize.height / 2.6) * 0.15,
                  right: MediaQuery.of(context).size.width * 0.30,
                  child: ScaleDelayedAnimation(
                    delay: 300,
                    child: CircleAvatar(
                      radius: 23,
                      backgroundColor: Theme.of(context).accentColor,
                      child: Icon(Icons.edit, color: Colors.white),
                    ),
                  )),
            ],
          ),
          Column(
            children: <Widget>[
              SizedBox(height: 15),
              _buildFullName(),
              _buildStatus(context),
              _buildStatContainer(),
              _buildBio(context),
              _buildSeparator(screenSize),
            ],
          ),
        ],
      ),
    );
  }
}
