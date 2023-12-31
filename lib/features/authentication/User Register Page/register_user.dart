// ignore_for_file: use_build_context_synchronously

import 'package:e_woda/Common/custom_appbar.dart';

import 'package:e_woda/features/authentication/User%20Register%20Page/Drop%20Down%20Menu/drop_down_menu.dart';
import 'package:e_woda/Common/custom_textformfield.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../User Login Page/login_user_page.dart';

class RegisterUser extends StatelessWidget {
  RegisterUser({super.key});
  final nameController = TextEditingController();
  final bloodGroupController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final formkey = GlobalKey<FormState>();

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
                  hintText: AppLocalizations.of(context)!.userName,
                  textController: nameController,
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
                  hintText: AppLocalizations.of(context)!.phone,
                  textController: phoneController,
                  textInputType: TextInputType.number,
                  validate: ((value) {
                    final numberRegex = RegExp(
                        r"^[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]+$");
                    if (!numberRegex.hasMatch(value.toString())) {
                      return AppLocalizations.of(context)!.phonevalidate;
                    }
                    return null;
                  }),
                ),
                const SizedBox(height: 30.0),
                CustomTextFormField(
                  hintText: AppLocalizations.of(context)!.userEmail,
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
                  hintText: AppLocalizations.of(context)!.userPassword,
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
                const CustomDropDownButton(),
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
                          onPressed: (() {}),
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
                            AppLocalizations.of(context)!.alreadyHaveAnAccount,
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
                                  builder: (context) => LoginUser()));
                        },
                      ),
                    ),
                  ],
                ),

//                 Row(
//                   children: [
//                     Center(
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15.0),
//                           color: Colors.blue.shade300,
//                         ),
//                         child: TextButton(
//                           onPressed: (() async {
//                             if (formkey.currentState!.validate()) {
// //                               print("NAME CONTROLLER IS SHOWN");
// //                               print(nameController.text.trim());
// //                               final message = await FirestoreServices()
// //                                   .createUser(RegisterUserModel(
// //                                       Name: nameController.text.toString(),
// //                                       Phone: phoneController.text.toString(),
// //                                       bloodGroup:
// //                                           bloodGroupController.text.toString(),
// //                                       email: emailController.text.toString(),
// //                                       password:
// //                                           passwordController.text.toString()));
// //                               CustomSnackBar(context: context, message: message)
// //                                   .snackbar();
// // ========

//                               Center(
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(15.0),
//                                     color: Colors.blue.shade300,
//                                   ),
//                                   child: TextButton(
//                                     onPressed: (() async {
//                                       if (formkey.currentState!.validate()) {
// //                           final message = await FirestoreServices().createUser(
// //                               RegisterUserModel(
// //                                   name: nameController.text.toString(),
// //                                   phone: phoneController.text.toString(),
// //                                   bloodGroup:
// //                                       bloodGroupController.text.toString(),
// //                                   email: emailController.text.toString(),
// //                                   password:
// //                                       passwordController.text.toString()));

// //                           customSnackbar(context, message);
// // >>>>>>>> 33199bb4326b88636056f8972d9b98c9865841e9:lib/features/authentication/User Register Page/register_user.dart

//                                         Navigator.pop(context);
//                                         Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     LoginUser()));
//                                       }
//                                     }),
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(12.0),
//                                       child: Text(
//                                         AppLocalizations.of(context)!
//                                             .registerButton,
//                                         style: const TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 20.0,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                               const Spacer();
//                               Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(15.0),
//                                   color: Colors.blue.shade300,
//                                 ),
//                                 child: TextButton(
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(12.0),
//                                     child: Text(
//                                       AppLocalizations.of(context)!
//                                           .alreadyHaveAnAccount,
//                                       style: const TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 18.0,
//                                       ),
//                                     ),
//                                   ),
//                                   onPressed: () {
//                                     Navigator.pop(context);
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) => LoginUser()));
//                                   },
//                                 ),
//                               );
//                             }
//                           }),
//                           child: Padding(
//                             padding: const EdgeInsets.all(12.0),
//                             child: Text(
//                               AppLocalizations.of(context)!.registerButton,
//                               style: const TextStyle(
//                                 color: Colors.white70,
//                                 fontSize: 20.0,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 30.0),
//                     Row(
//                       children: [
//                         const Spacer(),
//                         TextButton(
//                           child: Text(
//                             AppLocalizations.of(context)!.alreadyHaveAnAccount,
//                             style: const TextStyle(
//                               color: Colors.black,
//                               fontSize: 18.0,
//                             ),
//                           ),
//                           onPressed: () {
//                             Navigator.pop(context);
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => LoginUser()));
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
              ]),
            ),
          ),
        ));
  }
}
