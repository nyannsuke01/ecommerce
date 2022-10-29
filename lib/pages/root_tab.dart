import 'package:shop_ui/pages/Account/account_page.dart';
import 'package:shop_ui/pages/Cart/cart_page.dart';
import 'package:shop_ui/pages/More/more_page.dart';
import 'package:shop_ui/pages/Shop/search_shop_page.dart';
import 'package:shop_ui/pages/home_page.dart';
import 'package:shop_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../theme/app_theme.dart';
import 'SNS/sns_page.dart';

class RootTabPage extends StatefulWidget {
  int activePage = 0;
  RootTabPage({this.activePage});

  @override
  State<StatefulWidget> createState() {
    return _TabbarState();
  }
}

class _TabbarState extends State<RootTabPage> {
  // int _currentIndex = 0;

  int _pageIndex = 0;
  String _page = 'Shop UI';
  AppBar _appbar = null;

  var children2 = <Widget>[
    HomePage(),
    SearchShopPage(),
    SnsPage(),
    CartPage(),
    AccountPage(),
  ];

  @override
  void initState() {
    super.initState();

    // if (mounted) {
    //   setState(() {
    //     _pageIndex =
    //         [0, '', null].contains(widget.activePage) ? 0 : widget.activePage;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    // var _l10n = PackedLocalizations.of(context);
    var unSelectedIconColor  = context.isDarkMode ?
    Color.fromRGBO(255, 255, 255, 0.3):Color.fromRGBO(0, 0, 0, 0.3);
    return Scaffold(
      appBar: _appbar,
      body: IndexedStack(
        index: _pageIndex,
        children: children2,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,

        selectedItemColor: accent,
        unselectedItemColor: Color.fromRGBO(255, 255, 255, 0.3),

        //unselectedItemColor
        // fixedColor: Colors.black,theme: AppTheme.lightTheme,
        type: BottomNavigationBarType.fixed,
        // onTap: onTabTapped,
        onTap: (index) {
          setState(() {
            _pageIndex = index;
            switch (_pageIndex) {
              case 0:
                _page = "Home Page";
                _appbar = null;
                break;
              case 1:
                _page = "Check Room";
                _appbar = null;
                break;
              case 2:
                _page = "SNS";
                _appbar = null;
                break;
              case 3:
                _page = "Cart";
                _appbar = AppBar(
                  elevation: 0.8,
                  title: Text(
                    "CART",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                );
                break;
              case 4:
                _page = "Account";
                _appbar = AppBar(
                  elevation: 0.8,
                  title: Text(
                    "ACCOUNT",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                );
                break;
            }
          });
        },
        currentIndex: _pageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 28,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.checkroom_outlined,
                size: 28,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.share,
                size: 22,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.shoppingBag,
                size: 22,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.userAlt,
                size: 21,
              ),
              label: "")
        ],
      ),
    );
  }
}
extension DarkMode on BuildContext {
  /// is dark mode currently enabled?
  bool get isDarkMode {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }
}
