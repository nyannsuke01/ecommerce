import 'dart:io';

import 'package:shop_ui/theme/colors.dart';
import 'package:shop_ui/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  double _priceValue = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
              elevation: 1,
              automaticallyImplyLeading: false,
              flexibleSpace: Container(
                decoration:
                    BoxDecoration(color: Theme.of(context).appBarTheme.color),
                child: SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 20, right: 15),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Platform.isIOS
                                          ? Icons.arrow_back_ios
                                          : Icons.arrow_back,
                                      color: Theme.of(context).iconTheme.color,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'CART',
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Theme.of(context).buttonColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      child: Text(
                                    'Clean',
                                    style: TextStyle(
                                      color: white,
                                    ),
                                  )),
                                  SizedBox(width: 10),
                                  GestureDetector(
                                    child: FaIcon(
                                      FontAwesomeIcons.times,
                                      color: white,
                                      size: 15,
                                    ),
                                    onTap: () {
                                      print('clean');
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ))),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Text(
              'Price',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Slider(
              value: _priceValue,
              min: 0,
              max: 100,
              activeColor: Theme.of(context).buttonColor,
              inactiveColor: grey,
              onChanged: (value) {
                setState(() {
                  _priceValue = value;
                });
              },
            ),
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              'Colors',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  for (int i = 0; i < colors.length; i++)
                    Container(
                      padding: EdgeInsets.only(left: i == 0 ? 0 : 20),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: colors[i]['title'],
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          if (i == (colors.length - 1))
                            Positioned(
                              top: 5,
                              left: 5,
                              child: Center(
                                  child: Icon(Icons.check,
                                      size: 18, color: white)),
                            ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              'Sizes',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  for (int j = 0; j < sizes.length; j++)
                    Container(
                      padding: EdgeInsets.only(
                          left: j == 0 ? 20 : 20, right: j == 4 ? 20 : 0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: j == 0
                                  ? Theme.of(context).buttonColor
                                  : white,
                              border: Border.all(
                                color: j == 0
                                    ? Theme.of(context).buttonColor
                                    : black,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                sizes[j]['title'],
                                style: TextStyle(
                                  color: j == 0 ? white : black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              'Brands',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: <Widget>[
                for (int k = 0; k < brands.length; k++)
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Text(
                                brands[k],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: k == 1 ? FontWeight.bold : null,
                                ),
                              ),
                            ),
                            Container(
                              child: Icon(
                                k == 1 ? Icons.check : null,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Divider(
                          color: grey.withOpacity(0.8),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
