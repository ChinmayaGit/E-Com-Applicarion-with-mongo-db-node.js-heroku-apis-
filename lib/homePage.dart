import 'dart:convert';
import 'package:e_com_tact/cart.dart';
import 'package:e_com_tact/productsPage.dart';
import 'package:e_com_tact/productsdetails.dart';
import 'package:e_com_tact/sign_in/sign_in_screen.dart';
import 'package:e_com_tact/sign_up/sign_up_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'api_page.dart';
import 'home_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool loadData = false;
  final box = GetStorage();
  List imageBanner = [];

  @override
  void initState() {
    super.initState();
    getApi(model: "HomeModels", link: "prods").whenComplete(() {
      if (mounted) {
        setState(() {
          loadData = true;
        });
      }
    });
  }
  categoryIcon(String emoji, String text) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9.0),
              ),
              color: Colors.deepOrange.shade100,
            ),
            child: Center(
                child: Text(
              emoji,
              style: const TextStyle(fontSize: 30),
            )),
          ),
          SizedBox(
              width: 60,
              child: Text(
                text,
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54),
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }
  bannerTag(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.black54),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Get.to(ProductPages());
            },
            child: const Text(
              "See More",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black26),
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // The search area here
        title: Container(
          width: double.infinity,
          height: 45,
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      /* Clear the search field */
                    },
                  ),
                  hintText: 'Search...',
                  border: InputBorder.none),
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(const Cart());
            },
            child: const CircleAvatar(
              backgroundColor: Colors.black12,
              child: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              box.remove("token").then((value) {
                Get.off(const SignInScreen());
              });
            },
            child: const CircleAvatar(
              backgroundColor: Colors.black12,
              child: Icon(
                Icons.exit_to_app_sharp,
                color: Colors.red,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        // centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Center(
            child: loadData == true
                ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            color: Colors.deepPurple.shade700,
                          ),
                          height: 130,
                          width: Get.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 30.0, top: 30),
                                child: Text(
                                  "A Summer Surprise ",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 30.0, top: 10),
                                child: Text(
                                  "Cashback 20%",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            categoryIcon("⚡", "Flash Deal"),
                            categoryIcon("🎁", "Daily Gifts"),
                            categoryIcon("👗", "New Trend"),
                            categoryIcon("🧭", "More"),
                          ],
                        ),
                        bannerTag("Especially for you"),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 140.0,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 2),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: false,
                            viewportFraction: 1,
                          ),
                          items: [
                            "https://i.pinimg.com/originals/cc/b3/4f/ccb34f51bba6597deec3bf36ed654315.gif",
                            "https://images-na.ssl-images-amazon.com/images/G/31/img2020/fashion/MA2020/Store/banner-pc-1024x350._CB427954858_.jpg",
                            "https://www.kaarpas.com/wp-content/uploads/2021/04/Banner-2-OC.gif",
                          ].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration:
                                      BoxDecoration(color: Colors.transparent),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: SizedBox.fromSize(
                                      size: Size.fromRadius(48), // Image radius
                                      child:
                                          Image.network(i, fit: BoxFit.cover),
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        bannerTag("Popular Products"),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 8.0),
                          child: SizedBox(
                            height: 200,
                            child: ListView.builder(
                              itemCount: dataHomeModels.total,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(ProductsDetails(
                                      id: dataHomeModels.data[index].id,
                                      index: index,
                                    ));
                                  },
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                            child: Image.network(
                                              dataHomeModels.data[index].image,
                                              width: Get.width / 3,
                                              height: 200,
                                              fit: BoxFit.cover,
                                            ),
                                          )),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5.0),
                                        child: Container(
                                            height: 40,
                                            width: Get.width / 3,
                                            decoration: const ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(20),
                                                    bottomLeft:
                                                        Radius.circular(20),
                                                  ),
                                                ),
                                                color: Colors.black),
                                            child: Center(
                                                child: Text(
                                              dataHomeModels.data[index].name,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                              textAlign: TextAlign.center,
                                            ))),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  )),
      ),
    );
  }
}
