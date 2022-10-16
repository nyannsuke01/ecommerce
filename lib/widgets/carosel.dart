import 'package:carousel_slider/carousel_slider.dart';
import 'package:shop_ui/theme/colors.dart';
import 'package:shop_ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class ActiveDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 25,
        height: 8,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

class InactiveDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: grey,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

/*
 * for slider home page
 */
class CustomeCarouselHomePage extends StatefulWidget {
  final List<String> items;

  CustomeCarouselHomePage({this.items});

  @override
  _CustomeCarouselHomePageState createState() =>
      _CustomeCarouselHomePageState();
}

class _CustomeCarouselHomePageState extends State<CustomeCarouselHomePage> {
  int activeIndex = 0;
  setActiveDot(index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          child: CarouselSlider(
            onPageChanged: (index) {
              setActiveDot(index);
            },
            autoPlayCurve: Curves.fastLinearToSlowEaseIn,
            autoPlayAnimationDuration: Duration(seconds: 2),
            viewportFraction: 1.0,
            items: widget.items.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Stack(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image(
                          image: NetworkImage(item),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ],
                  );
                },
              );
            }).toList(),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 10,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: List.generate(widget.items.length, (idx) {
                return activeIndex == idx ? ActiveDot() : InactiveDot();
              })),
        )
      ],
    );
  }
}

/*
 * for explore page
 */
class CustomCarouselExplore extends StatefulWidget {
  final List slides;

  CustomCarouselExplore({Key key, this.slides}) : super(key: key);
  @override
  _CustomCarouselExploreState createState() => _CustomCarouselExploreState();
}

class _CustomCarouselExploreState extends State<CustomCarouselExplore> {
  int activeIndex = 0;
  setActiveDot(index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Container(
            height: 200,
            child: CarouselSlider(
              onPageChanged: (index) {
                setActiveDot(index);
              },
              autoPlayCurve: Curves.fastLinearToSlowEaseIn,
              autoPlayAnimationDuration: Duration(seconds: 2),
              viewportFraction: 1.0,
              items: widget.slides.map((slide) {
                var year = slide['year'];
                var title = slide['title'];
                var description = slide['description'];
                var buttonTitle = slide['buttonTitle'];
                return Builder(builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                year,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: Text(
                                title,
                                style: TextStyle(
                                  color: white,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              child: Text(
                                description,
                                style: TextStyle(color: white),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: InkWell(
                                child: CustomButtonBorder(
                                  title: buttonTitle,
                                  boxColor: Colors.transparent,
                                  borderColor: bgButtonWhite,
                                  titleColor: white,
                                  width: 180,
                                  fontWeight: FontWeight.normal,
                                ),
                                onTap: () {
                                  print('see');
                                },
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 10,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children:
                                  List.generate(widget.slides.length, (idx) {
                                return activeIndex == idx
                                    ? ActiveDot()
                                    : InactiveDot();
                              })),
                        )
                      ],
                    ),
                  );
                });
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

/*
 * for product detail 
*/
class CustomCarouselProduct extends StatefulWidget {
  final List slides;

  CustomCarouselProduct({Key key, this.slides}) : super(key: key);

  @override
  _CustomCarouselProductState createState() => _CustomCarouselProductState();
}

class _CustomCarouselProductState extends State<CustomCarouselProduct> {
  int activeIndex = 0;

  setActiveDot(index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            child: CarouselSlider(
              height: 500,
              onPageChanged: (index) {
                setActiveDot(index);
              },
              autoPlayCurve: Curves.fastLinearToSlowEaseIn,
              autoPlayAnimationDuration: Duration(seconds: 2),
              viewportFraction: 1.0,
              items: widget.slides.map((slide) {
                return Builder(builder: (BuildContext context) {
                  return Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(slide),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 35, 10, 0),
                          child: IconButton(
                            icon: Icon(
                              Platform.isIOS
                                  ? Icons.arrow_back_ios
                                  : Icons.arrow_back,
                              color: white,
                              size: 18,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ),
                    ],
                  );
                });
              }).toList(),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: List.generate(widget.slides.length, (idx) {
                  return activeIndex == idx ? ActiveDot() : InactiveDot();
                })),
          )
        ],
      ),
    );
  }
}
