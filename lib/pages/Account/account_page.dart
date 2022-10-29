import 'package:provider/provider.dart';
import 'package:shop_ui/bloc/app_theme_notifer.dart';
import 'package:shop_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final AppStateNotifier appState = Provider.of<AppStateNotifier>(context);
    return getBody(appState);
  }

  Widget getBody(appState) {
    List listTiles = [
      "アカウント詳細",
      "ご利用ガイド",
      "通知設定",
      "メール通知設定",
      "お支払い設定",
      "プライバシーポリシー",
      "個人情報保護ポリシー"
    ];
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: Row(
            children: <Widget>[
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1616597082843-de7ce757d548?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0N3x8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Daniel",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Member since 2019",
                    style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).primaryColor.withOpacity(0.7)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                      color: Theme.of(context).buttonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {},
                      child: Text(
                        "アカウント編集",
                        style: TextStyle(color: white, fontSize: 13),
                      ))
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.box,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Orders",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.mapMarkerAlt,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "My Address",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.cog,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Settings",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Divider(
          thickness: 1,
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              Column(
                children: List.generate(
                    listTiles.length,
                    (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    listTiles[index],
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.5),
                                    size: 17,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Divider(
                                color: grey.withOpacity(0.8),
                              )
                            ],
                          ),
                        )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "ダークモード",
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                    activeColor: accent,
                    value: Provider.of<AppStateNotifier>(context).isDarkModeOn,
                    onChanged: (boolVal) {
                      // change theme here
                      appState.updateTheme(boolVal);
                    },
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                color: grey.withOpacity(0.8),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 130,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Theme.of(context).buttonColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          "設定",
                          style: TextStyle(color: white, fontSize: 15),
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: 130,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            "サインアウト",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor, fontSize: 15),
                          ),
                        ),
                      ),
                      onTap: () {
                        goToSignOut();
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        )
      ],
    );
  }
  goToSignOut() {
    Navigator.pushNamed(context, '/welcome');
  }
}
