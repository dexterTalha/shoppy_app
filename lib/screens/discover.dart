import 'package:shoppy_app/animation/delayed_animation.dart';
import 'package:shoppy_app/util/data.dart';
import 'package:shoppy_app/widgets/badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/feather.dart';

import 'details.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Center(
            child: IconBadge(
              icon: Feather.getIconData("shopping-cart"),
            ),
          ),
          SizedBox(width: 20),
          
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Offers for You",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: furnitures.length,
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index){
                Map furniture = furnitures[index];
                return createOffers(furniture, index);
              }
            ),
          ],
        ),
      ),
    );
  }

  Widget createOffers(furniture, int index){
    double p = index == 0?0:15;
    return DelayedAnimation(
      delay: 500,
      child: Padding(
        padding: EdgeInsets.only(top: p),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return Details(index.toString(),"offers");
                },
              ),
            );
          },
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  furniture['name'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10),
                Hero(
                  tag: "image$index"+"top",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "${furniture["img"]}",
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}