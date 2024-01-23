// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:e_woda/Common/custom_appbar.dart';
import 'package:e_woda/SuperAdminPage/super_admin.dart';
import 'package:e_woda/features/HomePage/home_page.dart';
import 'package:e_woda/y_urlpage_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:logger/logger.dart';

import '../../../Common/custom_snackbar.dart';
import '../../../Common/custom_textformfield.dart';
import '../User Register Page/register_user.dart';
import 'package:http/http.dart' as http;

var UserId;

class LoginUser extends StatelessWidget {
  var success = false;
  var userType = '';

  Future<bool> postLogin() async {
    try {
      final response = await http.post(Uri.parse(loginurl),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Accept': '*/*',
          },
          body: jsonEncode(<String, dynamic>{
            "userNameOrEmail": emailController.text,
            "password": passwordController.text
          }));
      final body = jsonDecode(response.body);

      final isSuccess = body['success'];
      success = isSuccess;

      String user = body['data']['roleName'].toString();
      userType = user;
      UserId = body['data']['userId'];

      return true;
    } catch (e) {
      return true;
    }
  }

  LoginUser({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginformkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: loginformkey,
          child: Column(
            children: [
              const SizedBox(height: 30.0),
              CustomTextFormField(
                  validate: ((value) {
                    // RegExp regExp =
                    //     RegExp(r"^[a-zA-Z0-9_.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                    // if (!regExp.hasMatch(value.toString())) {
                    //   return "Username or Email not valid";
                    // }
                    return null;
                  }),
                  hintText: "UserName or UserEmail",
                  textController: emailController),
              const SizedBox(height: 30.0),
              CustomTextFormField(
                  validate: ((value) {
                    return null;
                  }),
                  obsecureText: true,
                  hintText: AppLocalizations.of(context)!.userPassword,
                  textController: passwordController),
              const SizedBox(height: 30.0),
              Row(
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.blue.shade300,
                      ),
                      child: TextButton(
                        onPressed: (() async {
                          bool? funCompleted;
                          if (loginformkey.currentState?.validate() ?? false) {
                            funCompleted = await postLogin();
                          }

                          if (funCompleted!) {
                            if (success) {
                              if (userType == "admin") {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SuperAdminPage(),
                                  ),
                                );
                              } else {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const NewHomePage(),
                                  ),
                                );
                              }
                            } else {
                              customSnackbar(context,
                                  "Sorry something went wrong try again");
                            }
                          }
                        }),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            AppLocalizations.of(context)!.login,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.blue.shade300,
                    ),
                    child: TextButton(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          AppLocalizations.of(context)!.createuser,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterUser()));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
