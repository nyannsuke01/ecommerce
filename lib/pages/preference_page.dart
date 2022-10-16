import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:shop_ui/theme/colors.dart';
import 'package:shop_ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PreferencePage extends StatefulWidget {
  @override
  _PreferencePageState createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.zero,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        // walk thru WOMEN MEN 選択　正面画像
                          'https://shopping.line-scdn.net/0hkjYYodiRNEVkIB1MBElLEjZ9KDQSUW1SGxguZxNldCEZEyMRCBQvdkYlYiYaFycQUUFyIBIobydJEnFAXEVzTUAhOiZOFXMbWxR_I0QgL3QbQCMbXUUv/r800'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Platform.isIOS
                                        ? Icons.arrow_back_ios
                                        : Icons.arrow_back,
                                    color: white,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "BACK",
                                    style:
                                        TextStyle(color: white, fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                'Make your \npurchases as',
                                style: TextStyle(color: white, fontSize: 30),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 1,
                              decoration: BoxDecoration(
                                color: lineGrey,
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: <Widget>[
                                Container(
                                  child: InkWell(
                                    child: CustomButton(
                                      title: 'WOMEN',
                                      boxColor: white,
                                      textColor: black,
                                      width: (size.width - 90) / 2,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    onTap: () {
                                      goToHome();
                                    },
                                  ),
                                ),
                                Container(
                                  child: InkWell(
                                      child: CustomButtonBorder(
                                        title: 'MEN',
                                        boxColor: Colors.transparent,
                                        borderColor: white,
                                        titleColor: white,
                                        width: (size.width - 90) / 2,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      onTap: () {
                                        goToHome();
                                      }),
                                ),
                                SizedBox(width: 10),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  goToHome() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/root_tab', (Route<dynamic> route) => false);
  }
}
