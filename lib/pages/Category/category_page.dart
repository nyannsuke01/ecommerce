import 'dart:io';

import 'package:flutter_icons/flutter_icons.dart';
import 'package:shop_ui/theme/colors.dart';
import 'package:shop_ui/util/constant.dart';
import 'package:shop_ui/widgets/custom_cart.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: GestureDetector(
          child: Icon(
            Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
            color: Theme.of(context).iconTheme.color,
            size: 18,
          ),
          onTap: () => Navigator.pop(context),
        ),
        title: Row(
          children: <Widget>[
            Text(
              'WOMEN',
              style: Theme.of(context).textTheme.headline6,
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Theme.of(context).iconTheme.color,
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  child: Icon(
                    Icons.favorite,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/wishlist');
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
                    Navigator.pushNamed(context, '/search');
                  },
                ),
              ],
            ),
          )
        ],
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
      child: ListView(
        children: <Widget>[
          for (int i = 0; i < categories.length; i++)
            InkWell(
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: CustomCategoryCart(
                  title: categories[i]['title'],
                  fontSize: 25,
                  titleColor: white,
                  fontWeight: FontWeight.normal,
                  imgUrl: categories[i]['imgUrl'],
                  imgFit: BoxFit.cover,
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  borderRadius: 5,
                ),
              ),
              onTap: () => Navigator.pushNamed(context, '/subcategory'),
            ),
        ],
      ),
    );
  }
}
