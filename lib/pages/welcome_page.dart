import 'package:animate_do/animate_do.dart';
import 'package:shop_ui/bloc/app_theme_notifer.dart';
import 'package:shop_ui/theme/colors.dart';
import 'package:shop_ui/util/constant.dart';
import 'package:shop_ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    // call app State from bloc
    final AppStateNotifier appState = Provider.of<AppStateNotifier>(context);
    return Scaffold(
      body: getBody(appState),
    );
  }

  Widget getBody(appState) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              height: size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://sc3.locondo.jp/contents/commodity_image/R0/R06489BU00268_13_l.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Container(
                decoration: BoxDecoration(color: black.withOpacity(0.3)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 60, right: 20),
                      child: InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  'SIGN IN',
                                  style: TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: white,
                                  size: 18,
                                )
                              ],
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/signin');
                        },
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: Text(
                            'Ideal store for your shopping',
                            style: TextStyle(
                              fontSize: 30,
                              height: 1.5,
                              fontWeight: FontWeight.w500,
                              color: white,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(right: 40, left: 40),
                          child: Divider(
                            color: lineWhite,
                          ),
                        ),
                        SizedBox(height: 40),
                        Container(
                          child: InkWell(
                            child: CustomButton(
                              title: 'SIGN UP WITH PHONE OR EMAIL',
                              boxColor: Theme.of(context).appBarTheme.color,
                              textColor: Theme.of(context).primaryColor,
                              width: MediaQuery.of(context).size.width - 80,
                              fontWeight: FontWeight.bold,
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/signup');
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: InkWell(
                            child: CustomButtonIcon(
                              title: 'CONTINUE WITH FACEBOOK',
                              titleColor: white,
                              iconButton: FaIcon(
                                FontAwesomeIcons.facebookSquare,
                                color: white,
                              ),
                              boxColor: Colors.transparent,
                              borderColor: white,
                              width: MediaQuery.of(context).size.width - 80,
                              fontWeight: FontWeight.bold,
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/signup');
                            },
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
