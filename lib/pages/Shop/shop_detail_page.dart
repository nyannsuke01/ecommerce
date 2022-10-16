import 'package:shop_ui/theme/colors.dart';
import 'package:shop_ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class ShopDetailPage extends StatefulWidget {
  @override
  _ShopDetailPageState createState() => _ShopDetailPageState();
}

class _ShopDetailPageState extends State<ShopDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
            color: Theme.of(context).iconTheme.color,
            size: 18,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Theme.of(context).appBarTheme.color,
        title: Text(
          "Champs-Élysées, Paris".toUpperCase(),
          style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    List days = [
      {"day": "Monday", "active": false},
      {"day": "Tuesday", "active": true},
      {"day": "Wednesday", "active": false},
      {"day": "Thursday", "active": false},
      {"day": "Friday", "active": false},
      {"day": "Saturday", "active": false},
      {"day": "Sunday", "active": false}
    ];
    return ListView(
      padding: EdgeInsets.only(bottom: 40),
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 280,
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 280,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: Container(
                  width: 45,
                  height: 45,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: white),
                  child: Icon(
                    Icons.compare_arrows,
                    color: black,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Column(
          children: List.generate(days.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  days[index]['active']
                      ? Row(
                          children: <Widget>[
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.orangeAccent),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              days[index]['day'],
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        )
                      : Text(
                          days[index]['day'],
                          style: TextStyle(fontSize: 16),
                        ),
                  Text(
                    "8:00 - 7:30 ",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          }),
        ),
        Divider(
          color: grey.withOpacity(0.8),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text(
            "22 Avenue des Champs-Élysées, Paris\n75008 Paris",
            style: TextStyle(height: 1.7, fontSize: 16),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                child: CustomButton(
                  height: 50,
                  title: 'Go to the shop'.toUpperCase(),
                  boxColor: Theme.of(context).buttonColor,
                  textColor: white,
                  width: size.width - 100,
                  fontWeight: FontWeight.bold,
                ),
                onTap: () {},
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Theme.of(context).buttonColor,
                      shape: BoxShape.circle),
                  child: Icon(
                    Icons.call,
                    color: white,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
