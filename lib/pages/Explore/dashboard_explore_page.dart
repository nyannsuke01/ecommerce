import 'dart:io';

import 'package:flutter_icons/flutter_icons.dart';
import 'package:shop_ui/theme/colors.dart';
import 'package:shop_ui/util/constant.dart';
import 'package:shop_ui/widgets/custom_cart.dart';
import 'package:flutter/material.dart';

class DashboardExplorePage extends StatefulWidget {
  @override
  _DashboardExplorePageState createState() => _DashboardExplorePageState();
}

class _DashboardExplorePageState extends State<DashboardExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: Container(
          child: IconButton(
            icon: Icon(
              Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
              color: Theme.of(context).iconTheme.color,
              size: 18,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  child: Icon(
                    Icons.favorite,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onTap: () {
                    goToWishlist();
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  child: Icon(
                    Feather.search,
                    size: 22,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onTap: () {
                    goToSearch();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  for (int i = 0; i < explores.length; i++)
                    CustomCircleExploreCart(
                      title: explores[i]['title'],
                      imgUrl: explores[i]['imgUrl'],
                    ),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 1,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                for (int j = 0; j < exploreProduct.length; j++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: InkWell(
                      child: CustomExploreProductCart(
                        title: exploreProduct[j]['title'],
                        subTitle: exploreProduct[j]['subTitle'],
                        textColor: white,
                        titleSize: 26,
                        subTitleSize: 16,
                        imgUrl: exploreProduct[j]['imgUrl'],
                      ),
                      onTap: () {
                        goToExploreView();
                      },
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  goToExploreView() {
    Navigator.pushNamed(context, '/explore_view');
  }

  goToWishlist() {
    Navigator.pushNamed(context, '/wishlist');
  }

  goToSearch() {
    Navigator.pushNamed(context, '/search');
  }
}
