import 'package:shop_ui/theme/colors.dart';
import 'package:shop_ui/util/constant.dart';
import 'package:shop_ui/widgets/custom_cart.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WishlistPage extends StatefulWidget {
  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
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
                    padding: const EdgeInsets.only(top: 10, right: 15),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(
                                      Platform.isIOS
                                          ? Icons.arrow_back_ios
                                          : Icons.arrow_back,
                                      color: Theme.of(context).iconTheme.color,
                                      size: 18,
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                  Text(
                                    'WISHLIST',
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              child: Container(
                                height: 30,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).buttonColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                    child: Text(
                                  'Edit',
                                  style: TextStyle(
                                    color: white,
                                  ),
                                )),
                              ),
                              onTap: () {
                                print('edit');
                              },
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
    var size = MediaQuery.of(context).size;
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text(
                    '27 Items',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  child: FaIcon(
                    FontAwesomeIcons.slidersH,
                    color: Theme.of(context).iconTheme.color,
                    size: 20,
                  ),
                  onTap: () {
                    goToFilter();
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15),
            child: Wrap(
                spacing: 15,
                children: List.generate(recently.length, (index) {
                  return CustomWishlistCart(
                    height: 220,
                    width: (size.width - 45) / 2,
                    imgUrl: recently[index]['imgUrl'],
                    imgFit: BoxFit.cover,
                    borderRadius: 5,
                    titleHeight: 100,
                    title: recently[index]['title'],
                    price: recently[index]['price'],
                    priceColor: grey,
                  );
                })),
          ),
        ],
      ),
    );
  }

  goToProduct(product) {
    Navigator.pushNamed(context, '/product_detail',
        arguments: {'product': product});
  }

  goToFilter() {
    Navigator.pushNamed(context, '/filter');
  }
}
