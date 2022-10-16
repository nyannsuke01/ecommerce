import 'package:shop_ui/theme/colors.dart';
import 'package:shop_ui/widgets/custom_appbar.dart';
import 'package:shop_ui/widgets/custom_button.dart';
import 'package:shop_ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isAgree;

  @override
  void initState() {
    super.initState();
    _isAgree = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0),
        child: CustomAppBar(
          appBarTitle: 'BACK',
          title: "Create your \naccount",
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
                    CustomTextField(
                      title: 'Name',
                      obscureText: false,
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      title: 'Email',
                      obscureText: false,
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      title: 'Password',
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.only(left: 30),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Checkbox(
                        value: _isAgree,
                        activeColor: Theme.of(context).buttonColor,
                        onChanged: (bool value) {
                          setState(() {
                            _isAgree = value;
                          });
                        }),
                    Text('You agree the term and privacy policy'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: InkWell(
                  child: CustomButton(
                    title: 'SIGN UP',
                    boxColor: Theme.of(context).buttonColor,
                    textColor: white,
                    width: MediaQuery.of(context).size.width - 80,
                    fontWeight: FontWeight.bold,
                  ),
                  onTap: () {
                    goToPreference();
                  },
                ),
              ),
              SizedBox(height: 15),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(width: 120, height: 1, color: lineGrey),
                    SizedBox(width: 5),
                    Text(
                      'OR',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(width: 5),
                    Container(width: 120, height: 1, color: lineGrey),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                child: InkWell(
                  child: CustomButtonIcon(
                    title: 'SIGN UP WITH FACEBOOK',
                    titleColor: white,
                    iconButton: FaIcon(
                      FontAwesomeIcons.facebookSquare,
                      color: white,
                    ),
                    boxColor: bgButtonBlue,
                    borderColor: bgButtonBlue,
                    width: MediaQuery.of(context).size.width - 80,
                    fontWeight: FontWeight.bold,
                  ),
                  onTap: () {
                    goToPreference();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  goToPreference() {
    Navigator.pushNamed(context, '/preference');
  }
}
