import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shop_ui/bloc/app_theme_notifer.dart';
import 'package:shop_ui/theme/colors.dart';
import 'package:shop_ui/util/constant.dart';
import 'package:shop_ui/util/global.dart';
import 'package:shop_ui/widgets/carosel.dart';
import 'package:shop_ui/widgets/custom_homepage_title.dart';
import 'package:shop_ui/widgets/custom_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    // new Timer(const Duration(milliseconds: 1000), () {
    //   showMessage(context);
    // });
  }

  showMessage(context) {
    customAlert(
        context,
        'https://images.unsplash.com/photo-1509631179647-0177331693ae?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
        'SHOP NOW',
        'Enjoy 20% discount on all products in our shop, for your first order');
  }

  @override
  Widget build(BuildContext context) {
    // call app State from bloc
    final AppStateNotifier appState = Provider.of<AppStateNotifier>(context);

    return getBody(appState);
  }

  Widget getBody(appState) {
    return Container(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      //TODO: constに移動
                        'https://makeshop-multi-images.akamaized.net/kokodake01/shopimages/37/10/4_000000001037.jpg?1653880461'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 35, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10, right: 5),
                        child: Row(
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
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                child: Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Winter Collection',
                          style: TextStyle(
                              color: white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: InkWell(
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'DISCOVER',
                                  style: TextStyle(
                                      color: white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: white,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            goToDiscover();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          CustomHomePageTitle(
            title: 'Categories',
            titleFontSize: 18,
            suffixTitle: 'All',
            suffixColor: grey,
            suffixIcon: Icon(Icons.arrow_forward_ios, color: grey, size: 18),
          ),
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  for (int i = 0; i < categories.length; i++)
                    Container(
                      margin: EdgeInsets.only(
                          left: i == 0 ? 15 : 10, right: i == 4 ? 15 : 0),
                      child: InkWell(
                          child: CustomCategoryCart(
                            title: categories[i]['title'],
                            fontSize: 18,
                            titleColor: white,
                            fontWeight: FontWeight.bold,
                            imgUrl: categories[i]['imgUrl'],
                            imgFit: BoxFit.cover,
                            height: 220,
                            width: 180,
                            borderRadius: 5,
                          ),
                          onTap: () {
                            goToCategory();
                          }),
                    ),
                ],
              ),
            ),
          ),
          CustomHomePageTitle(
            title: 'Recommended for you',
            titleFontSize: 18,
            suffixTitle: 'All',
            suffixColor: grey,
            suffixIcon: Icon(Icons.arrow_forward_ios, color: grey, size: 18),
          ),
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  for (int j = 0; j < recommends.length; j++)
                    Container(
                      margin: EdgeInsets.only(
                          left: j == 0 ? 15 : 10, right: j == 4 ? 15 : 0),
                      child: InkWell(
                          child: CustomProductCart(
                            height: 180,
                            width: 140,
                            imgUrl: recommends[j]['imgUrl'],
                            imgFit: BoxFit.cover,
                            borderRadius: 5,
                            titleHeight: 100,
                            title: recommends[j]['title'],
                            price: recommends[j]['price'],
                            priceColor: grey,
                          ),
                          onTap: () {
                            goToProduct(recommends[j]);
                          }),
                    ),
                ],
              ),
            ),
          ),
          Container(
            child: GestureDetector(
                child: CustomeCarouselHomePage(
                  items: slider,
                ),
                onTap: () {
                  goToCollection();
                }),
          ),
          CustomHomePageTitle(
            title: 'Recently viewed',
            titleFontSize: 18,
            suffixTitle: 'All',
            suffixColor: grey,
            suffixIcon: Icon(Icons.arrow_forward_ios, color: grey, size: 18),
          ),
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  for (int x = 0; x < recently.length; x++)
                    Container(
                      margin: EdgeInsets.only(
                          left: x == 0 ? 15 : 10, right: x == 4 ? 15 : 0),
                      child: InkWell(
                          child: CustomProductCart(
                            height: 180,
                            width: 140,
                            imgUrl: recently[x]['imgUrl'],
                            imgFit: BoxFit.cover,
                            borderRadius: 5,
                            titleHeight: 100,
                            title: recently[x]['title'],
                            price: recently[x]['price'],
                            priceColor: grey,
                          ),
                          onTap: () {
                            goToProduct(recently[x]);
                          }),
                    ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  goToDiscover() {
    Navigator.pushNamed(context, '/dashboard_explore');
  }

  goToCategory() {
    Navigator.pushNamed(context, '/category');
  }

  goToProduct(product) {
    Navigator.pushNamed(context, '/product_detail',
        arguments: {'product': product});
  }

  goToCollection() {
    Navigator.pushNamed(context, '/collection');
  }

  goToWishlist() {
    Navigator.pushNamed(context, '/wishlist');
  }

  goToSearch() {
    Navigator.pushNamed(context, '/search');
  }
}
