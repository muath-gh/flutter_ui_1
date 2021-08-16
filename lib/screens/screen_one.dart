import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:screen_ui2/widgets/custom_bottom_navbar.dart';

class ScreenOne extends StatelessWidget {
  final double appLeftMargin = 5.0;
  final List<String> _items = ["Popular", "Best Seller", "Promo", "Category"];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        backgroundColor: Colors.blueAccent,
        color: Colors.white,
        selectedColor: Colors.orangeAccent,
        fontSize: 15,
        iconSize: 20,
        height: 50,
        items: [
          CustomBottomNavBarItem(iconData: Icons.home, text: "Home"),
          CustomBottomNavBarItem(iconData: Icons.restaurant, text: "Eat"),
          CustomBottomNavBarItem(
              iconData: Icons.shopping_cart, text: "My Orders"),
          CustomBottomNavBarItem(iconData: Icons.menu, text: "Menu"),
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        margin: EdgeInsets.only(top: 30, left: appLeftMargin),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: Colors.white,
                      shadowColor: Colors.black,
                      elevation: 10,
                    ),
                    child: Icon(
                      Icons.pin_drop,
                      color: Colors.redAccent,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deliver to',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Amman, Jordan',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Icon(
                    Icons.note_outlined,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.book_outlined,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: appLeftMargin * 4, top: 20),
              child: Text("Mino Food",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: appLeftMargin * 4, top: 15, right: appLeftMargin * 4),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Search for your favorite",
                    contentPadding: const EdgeInsets.only(top: 12),
                    hintStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.settings)),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(
                  left: appLeftMargin * 4, top: 35, right: appLeftMargin * 4),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, index) {
                  return buildItem(context, index);
                },
                itemCount: _items.length,
              ),
            ),
            Container(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        child: Image.asset(
                          "assets/images/pizza.jpeg",
                          height: 300,
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: 20,
                        child: Container(
                          width: 90,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          height: 70,
                          alignment: Alignment.center,
                          child: Text("40%  Discount",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: Text(
                          "Order Now",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 30,
                    height: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 120, 68, 80)),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildItem(context, index) {
    final width = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.symmetric(horizontal: width / 50),
        child: Column(
          children: [
            Text(
              _items[index],
              style: TextStyle(
                color:
                    index == 2 ? Color.fromARGB(255, 120, 68, 80) : Colors.grey,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            (index == 2)
                ? Container(
                    width: 75,
                    height: 4,
                    color: Color.fromARGB(255, 120, 68, 80),
                  )
                : Container(
                    width: 75,
                    height: 0.5,
                    color: Colors.grey,
                  ),
          ],
        ));
  }
}
