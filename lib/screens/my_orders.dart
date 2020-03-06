import 'package:shoppy_app/util/data.dart';
import 'package:flutter_icons/feather.dart';
import 'package:shoppy_app/widgets/badge.dart';
import 'package:flutter/material.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  bool isExpanded = false;

  _expand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

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
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 20, left: 20),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: furnitures.length,
              itemBuilder: (context, index) {
                Map furniture = furnitures[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: generateMyOrders(furniture, index),
                );
              }),
        ),
      ),
    );
  }

  Widget generateMyOrders(furniture, int index) {
    return GestureDetector(
      onTap: _expand,
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(10),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 600),
          height: isExpanded ? MediaQuery.of(context).size.width / 2 : 100,
          width: double.infinity,
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  '${furniture["img"]}',
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 5.0, left: 12.0, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "${furniture["name"]}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      child: Text(
                        "Description lorem ipsum",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: true,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "\$500",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
