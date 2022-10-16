import 'package:flutter_icons/flutter_icons.dart';
import 'package:shop_ui/theme/colors.dart';
import 'package:shop_ui/util/constant.dart';
import 'package:shop_ui/widgets/custom_appbar.dart';
import 'package:shop_ui/widgets/custom_cart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: CustomAppBarCategoryWithSubTextAndSubIcon(
          icon: Icon(
            Feather.search,
            color: Theme.of(context).iconTheme.color,
          ),
          leftText: 'CLOTHING',
          rightText: 'T-SHIRTS',
          subIcon: FaIcon(
            FontAwesomeIcons.slidersH,
            color: Theme.of(context).iconTheme.color,
            size: 18,
          ),
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Container(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15),
            child: Wrap(
                spacing: 15,
                children: List.generate(recently.length, (index) {
                  return InkWell(
                    child: CustomProductCart(
                      height: 220,
                      width: (size.width - 45) / 2,
                      imgUrl: recently[index]['imgUrl'],
                      imgFit: BoxFit.cover,
                      borderRadius: 5,
                      titleHeight: 100,
                      title: recently[index]['title'],
                      price: recently[index]['price'],
                      priceColor: grey,
                    ),
                    onTap: () {
                      goToProduct(recently[index]);
                    },
                  );
                })),
          ),
        ],
      ),
    );
  }

  goToProduct(product) {
    Navigator.pushNamed(context, '/product_detail',
        arguments: {'product': product});
  }
}
