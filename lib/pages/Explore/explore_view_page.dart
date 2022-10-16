import 'package:flutter_icons/flutter_icons.dart';
import 'package:shop_ui/theme/colors.dart';
import 'package:shop_ui/util/constant.dart';
import 'package:shop_ui/widgets/carosel.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class ExploreViewPage extends StatefulWidget {
  @override
  _ExploreViewPageState createState() => _ExploreViewPageState();
}

class _ExploreViewPageState extends State<ExploreViewPage> {
  int activeIndex = 0;
  setActiveDot(index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1554141186-b677b43d66b9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black.withOpacity(0.2),
                ),
              ],
            ),
          ),
          Positioned(
            child: Container(
              padding: EdgeInsets.only(top: 35, right: 10),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                      color: white,
                      size: 18,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        child: Icon(
                          Icons.favorite,
                          color: white,
                          size: 28,
                        ),
                        onTap: () {
                          goToWishlist();
                        },
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        child: Icon(
                          Feather.search,
                          color: white,
                          size: 25,
                        ),
                        onTap: () {
                          goToSearch();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            child: CustomCarouselExplore(
              slides: exploreBanner,
            ),
          ),
        ],
      ),
    );
  }

  goToWishlist() {
    Navigator.pushNamed(context, '/wishlist');
  }

  goToSearch() {
    Navigator.pushNamed(context, '/search');
  }
}
