import 'package:shop_ui/pages/Account/account_page.dart';
import 'package:shop_ui/pages/Authorization/forgot_password_page.dart';
import 'package:shop_ui/pages/Authorization/password_rest_page.dart';
import 'package:shop_ui/pages/Authorization/sign_in_page.dart';
import 'package:shop_ui/pages/Authorization/sign_up_page.dart';
import 'package:shop_ui/pages/Authorization/update_password_page.dart';
import 'package:shop_ui/pages/Cart/checkout_page.dart';
import 'package:shop_ui/pages/Category/category_page.dart';
import 'package:shop_ui/pages/Category/subcategory_page.dart';
import 'package:shop_ui/pages/Collection/collection_page.dart';
import 'package:shop_ui/pages/Explore/dashboard_explore_page.dart';
import 'package:shop_ui/pages/Explore/explore_view_page.dart';
import 'package:shop_ui/pages/Order/order_success.dart';
import 'package:shop_ui/pages/Product/filter_page.dart';
import 'package:shop_ui/pages/Product/product_detail_page.dart';
import 'package:shop_ui/pages/Product/product_list_page.dart';
import 'package:shop_ui/pages/SNS/sns_page.dart';
import 'package:shop_ui/pages/Share/search_page.dart';
import 'package:shop_ui/pages/Share/wishlist_page.dart';
import 'package:shop_ui/pages/Shop/search_shop_page.dart';
import 'package:shop_ui/pages/Shop/shop_detail_page.dart';
import 'package:shop_ui/pages/home_page.dart';
import 'package:shop_ui/pages/preference_page.dart';
import 'package:shop_ui/pages/welcome_page.dart';
import 'package:shop_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'pages/root_tab.dart';

Route<dynamic> generateRoute(RouteSettings setting) {
  switch (setting.name) {
    case '/root_tab':
      return MaterialPageRoute(builder: (context) => RootTabPage());
    case '/home':
      return MaterialPageRoute(builder: (context) => HomePage());
    case '/welcome':
      return MaterialPageRoute(builder: (context) => WelcomePage());
    case '/signin':
      return MaterialPageRoute(builder: (context) => SignInPage());
    case '/signup':
      return MaterialPageRoute(builder: (context) => SignUpPage());
    case '/forgot_password':
      return MaterialPageRoute(builder: (context) => ForgotPasswordPage());
    case '/update_password':
      return MaterialPageRoute(builder: (context) => UpdatePasswordPage());
    case '/password_reset':
      return MaterialPageRoute(builder: (context) => PasswordResetPage());

    case '/preference':
      return MaterialPageRoute(builder: (context) => PreferencePage());

    case '/dashboard_explore':
      return MaterialPageRoute(builder: (context) => DashboardExplorePage());
    case '/explore_view':
      return MaterialPageRoute(builder: (context) => ExploreViewPage());

    case '/collection':
      return MaterialPageRoute(builder: (context) => CollectionPage());

    case '/category':
      return MaterialPageRoute(builder: (context) => CategoryPage());
    case '/subcategory':
      return MaterialPageRoute(builder: (context) => SubcategoryPage());

    case '/product_detail':
      final Map args = setting.arguments as Map;
      return MaterialPageRoute(
          builder: (context) => ProductDetailPage(product: args["product"]));

    case '/product_list':
      return MaterialPageRoute(builder: (context) => ProductListPage());
    case '/filter':
      return MaterialPageRoute(builder: (context) => FilterPage());

    case '/checkout':
      return MaterialPageRoute(builder: (context) => CheckoutPage());

    case '/wishlist':
      return MaterialPageRoute(builder: (context) => WishlistPage());
    case '/search':
      return MaterialPageRoute(builder: (context) => SearchPage());

    case '/order_success':
      return MaterialPageRoute(builder: (context) => OrderSuccessPage());

    case '/search_shop':
      return MaterialPageRoute(builder: (context) => SearchShopPage());
    case '/shop_detail':
      return MaterialPageRoute(builder: (context) => ShopDetailPage());

    case '/account':
      return MaterialPageRoute(builder: (context) => AccountPage());

    case '/sns':
      return MaterialPageRoute(builder: (context) => SnsPage());


    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
                appBar: AppBar(
                  elevation: 0.0,
                  leading: Container(
                    child: InkWell(
                      child: Icon(
                        Platform.isIOS
                            ? Icons.arrow_back_ios
                            : Icons.arrow_back,
                        color: black,
                        size: 18,
                      ),
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                ),
                body: Center(
                  child: Text(
                    "UNDEFINED ROUTE",
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ));
  }
}
