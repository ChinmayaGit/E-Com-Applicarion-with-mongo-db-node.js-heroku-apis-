import 'package:e_com_tact/api_page.dart';
import 'package:e_com_tact/components/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/default_button.dart';

class ProductsDetails extends StatelessWidget {
  final String id;
  final int index;
  const ProductsDetails({required this.id, required this.index, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.network(dataHomeModels.data[index].image),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height / 2.2,
                ),
                Container(
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      ),
                    ),
                    color: Colors.white,
                  ),
                  height: Get.height / 1.5,
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Text(
                          dataHomeModels.data[index].name,
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50.0),
                                  bottomRight: Radius.circular(50.0),
                                ),
                              ),
                              color: Colors.yellow,
                            ),
                            height: 50,
                            width: 70,
                            child: Row(
                              children: const [
                                Text(
                                  " 4.5 ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "₹ ${dataHomeModels.data[index].price.toString()}   ",
                              style: const TextStyle(
                                color: Colors.deepOrange,
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50.0),
                                  bottomLeft: Radius.circular(50.0),
                                ),
                              ),
                              color: Colors.pink,
                            ),
                            height: 50,
                            width: 60,
                            child: const Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          dataHomeModels.data[index].des,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w300),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "See More Details >",
                          style: TextStyle(
                              color: Colors.deepOrange.shade500,
                              fontSize: 20,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            color: Colors.black12,
                          ),
                          height: 100,
                          child: Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.remove),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.add),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:28.0,left: 50,right: 50),
                        child: DefaultButton(text:"Add to Cart",press: (){  CustomSnackBar( context,
                            const Text(
                              'Product Added Successfully',
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Colors.black);},),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
