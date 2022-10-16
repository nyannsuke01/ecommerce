import 'package:shop_ui/theme/colors.dart';
import 'package:shop_ui/widgets/custom_button.dart';
import 'package:shop_ui/widgets/custom_check_circle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/*
 * Alert Dialog With Image
 */
class CustomShopAlertDialogWithImage extends StatelessWidget {
  final String imgUrl, titleButton, description;

  CustomShopAlertDialogWithImage({
    Key key,
    this.imgUrl,
    this.titleButton,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: Theme.of(context).appBarTheme.color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Container(
        height: 500,
        width: 400,
        child: Stack(
          children: <Widget>[
            Container(
              height: 400,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                image: DecorationImage(
                  image: NetworkImage(imgUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 500,
              width: size.width,
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          child: FaIcon(
                            FontAwesomeIcons.times,
                            color: white,
                            size: 20,
                          ),
                          onTap: () =>
                              Navigator.of(context, rootNavigator: true)
                                  .pop('dialog'),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 335),
                    child: InkWell(
                      child: CustomButton(
                        title: titleButton,
                        boxColor: Theme.of(context).buttonColor,
                        textColor: white,
                        width: 200,
                        fontWeight: FontWeight.bold,
                      ),
                      onTap: () {
                        print(titleButton);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Text(
                        description,
                        textAlign: TextAlign.center,
                        style: TextStyle(height: 1.5),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
 * Alert Dialog With Icon 
 */
class CustomAlertDialogWithIcon extends StatelessWidget {
  final double width, height;
  final Color circleBackgroundColor, circleAfterBackgroundColor;
  final FaIcon midIcon, bottomRightIcon;
  final title, subTitle, buttonTitle;

  CustomAlertDialogWithIcon(
      {Key key,
      this.height,
      this.width,
      this.circleBackgroundColor,
      this.circleAfterBackgroundColor,
      this.midIcon,
      this.bottomRightIcon,
      this.title,
      this.subTitle,
      this.buttonTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Container(
        height: height,
        width: width,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.times,
                        color: grey,
                        size: 20,
                      ),
                      onPressed: () => Navigator.pop(context)),
                ],
              ),
            ),
            CustomCircleIcon(
              firstWidth: 160,
              firstHeight: 160,
              firstBgColor: white,
              secondBgColor: Theme.of(context).buttonColor,
              midIcon: FaIcon(
                FontAwesomeIcons.shoppingBag,
                color: white,
                size: 50,
              ),
              bottomRightIconHeight: 35,
              bottomRightIconWidth: 35,
              bottomRightIcon: FaIcon(
                FontAwesomeIcons.check,
                color: white,
                size: 15,
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Text(
                title,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Text(subTitle),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: InkWell(
                child: CustomButton(
                  title: buttonTitle,
                  boxColor: Theme.of(context).buttonColor,
                  textColor: white,
                  width: MediaQuery.of(context).size.width,
                  fontWeight: FontWeight.bold,
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/order_success');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
