import 'package:flutter/material.dart';
import 'package:shop_ui/theme/colors.dart';

/*
 * Text Field
 */
class CustomTextField extends StatelessWidget {
  final String title;
  final bool obscureText;

  CustomTextField({Key key, this.title, this.obscureText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: title,
        labelStyle: TextStyle(color: Theme.of(context).primaryColor),
      ),
    );
  }
}

/* 
 * Password Field
 */
class CustomPasswordField extends StatelessWidget {
  final String title, suffixText, routeName;
  final double fontSize;

  CustomPasswordField(
      {Key key,
      this.title,
      this.suffixText,
      this.fontSize = 12.0,
      this.routeName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: title,
        labelStyle: TextStyle(color: Theme.of(context).primaryColor),
        suffix: Container(
          child: GestureDetector(
            child: Container(
              child: Text(
                suffixText,
                style: TextStyle(
                    fontSize: fontSize, color: Theme.of(context).primaryColor),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, routeName);
            },
          ),
        ),
      ),
    );
  }
}
