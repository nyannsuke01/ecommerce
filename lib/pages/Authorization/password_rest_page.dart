import 'package:shop_ui/theme/colors.dart';
import 'package:shop_ui/widgets/custom_appbar.dart';
import 'package:shop_ui/widgets/custom_button.dart';
import 'package:shop_ui/widgets/custom_check_circle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordResetPage extends StatefulWidget {
  @override
  _PasswordResetPageState createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomOnlyAppBar(
          elevation: 0.0,
          appBarTitle: 'BACK',
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          SizedBox(height: 60),
          CustomCircleIcon(
            firstWidth: 180,
            firstHeight: 180,
            firstBgColor: white,
            secondBgColor: Theme.of(context).buttonColor,
            midIcon: FaIcon(
              FontAwesomeIcons.lock,
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
              'Hello Bopha!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Your password has been reset!',
            style: TextStyle(
              color: grey,
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: InkWell(
              child: CustomButton(
                title: 'START SHOPING',
                boxColor: Theme.of(context).buttonColor,
                textColor: white,
                width: MediaQuery.of(context).size.width - 80,
                fontWeight: FontWeight.bold,
              ),
              onTap: () {
                print('shoping');
              },
            ),
          ),
        ],
      ),
    );
  }
}
