import 'package:flutter_icons/flutter_icons.dart';
import 'package:shop_ui/theme/colors.dart';
import 'package:shop_ui/widgets/shop_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchShopPage extends StatefulWidget {
  @override
  _SearchShopPageState createState() => _SearchShopPageState();
}

class _SearchShopPageState extends State<SearchShopPage> {
  TextEditingController _searchShopController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Phnom Penh",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  FontAwesomeIcons.mapMarkerAlt,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Text(
              "Find all \nstores here",
              style: TextStyle(
                  height: 1.5, fontSize: 30, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: _searchShopController,
                        cursorColor: primary,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Feather.search,
                            size: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                          border: InputBorder.none,
                          hintText: "Search",
                          hintStyle:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Theme.of(context).buttonColor,
                      shape: BoxShape.circle),
                  child: Icon(
                    FontAwesomeIcons.mapMarkerAlt,
                    color: white,
                    size: 20,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Divider(
            color: grey.withOpacity(0.8),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "All stores",
              style: TextStyle(fontSize: 22),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
              onTap: () {
                goToShopDetail();
              },
              child: ShopCard(
                imgSrc:
                    "https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                shopName: "Champs-Élysées, Paris",
                statusShop: 1,
              )),
          GestureDetector(
              onTap: () {
                goToShopDetail();
              },
              child: ShopCard(
                imgSrc:
                    "https://images.unsplash.com/photo-1507914372368-b2b085b925a1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                shopName: "Châtelet - Les Halles, Paris",
                statusShop: 1,
              )),
          GestureDetector(
              onTap: () {
                goToShopDetail();
              },
              child: ShopCard(
                imgSrc:
                    "https://images.unsplash.com/photo-1546213290-e1b492ab3eee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                shopName: "Champs-Élysées, Paris",
                statusShop: 0,
              )),
          GestureDetector(
              onTap: () {
                goToShopDetail();
              },
              child: ShopCard(
                imgSrc:
                    "https://images.unsplash.com/photo-1555529771-7888783a18d3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                shopName: "Châtelet - Les Halles, Paris",
                statusShop: 1,
              )),
        ],
      ),
    );
  }

  goToShopDetail() {
    Navigator.pushNamed(context, '/shop_detail');
  }
}
