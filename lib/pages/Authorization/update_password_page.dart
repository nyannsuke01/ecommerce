import 'package:shop_ui/theme/colors.dart';
import 'package:shop_ui/widgets/custom_appbar.dart';
import 'package:shop_ui/widgets/custom_button.dart';
import 'package:shop_ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class UpdatePasswordPage extends StatefulWidget {
  @override
  _UpdatePasswordPageState createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(210.0),
        child: CustomAppBarWithSubText(
          appBarTitle: 'BACK',
          title: 'Update your\npassword',
          subTitle: 'Please enter your new password',
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CustomTextField(obscureText: true, title: 'Password'),
                    SizedBox(height: 20),
                    CustomTextField(
                        obscureText: true, title: 'Confirm password'),
                    SizedBox(height: 30),
                    Container(
                      child: InkWell(
                        child: CustomButton(
                          title: 'RESET PASSWORD',
                          boxColor: Theme.of(context).buttonColor,
                          textColor: white,
                          width: MediaQuery.of(context).size.width - 80,
                          fontWeight: FontWeight.bold,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/password_reset');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
