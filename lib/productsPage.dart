import 'package:e_com_tact/api_page.dart';
import 'package:e_com_tact/productsdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPages extends StatelessWidget {
  const ProductPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Top Products",
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
          padding: const EdgeInsets.all(12.0),
          child: GridView.builder(
            itemCount: dataHomeModels.total,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
            itemBuilder: (BuildContext context, int index) {
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
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18.0),
                          child: Image.network(
                            dataHomeModels.data[index].image,
                            width: Get.width / 3,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Container(
                          height: 40,
                          width: Get.width / 3,
                          decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
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
          )),
    );
  }
}
