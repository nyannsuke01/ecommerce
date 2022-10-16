import 'package:shop_ui/theme/colors.dart';
import 'package:shop_ui/widgets/custom_appbar.dart';
import 'package:shop_ui/widgets/custom_button.dart';
import 'package:shop_ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0),
        child: CustomAppBarWithSubText(
          appBarTitle: 'BACK',
          title: "Forgot Password?",
          subTitle:
              'Please enter your email address and we will send your password by email Immadiatly.',
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
                padding: EdgeInsets.fromLTRB(40, 40, 40, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CustomTextField(obscureText: false, title: 'Email'),
                    SizedBox(height: 30),
                    Container(
                      child: InkWell(
                        child: CustomButton(
                          title: 'SEND',
                          boxColor: Theme.of(context).buttonColor,
                          textColor: white,
                          width: MediaQuery.of(context).size.width - 80,
                          fontWeight: FontWeight.bold,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/update_password');
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
