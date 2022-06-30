import 'dart:convert';

import 'package:e_com_tact/components/default_button.dart';
import 'package:e_com_tact/components/snackbar.dart';
import 'package:e_com_tact/homePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final box = GetStorage();

  final _formKey = GlobalKey<FormState>();

  String? email;
  String? password;
  String? conformPassword;
  bool remember = false;
  bool validPass = false;

  final baseUrl = "https://temp-app-ecom.herokuapp.com/";
  var jsonResponse;

  Future<http.Response> signUp(String email, String password) async {
    final uri = Uri.parse(baseUrl + 'signup');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer token',
    };
    Map<String, dynamic> body = {
      'email': email,
      'password': password,
    };
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );
    box.write("token", response.body);
    if (box.read('token') != null) {
      setState((){
        validPass=false;
      });
      Get.off(const MyHomePage(title:"Home"));
    }
    else if (response.statusCode != 200) {
      setState(() {
        validPass = false;
      });
      CustomSnackBar( context,
          Text(
            'Account Exists',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.red);
    }
    return response;
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
          "SignUp",
          style: TextStyle(
             color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Text(
                  "Register Account",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Complete your details",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 40),
                buildEmailFormField(),
                const SizedBox(height: 30),
                buildPasswordFormField(),
                const SizedBox(height: 30),
                buildConformPassFormField(),
                const SizedBox(height: 30),
               validPass==false?DefaultButton(
                  text: "Continue",
                  press: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      setState((){
                        validPass=true;
                      });
                      signUp(email.toString(), password.toString());
                    }
                  },
                ):const CircularProgressIndicator(),
                const SizedBox(height: 30),
                Row(
               mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black12,
                      child: Image.network(
                        "https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-suite-everything-you-need-know-about-google-newest-0.png",
                        height: 30,
                        width: 30,
                      ),
                    ),
                    const SizedBox(width: 10),
                    CircleAvatar(
                      backgroundColor: Colors.black12,
                      child: Image.network(
                        "https://www.freeiconspng.com/uploads/facebook-f-logo-transparent-facebook-f-22.png",
                        height: 30,
                        width: 30,
                      ),
                    ),
                    const SizedBox(width: 10),
                    CircleAvatar(
                      backgroundColor: Colors.black12,
                      child: Image.network(
                        "http://assets.stickpng.com/images/580b57fcd9996e24bc43c53e.png",
                        height: 30,
                        width: 30,
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  "By continuing your confirm that you agree with our Term and Condition",
                  style: TextStyle(fontSize: 13, color: Colors.black54,),textAlign:TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conformPassword = newValue,
      onChanged: (value) {
      conformPassword = value;
      },
      validator: (value) {
   return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
      floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:const Icon(Icons.lock_outline),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        password = value;
      },
      validator: (value) {
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        labelText: "Password",
        hintText: "Enter your password",
      floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:const Icon(Icons.lock_outline),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
     return null;
      },
      validator: (value) {
     return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        labelText: "Email",
        hintText: "Enter your email",
      floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:const Icon(Icons.mail_outline_rounded),
      ),
    );
  }
}
