// ignore_for_file: use_build_context_synchronously, unused_local_variable, prefer_const_declarations

import 'package:e_woda/Common/custom_appbar.dart';

import 'package:e_woda/Common/custom_textformfield.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:logger/logger.dart';

import '../User Login Page/login_user_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterUser extends StatelessWidget {
  RegisterUser({super.key});
  final firstnameController = TextEditingController();
  final middlenameController = TextEditingController();
  final surnameCOntroller = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final String apiUrl =
      "https://192.168.101.3:44358/api/app/user-registration/user-registration";
  Future<void> postData() async {
    final response = await http.post(Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'multipart/form-data',
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
    Logger().d("Result is------------------------");
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: NavigateAppBar(
                title: AppLocalizations.of(context)!.registerUser)),
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
                    if (value.toString().length < 8) {
                      return AppLocalizations.of(context)!.passwordvalidate;
                    }
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
                            Logger().e("Result is------------------------");
                            if (formkey.currentState!.validate()) {
                              await postData();
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
