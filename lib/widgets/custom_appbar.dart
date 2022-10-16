import 'package:flutter_icons/flutter_icons.dart';
import 'package:shop_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/*
 * Only AppBar 
 */
class CustomOnlyAppBar extends StatelessWidget {
  final String appBarTitle;
  final double elevation;

  CustomOnlyAppBar({Key key, this.appBarTitle, this.elevation})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: elevation,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).appBarTheme.color,
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Container(
                        child: Row(
                          children: [
                            Icon(
                              Platform.isIOS
                                  ? Icons.arrow_back_ios
                                  : Icons.arrow_back,
                              color: Theme.of(context).primaryColor,
                              size: 18,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              appBarTitle,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

/*
 * AppBar With Title
 */
class CustomAppBar extends StatelessWidget {
  final String appBarTitle, title;

  const CustomAppBar({Key key, this.title, this.appBarTitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              black.withOpacity(0.95),
              black.withOpacity(0.79),
            ], end: Alignment.topCenter, begin: Alignment.bottomCenter),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        child: Row(
                          children: [
                            Icon(
                              Platform.isIOS
                                  ? Icons.arrow_back_ios
                                  : Icons.arrow_back,
                              color: white,
                              size: 18,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              appBarTitle,
                              style: TextStyle(color: white, fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.w400,
                            fontSize: 29,
                            height: 1.5),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

/*
 * AppBar With Search 
 */
class CustomAppBarSearch extends StatelessWidget {
  final TextEditingController controller;
  final String title, buttonTitle;
  final FaIcon icon;

  CustomAppBarSearch(
      {Key key, this.controller, this.title, this.buttonTitle, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).appBarTheme.color,
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 10),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          child: Icon(
                            Platform.isIOS
                                ? Icons.arrow_back_ios
                                : Icons.arrow_back,
                            color: Theme.of(context).iconTheme.color,
                            size: 18,
                          ),
                          onTap: () => Navigator.pop(context),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                  color: grey.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: TextField(
                                  controller: controller,
                                  cursorColor: primary,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Feather.search,
                                      size: 20,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    border: InputBorder.none,
                                    hintText: "Search",
                                    hintStyle: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text(
                            title,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
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
                                buttonTitle,
                                style: TextStyle(
                                  color: white,
                                ),
                              )),
                              SizedBox(width: 10),
                              GestureDetector(
                                child: icon,
                                onTap: () {
                                  print(buttonTitle);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

/* 
 * AppBar With Title And SubTitle
 */
class CustomAppBarWithSubText extends StatelessWidget {
  final String appBarTitle, title, subTitle;

  CustomAppBarWithSubText(
      {Key key, this.appBarTitle, this.title, this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Theme.of(context).appBarTheme.color),
          child: SafeArea(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 10),
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
                          appBarTitle,
                          style: Theme.of(context).textTheme.bodyText2,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 29,
                              height: 1.5),
                        ),
                        SizedBox(height: 20),
                        Text(subTitle),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

/*
 * Category AppBar With Title and SubTitle 
 */
class CustomAppBarCategoryWithSubText extends StatelessWidget {
  final Icon icon;
  final String leftText, rightText;

  CustomAppBarCategoryWithSubText(
      {Key key, this.icon, this.leftText, this.rightText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Theme.of(context).appBarTheme.color),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, right: 15, left: 5),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Container(
                        child: GestureDetector(
                          child: icon,
                          onTap: () {
                            Navigator.pushNamed(context, '/search');
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    height: 30,
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            leftText,
                            style: TextStyle(color: grey, fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: FaIcon(
                            FontAwesomeIcons.solidCircle,
                            size: 5,
                            color: grey,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Text(
                            rightText,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

/* 
 *  Category AppBar With Title, SubTitle and Icon
 */
class CustomAppBarCategoryWithSubTextAndSubIcon extends StatelessWidget {
  final Icon icon;
  final FaIcon subIcon;
  final String leftText, rightText;

  CustomAppBarCategoryWithSubTextAndSubIcon(
      {Key key, this.icon, this.leftText, this.rightText, this.subIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Theme.of(context).appBarTheme.color),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, right: 15),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Container(
                        child: GestureDetector(
                          child: icon,
                          onTap: () {
                            Navigator.pushNamed(context, '/search');
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    height: 30,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    leftText,
                                    style: TextStyle(color: grey, fontSize: 18),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  child: FaIcon(
                                    FontAwesomeIcons.solidCircle,
                                    size: 5,
                                    color: grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  child: Text(
                                    rightText,
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: GestureDetector(
                                child: subIcon,
                                onTap: () {
                                  Navigator.pushNamed(context, '/filter');
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
