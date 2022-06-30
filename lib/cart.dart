import 'package:e_com_tact/api_page.dart';
import 'package:e_com_tact/components/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int qty = 1;

  item(int index){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18.0),
            child: Image.network(
              dataHomeModels.data[index].image,
              width: 100,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  dataHomeModels.data[index].name,
                  style:const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w300),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "₹ ${dataHomeModels.data[index].price.toString()}   ",
                  style:
                  const TextStyle(color: Colors.deepOrange, fontSize: 20),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {

                      setState(() {
                        if (qty >= 1) {
                          qty -= 1;
                        } else {
                          qty = 1;
                        }
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.black12,
                        child: Icon(
                          Icons.remove,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Text("  ${qty.toString()}  "),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        qty += 1;
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.black12,
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.black12,
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
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
          "Cart",
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            item(2),
            const SizedBox(height: 20,),
            item(1),
            const SizedBox(height: 20,),
            item(3),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                const Expanded(child: Text("Total: \n₹2697",style: TextStyle(fontSize: 20),)),
                // Spacer(),
                Expanded(child: DefaultButton(text: "CheckOut",press: (){},)),
              ],),
            )
          ],
        ),
      ),
    );
  }
}
