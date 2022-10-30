import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_ui/theme/colors.dart';
import 'package:shop_ui/widgets/custom_appbar.dart';
import 'package:shop_ui/widgets/custom_button.dart';
import 'package:shop_ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isRemember;
  String _email = '';
  String _password = '';

  @override
  void initState() {
    super.initState();
    _isRemember = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0),
        child: CustomAppBar(
          appBarTitle: 'BACK',
          title: "Login into \nyour account",
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
                    // 1行目 メールアドレス入力用テキストフィールド
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'メールアドレス'),
                      onChanged: (String value) {
                        setState(() {
                          _email = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    // 2行目 パスワード入力用テキストフィールド
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'パスワード'),
                      obscureText: true,
                      onChanged: (String value) {
                        setState(() {
                          _password = value;
                        });
                      },
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
                        value: _isRemember,
                        activeColor: Theme.of(context).buttonColor,
                        onChanged: (bool value) {
                          setState(() {
                            _isRemember = value;
                          });
                        }),
                    Text('Remember me'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: InkWell(
                  child: CustomButton(
                    title: 'SIGN IN',
                    boxColor: Theme.of(context).buttonColor,
                    textColor: white,
                    width: MediaQuery.of(context).size.width - 80,
                    fontWeight: FontWeight.bold,
                  ),
                  onTap: () async {
                    try {
                      // メール/パスワードでログイン
                      final FirebaseUser user = (await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                          email: _email, password: _password));
                      if (user != null)
                        print("ログインしました　${user.email} , ${user.uid}");
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: InkWell(
                  child: CustomButtonIcon(
                    title: 'SIGN IN WITH FACEBOOK',
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
                    print('fb');
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  signIn() {

  }

  gotoHome() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/root_tab', (Route<dynamic> route) => false);
  }
}
