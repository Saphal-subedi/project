// ignore_for_file: use_build_context_synchronously, unused_local_variable, prefer_const_declarations

import 'package:e_woda/Common/custom_appbar.dart';
import 'package:e_woda/Common/custom_snackbar.dart';

import 'package:e_woda/Common/custom_textformfield.dart';
import 'package:e_woda/y_urlpage_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:logger/logger.dart';

import '../User Login Page/login_user_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterUser extends StatelessWidget {
  var success = false;
  RegisterUser({super.key});
  final firstnameController = TextEditingController();
  final middlenameController = TextEditingController();
  final surnameCOntroller = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  Future<String> postData() async {
    try {
      final response = await http.post(
          Uri.parse(
              "https://hedgehog-ready-daily.ngrok-free.app/api/app/user-registration/user-registration"),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Accept': '*/*',
          },
          body: jsonEncode(
            <String, dynamic>{
              "userName": usernameController.text,
              "userEmail": emailController.text,
              "password": passwordController.text,
              "phoneNumber": "+977${phoneController.text}",
              "name": firstnameController.text,
              "middleName": middlenameController.text,
              "surname": surnameCOntroller.text
            },
          ));
      final body = jsonDecode(response.body);
      final isSuccess = body['success'];
      success = isSuccess;
      if (success == false) {
        return body['errors'].toString();
      }

      return "User Created Successfully ";
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Register User"),
          backgroundColor: Colors.blue.shade300,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formkey,
              child: Column(children: [
                const SizedBox(height: 30.0),
                CustomTextFormField(
                  hintText: "UserName",
                  textController: usernameController,
                  validate: ((value) {
                    final nameRegex =
                        RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
                    if (!nameRegex.hasMatch(value.toString())) {
                      return AppLocalizations.of(context)!.usernamevalidate;
                    }
                    return null;
                  }),
                ),
                const SizedBox(height: 30.0),
                CustomTextFormField(
                  hintText: "Email",
                  textController: emailController,
                  textInputType: TextInputType.emailAddress,
                  validate: ((value) {
                    final emailRegex = RegExp(
                        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                    if (!emailRegex.hasMatch(value.toString())) {
                      return AppLocalizations.of(context)!.emailvalidate;
                    }
                    return null;
                  }),
                ),
                const SizedBox(height: 30.0),
                CustomTextFormField(
                  hintText: "Password",
                  textController: passwordController,
                  obsecureText: true,
                  textInputType: TextInputType.visiblePassword,
                  validate: ((value) {
                    final passwordRegex = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+{}|:"<>?]).{8,}$');
                    if (!passwordRegex.hasMatch(value.toString()))
                      return "Password must contain capital letter,numbers and\n special letter and length must be at least 8";
                    return null;
                  }),
                ),
                const SizedBox(height: 30.0),
                CustomTextFormField(
                  hintText: AppLocalizations.of(context)!.phone,
                  textController: phoneController,
                  textInputType: TextInputType.number,
                  validate: ((value) {
                    final numberRegex = RegExp(r'^[0-9]{10}$');
                    // RegExp(
                    //     r"^[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]+$");
                    if (!numberRegex.hasMatch(value.toString())) {
                      return "Please Enter valid number";
                    }
                    return null;
                  }),
                ),
                const SizedBox(height: 30.0),
                CustomTextFormField(
                  hintText: "FirstName",
                  textController: firstnameController,
                  validate: ((value) {
                    final nameRegex =
                        RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
                    if (!nameRegex.hasMatch(value.toString())) {
                      return AppLocalizations.of(context)!.usernamevalidate;
                    }
                    return null;
                  }),
                ),
                const SizedBox(height: 30.0),
                CustomTextFormField(
                  hintText: "MiddleName",
                  textController: middlenameController,
                  validate: ((value) {
                    return null;
                  }),
                ),
                const SizedBox(height: 30.0),
                CustomTextFormField(
                  hintText: "SurName",
                  textController: surnameCOntroller,
                  validate: ((value) {
                    final nameRegex =
                        RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
                    if (!nameRegex.hasMatch(value.toString())) {
                      return AppLocalizations.of(context)!.usernamevalidate;
                    }
                    return null;
                  }),
                ),
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.blue.shade300,
                        ),
                        child: TextButton(
                          onPressed: (() async {
                            if (formkey.currentState!.validate()) {
                              var success = await postData();
                              customSnackbar(context, success);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginUser()));
                            }
                          }),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              AppLocalizations.of(context)!.registerButton,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.blue.shade300,
                      ),
                      child: TextButton(
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginUser()));
                        },
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ));
    // ignore: dead_code
  }
}
