import 'package:shoppy_app/screens/details.dart';
import 'package:shoppy_app/helpers/customer_page_route.dart';
import 'package:shoppy_app/util/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/feather.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  int counter = 1;
  _incrementCounter() {
    counter++;
    setState(() {});
  }

  _decrementCounter() {
    if (counter > 0) {
      counter--;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.only(top: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "My Cart",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, right: 20),
                        child: Stack(
                          children: <Widget>[
                            Icon(
                              Feather.getIconData("shopping-cart"),
                              size: 35,
                            ),
                            Positioned(
                              right: 0.0,
                              child: Container(
                                padding: EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 20,
                                  minHeight: 20,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 1),
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: furnitures.length,
                itemBuilder: (context, index){
                  Map furniture = furnitures[index];
                  return generateCartItem(furniture, index);
                }
              ),
              

            ],
          ),
        ),
      ),
    );
  }

  Widget generateCartItem(furniture, int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, right: 20, left: 20),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, CustomPageRoute(newPage: Details(index, "cart")));
        },
        child: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 6,
          child: Container(
            width: double.infinity,
            height: 100,
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
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Material(
                                        color: Color(0x55ff2d55),
                                        borderRadius: BorderRadius.circular(10),
                                        elevation: 6,
                                        child: AlertDialog(
                                          title: Text("Confimation?"),
                                          content: Text("Remove from favourite"),
                                          actions: <Widget>[
                                            MaterialButton(
                                                onPressed: () {},
                                                child: Text("Yes")),
                                            MaterialButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("No"))
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: Text(
                                "Remove",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: _incrementCounter,
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    topLeft: Radius.circular(5),
                                  ),
                                  border: Border.all(
                                    width: 1,
                                    color: Theme.of(context).accentColor,
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Icon(Icons.add),
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 25,
                            decoration: BoxDecoration(
                                border: Border.all(
                              width: 1,
                              color: Theme.of(context).accentColor,
                            )),
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Center(child: Text("$counter")),
                            ),
                          ),
                          GestureDetector(
                            onTap: _decrementCounter,
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                  border: Border.all(
                                    width: 1,
                                    color: Theme.of(context).accentColor,
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Icon(Icons.remove),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
