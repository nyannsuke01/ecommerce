import 'package:shop_ui/theme/colors.dart';
import 'package:shop_ui/widgets/custom_appbar.dart';
import 'package:shop_ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomOnlyAppBar(
          elevation: 1.0,
          appBarTitle: 'CHECKOUT',
        ),
        // child: ,
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Bopha',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Text(
                        '221b Baker St, Marylebone\nLondon,\nUnited Kingdom',
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.4,
                          color: grey,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).buttonColor,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: grey.withOpacity(0.8),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://www.stickpng.com/assets/thumbs/58482354cef1014c0b5e49c0.png'),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      child: Text(
                        'Master Card ending  ••••89',
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).buttonColor,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: grey.withOpacity(0.8),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                Container(
                  width: 140,
                  height: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1495385794356-15371f348c31?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Snoopy T-shirt",
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Ref 04559812",
                      style: TextStyle(
                          fontSize: 13,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.7)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "S",
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "\$65",
                          style: TextStyle(fontSize: 22),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.5),
                                  )),
                              child: Center(
                                  child: Icon(
                                FontAwesomeIcons.minus,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.5),
                                size: 10,
                              )),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "1",
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.5),
                                  )),
                              child: Center(
                                  child: Icon(
                                FontAwesomeIcons.plus,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.5),
                                size: 10,
                              )),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Divider(
            color: grey.withOpacity(0.8),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                Container(
                  width: 25,
                  height: 25,
                  decoration:
                      BoxDecoration(color: black, shape: BoxShape.circle),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: white,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  child: Text('Add promo code'),
                ),
              ],
            ),
          ),
          Divider(
            color: grey.withOpacity(0.8),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    'Total',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  child: Text(
                    '\$65',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: InkWell(
              child: CustomButton(
                height: 50,
                title: 'place order'.toUpperCase(),
                boxColor: Theme.of(context).buttonColor,
                textColor: white,
                width: MediaQuery.of(context).size.width,
                fontWeight: FontWeight.bold,
              ),
              onTap: () {
                print('hi');
              },
            ),
          ),
        ],
      ),
    );
  }
}
