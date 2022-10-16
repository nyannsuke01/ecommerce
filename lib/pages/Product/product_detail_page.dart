import 'package:shop_ui/theme/colors.dart';
import 'package:shop_ui/util/constant.dart';
import 'package:shop_ui/util/global.dart';
import 'package:shop_ui/widgets/carosel.dart';
import 'package:shop_ui/widgets/custom_button.dart';
import 'package:shop_ui/widgets/custom_cart.dart';
import 'package:shop_ui/widgets/custom_homepage_title.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductDetailPage extends StatefulWidget {
  final dynamic product;

  const ProductDetailPage({Key key, this.product}) : super(key: key);
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  List slides = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    slides.add(widget.product['imgUrl']);
    slides.addAll(productDetail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            child: CustomCarouselProduct(
              slides: slides,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    '\$ ${widget.product['price']}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    '${widget.product['title']}',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        for (int i = 0; i < colors.length; i++)
                          Container(
                            padding: EdgeInsets.only(left: i == 0 ? 0 : 20),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: colors[i]['title'],
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                if (i == (colors.length - 1))
                                  Positioned(
                                    top: 1,
                                    left: 2,
                                    child: Icon(Icons.check,
                                        size: 16, color: white),
                                  ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        for (int j = 0; j < sizes.length; j++)
                          Container(
                            padding: EdgeInsets.only(
                                left: j == 0 ? 20 : 20, right: j == 4 ? 20 : 0),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: j == 0
                                        ? Theme.of(context).buttonColor
                                        : white,
                                    border: Border.all(
                                      color: j == 0
                                          ? Theme.of(context).buttonColor
                                          : black,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      sizes[j]['title'],
                                      style: TextStyle(
                                        color: j == 0 ? white : black,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Description',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    'Fluid fabric. Overlay. Wide braces. V-neck. Elastic waist. Inside the long leg 5.0 cm. Sleeve length. 56.5 cm. Back long 22.0 cm. These measurements are calculated for a size S.',
                    style: TextStyle(fontSize: 12, color: grey),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        child: CustomButton(
                          title: 'ADD TO CART',
                          boxColor: Theme.of(context).buttonColor,
                          textColor: white,
                          width: MediaQuery.of(context).size.width,
                          fontWeight: FontWeight.bold,
                        ),
                        onTap: () => addToCart(),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        child: CustomButtonBorder(
                          title: 'ADD TO WISHLIST',
                          boxColor: Colors.transparent,
                          borderColor: Theme.of(context).primaryColor,
                          titleColor: Theme.of(context).primaryColor,
                          width: MediaQuery.of(context).size.width,
                          fontWeight: FontWeight.normal,
                        ),
                        onTap: () => addToWishlist(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: 0.5,
                  decoration: BoxDecoration(color: Colors.grey),
                ),
                CustomHomePageTitle(
                  title: 'You might also like',
                  titleFontSize: 18,
                  suffixTitle: 'All',
                  suffixColor: grey,
                  suffixIcon:
                      Icon(Icons.arrow_forward_ios, color: grey, size: 18),
                ),
                Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        for (int j = 0; j < recommends.length; j++)
                          Container(
                            margin: EdgeInsets.only(
                                left: j == 0 ? 15 : 10, right: j == 4 ? 15 : 0),
                            child: InkWell(
                              child: CustomProductCart(
                                height: 180,
                                width: 140,
                                imgUrl: recommends[j]['imgUrl'],
                                imgFit: BoxFit.cover,
                                borderRadius: 5,
                                titleHeight: 100,
                                title: recommends[j]['title'],
                                price: recommends[j]['price'],
                                priceColor: grey,
                              ),
                              onTap: () {
                                goToProduct(recommends[j]);
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }

  addToCart() {
    onAddToCart(
        context,
        FaIcon(
          FontAwesomeIcons.shoppingBag,
          color: white,
          size: 60,
        ),
        FaIcon(FontAwesomeIcons.solidCheckCircle, color: success, size: 40),
        'Success!',
        '1 product has been add to your cart!',
        'CHECKOUT');
  }

  goToProduct(product) {
    Navigator.pushNamed(context, '/product_detail',
        arguments: {'product': product});
  }

  addToWishlist() {
    Navigator.pushNamed(context, '/wishlist');
  }
}
