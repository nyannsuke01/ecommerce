import 'package:flutter_icons/flutter_icons.dart';
import 'package:shop_ui/theme/colors.dart';
import 'package:shop_ui/util/constant.dart';
import 'package:shop_ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class SubcategoryPage extends StatefulWidget {
  @override
  _SubcategoryPageState createState() => _SubcategoryPageState();
}

class _SubcategoryPageState extends State<SubcategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: CustomAppBarCategoryWithSubText(
          icon: Icon(
            Feather.search,
            color: Theme.of(context).iconTheme.color,
          ),
          leftText: 'WOMEN',
          rightText: 'CLOTHING',
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: ListView(
        children: <Widget>[
          for (int i = 0; i < subcategories.length; i++)
            Container(
              padding: EdgeInsets.only(left: 30, right: 30, top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 50,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child:
                                    Image.network(subcategories[i]['imgUrl']),
                              ),
                            ),
                            SizedBox(width: 20),
                            Container(
                              child: Text(
                                subcategories[i]['title'],
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: grey,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: grey.withOpacity(0.8),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
