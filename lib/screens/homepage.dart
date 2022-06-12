import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zig/widgets/borderbox.dart';
import 'package:zig/widgets/widget_functions.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    double padding = 25;
    var sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color(0xff080C15),
        body: Stack(
          children: [
            SingleChildScrollView(
              // physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const BorderBox(
                          padding: EdgeInsets.all(50),
                          width: 50,
                          height: 50,
                          color: Colors.white,
                          child: Icon(
                            Icons.menu,
                            // color: Color(0xff7C68EE),
                          ),
                        ),
                        Text(
                          user.email!,
                          style: TextStyle(color: Color(0xff7C68EE)),
                        ),
                        InkWell(
                          onTap: () async {
                            await FirebaseAuth.instance.signOut();
                          },
                          child: BorderBox(
                            padding: EdgeInsets.all(50),
                            width: 50,
                            height: 50,
                            color: Colors.white,
                            child: Icon(
                              Icons.logout,
                              // color: Color(0xff7C68EE),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ), //Custom AppBar
                  addVerticalSpace(padding),
                  CarouselSlider(
                    options: CarouselOptions(height: 500.0),
                    items: [
                      1,
                      2,
                      3,
                      4,
                      5,
                      6,
                      7,
                      8,
                      9,
                      10,
                      11,
                      12,
                      13,
                      14,
                      15,
                      16
                    ].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/image$i.jpg"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  addVerticalSpace(padding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // addHorizontalSpace(25),
                      BorderBox(
                        padding: const EdgeInsets.symmetric(),
                        width: 150,
                        height: 70,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(Icons.favorite),
                            Text(
                              "Save for Later",
                            ),
                          ],
                        ),
                      ),
                      BorderBox(
                        padding: const EdgeInsets.symmetric(),
                        width: 150,
                        height: 70,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(Icons.shopping_cart),
                            Text("Add to Cart"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
