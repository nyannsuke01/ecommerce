import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CustomHomePageTitle extends StatelessWidget {
  final String title, suffixTitle;
  final double titleFontSize;
  final Color suffixColor;
  final Icon suffixIcon;

  CustomHomePageTitle(
      {Key key,
      this.title,
      this.titleFontSize,
      this.suffixTitle,
      this.suffixIcon,
      this.suffixColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 40, 15, 20),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: titleFontSize,
                ),
              ),
            ),
            Container(
              child: GestureDetector(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        suffixTitle,
                        style: TextStyle(
                          color: suffixColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      child: suffixIcon,
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/product_list');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
