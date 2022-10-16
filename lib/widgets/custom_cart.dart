import 'package:shop_ui/theme/colors.dart';
import 'package:flutter/material.dart';

/*
 * Product Cart 
 */
class CustomProductCart extends StatelessWidget {
  final String title, imgUrl, price;
  final BoxFit imgFit;
  final double width, height, titleHeight, borderRadius;
  final FontWeight fontWeight;
  final Color priceColor;

  CustomProductCart(
      {Key key,
      this.height,
      this.width,
      this.imgUrl,
      this.imgFit,
      this.borderRadius,
      this.titleHeight,
      this.title,
      this.fontWeight = FontWeight.bold,
      this.price,
      this.priceColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imgUrl),
                fit: imgFit,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: titleHeight,
            width: width,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontWeight: fontWeight,
                            height: 1.5,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Text(
                          '\$' + price,
                          style: TextStyle(
                              color: priceColor, fontWeight: fontWeight),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*
 * Category Cart 
 */
class CustomCategoryCart extends StatelessWidget {
  final String title, imgUrl;
  final BoxFit imgFit;
  final double width, height, borderRadius, fontSize;
  final FontWeight fontWeight;
  final Color titleColor;

  CustomCategoryCart(
      {Key key,
      this.title,
      this.imgUrl,
      this.imgFit,
      this.width,
      this.height,
      this.borderRadius,
      this.fontSize,
      this.fontWeight,
      this.titleColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            height: height,
            width: width,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imgUrl),
                      fit: imgFit,
                    ),
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                title,
                style: TextStyle(
                  color: titleColor,
                  fontWeight: fontWeight,
                  fontSize: fontSize,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
 * Circle Explore Cart 
 */
class CustomCircleExploreCart extends StatelessWidget {
  final String title, imgUrl;

  CustomCircleExploreCart({
    Key key,
    this.title,
    this.imgUrl,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              image: DecorationImage(
                image: NetworkImage(imgUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 40,
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomExploreProductCart extends StatelessWidget {
  final String title, subTitle, imgUrl;
  final Color textColor;
  final double titleSize, subTitleSize;

  CustomExploreProductCart(
      {Key key,
      this.title,
      this.subTitle,
      this.imgUrl,
      this.textColor,
      this.titleSize,
      this.subTitleSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage(imgUrl), fit: BoxFit.cover),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black.withOpacity(0.2),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      color: textColor,
                      fontSize: titleSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    subTitle,
                    style: TextStyle(color: textColor, fontSize: subTitleSize),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
 * Wishlist Cart 
 */
class CustomWishlistCart extends StatelessWidget {
  final String title, imgUrl, price;
  final BoxFit imgFit;
  final double width, height, titleHeight, borderRadius;
  final FontWeight fontWeight;
  final Color priceColor;

  CustomWishlistCart(
      {Key key,
      this.height,
      this.width,
      this.imgUrl,
      this.imgFit,
      this.borderRadius,
      this.titleHeight,
      this.title,
      this.fontWeight = FontWeight.bold,
      this.price,
      this.priceColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(imgUrl),
                        fit: imgFit,
                      ),
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                  ),
                  onTap: () {
                    var product = {
                      "imgUrl": imgUrl,
                      "price": price,
                      "title": title
                    };
                    Navigator.pushNamed(context, '/product_detail',
                        arguments: {'product': product});
                  },
                ),
                Positioned(
                  bottom: 15,
                  right: 10,
                  child: Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Theme.of(context).buttonColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: InkWell(
                        child: Text(
                          'CHOOSE A SIZE',
                          style: TextStyle(color: white, fontSize: 12),
                        ),
                        onTap: () {
                          print('choose size');
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: titleHeight,
            width: width,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            title,
                            style: TextStyle(
                              fontWeight: fontWeight,
                              height: 1.5,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Text(
                            '\$' + price,
                            style: TextStyle(
                                color: priceColor, fontWeight: fontWeight),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      var product = {
                        "imgUrl": imgUrl,
                        "price": price,
                        "title": title
                      };
                      Navigator.pushNamed(context, '/product_detail',
                          arguments: {'product': product});
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
