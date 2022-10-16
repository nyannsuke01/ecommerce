import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/*
 * Simple Button 
 */
class CustomButton extends StatelessWidget {
  final String title;
  final Color boxColor, textColor;
  final double width, height, fontSize;
  final FontWeight fontWeight;

  CustomButton(
      {Key key,
      this.title,
      this.boxColor,
      this.textColor,
      this.width,
      this.height = 45.0,
      this.fontSize = 16,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: textColor, fontWeight: fontWeight),
        ),
      ),
    );
  }
}

/*
 * Outline Button 
 */
class CustomButtonBorder extends StatelessWidget {
  final String title;
  final Color boxColor, borderColor, titleColor;
  final double width, height;
  final FontWeight fontWeight;

  CustomButtonBorder(
      {Key key,
      this.title,
      this.boxColor,
      this.borderColor,
      this.titleColor,
      this.width,
      this.height = 45.0,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(height / 2),
        border: Border.all(color: borderColor),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: titleColor, fontWeight: fontWeight),
        ),
      ),
    );
  }
}

/*
 * Button With Icon 
 */
class CustomButtonIcon extends StatelessWidget {
  final String title;
  final Color boxColor, titleColor, borderColor;
  final double width, height, fontSize;
  final FontWeight fontWeight;
  final FaIcon iconButton;

  CustomButtonIcon(
      {Key key,
      this.title,
      this.titleColor,
      this.iconButton,
      this.boxColor,
      this.borderColor,
      this.width,
      this.height = 45.0,
      this.fontSize = 16,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(height / 2),
        border: Border.all(color: borderColor),
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            iconButton,
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(color: titleColor, fontWeight: fontWeight),
            ),
          ],
        ),
      ),
    );
  }
}
