import 'package:shop_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCircleIcon extends StatelessWidget {
  final double firstWidth,
      firstHeight,
      bottomRightIconWidth,
      bottomRightIconHeight;
  final Color firstBgColor, secondBgColor;
  final FaIcon midIcon, bottomRightIcon;

  CustomCircleIcon(
      {Key key,
      this.firstWidth,
      this.firstHeight,
      this.firstBgColor,
      this.secondBgColor,
      this.midIcon,
      this.bottomRightIcon,
      this.bottomRightIconWidth,
      this.bottomRightIconHeight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: firstWidth,
            height: firstHeight,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: firstBgColor,
              boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: secondBgColor,
                      ),
                    ),
                  ),
                  Positioned(
                    child: Center(
                      child: midIcon,
                    ),
                  ),
                  Container(
                    width: firstWidth,
                    height: firstHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: bottomRightIconWidth,
                          height: bottomRightIconHeight,
                          decoration: BoxDecoration(
                              color: success, shape: BoxShape.circle),
                          child: Center(
                            child: bottomRightIcon,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
