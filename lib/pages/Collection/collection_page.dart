import 'package:flutter_icons/flutter_icons.dart';
import 'package:shop_ui/theme/colors.dart';
import 'package:shop_ui/util/constant.dart';
import 'package:shop_ui/widgets/custom_cart.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CollectionPage extends StatefulWidget {
  @override
  _CollectionPageState createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1565155003033-252a7073802c?ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 35, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Platform.isIOS
                                ? Icons.arrow_back_ios
                                : Icons.arrow_back,
                            color: white,
                            size: 18,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            GestureDetector(
                              child: FaIcon(
                                FontAwesomeIcons.slidersH,
                                color: white,
                                size: 20,
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, '/filter');
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              child: Icon(
                                Feather.search,
                                color: white,
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, '/search');
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Winter Collection',
                          style: TextStyle(
                              color: white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '30 Items',
                          style: TextStyle(color: white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15),
              child: Wrap(
                  spacing: 15,
                  children: List.generate(recently.length, (index) {
                    return InkWell(
                      child: CustomProductCart(
                        height: 220,
                        width: (size.width - 45) / 2,
                        imgUrl: recently[index]['imgUrl'],
                        imgFit: BoxFit.cover,
                        borderRadius: 5,
                        titleHeight: 100,
                        title: recently[index]['title'],
                        price: recently[index]['price'],
                        priceColor: grey,
                      ),
                      onTap: () {
                        goToProduct(recently[index]);
                      },
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }

  goToProduct(product) {
    Navigator.pushNamed(context, '/product_detail',
        arguments: {'product': product});
  }
}
