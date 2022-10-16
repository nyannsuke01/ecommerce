import 'dart:io';

import 'package:shop_ui/theme/colors.dart';
import 'package:shop_ui/widgets/custom_button.dart';
import 'package:shop_ui/widgets/custom_check_circle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderSuccessPage extends StatefulWidget {
  @override
  _OrderSuccessPageState createState() => _OrderSuccessPageState();
}

class _OrderSuccessPageState extends State<OrderSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
            color: Theme.of(context).iconTheme.color,
            size: 18,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            SizedBox(height: 40),
            CustomCircleIcon(
              firstWidth: 180,
              firstHeight: 180,
              firstBgColor: white,
              secondBgColor: Theme.of(context).buttonColor,
              midIcon: FaIcon(
                FontAwesomeIcons.box,
                color: white,
                size: 60,
              ),
              bottomRightIconWidth: 40,
              bottomRightIconHeight: 40,
              bottomRightIcon: FaIcon(
                FontAwesomeIcons.check,
                color: white,
                size: 20,
              ),
            ),
            SizedBox(height: 60),
            Container(
              child: Text(
                'Order Success!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width - 80,
              child: Text(
                'Your order has been placed successfully! For more details, go to my orders.',
                style: TextStyle(
                  color: grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 200),
            Container(
              child: InkWell(
                  child: CustomButtonBorder(
                    title: 'MY ORDERS',
                    boxColor: Colors.transparent,
                    borderColor: Theme.of(context).primaryColor,
                    titleColor: Theme.of(context).primaryColor,
                    width: MediaQuery.of(context).size.width - 80,
                    fontWeight: FontWeight.normal,
                  ),
                  onTap: () {
                    print('my order');
                  }),
            ),
            SizedBox(height: 10),
            Container(
              child: InkWell(
                child: CustomButton(
                  title: 'CONTINUE SHOPING',
                  boxColor: Theme.of(context).buttonColor,
                  textColor: white,
                  width: MediaQuery.of(context).size.width - 80,
                  fontWeight: FontWeight.bold,
                ),
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/root_tab', (Route<dynamic> route) => false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
