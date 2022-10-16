import 'package:shop_ui/theme/colors.dart';
import 'package:flutter/material.dart';

class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    List menus = [
      "Home",
      "Explore",
      "Stores",
      "Cart",
      "Notifications",
      "Loyalty Card",
      "My orders"
    ];
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
          child: Row(
            children: <Widget>[
              Container(
                width: 70,
                height: 70,
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
                    "4 Orders",
                    style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).primaryColor.withOpacity(0.7)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Divider(
          color: grey.withOpacity(0.8),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
                menus.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Text(
                        menus[index],
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 23),
                      ),
                    )),
          ),
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
                width: (size.width - 100) / 2,
                height: 50,
                decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Text(
                    "Settings",
                    style: TextStyle(color: white, fontSize: 15),
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  width: (size.width - 100) / 2,
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
                      "Sign Out",
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
    );
  }

  goToSignOut() {
    Navigator.pushNamed(context, '/welcome');
  }
}
