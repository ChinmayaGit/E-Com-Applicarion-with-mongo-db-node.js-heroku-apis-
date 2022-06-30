import 'package:e_com_tact/sign_in/sign_in_screen.dart';
import 'package:e_com_tact/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'homePage.dart';

final box = GetStorage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool wait = false;

  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {
      setState(() {
        wait = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: wait == true
          ? box.read('token').toString() == "null"
              ? const SignInScreen()
              : const MyHomePage(
                  title: 'Home',
                )
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                child: Image.asset("assets/groovi.png"),
            ),
              )),
      // home:SignInScreen()
    );
  }
}
