// ignore_for_file: prefer_const_constructors

import 'package:e_woda/Common/custom_snackbar.dart';
import 'package:flutter/material.dart';

import '../Common/custom_textformfield.dart';

class AdminInvite extends StatelessWidget {
  AdminInvite({super.key});
  final memberEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "InviteAdmin",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomTextFormField(
              hintText: "Member Email Address",
              textController: memberEmailController,
              validate: ((value) {
                final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

                if (!emailRegex.hasMatch(value.toString())) {
                  return "Name cannot be null ";
                }
                return null;
              }),
            ),
            SizedBox(height: 30.0),
            Row(
              children: [
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black), // Add border
                    borderRadius:
                        BorderRadius.circular(8), // Optional: Add border radius
                    color: Colors.yellow, // Change background color
                  ),
                  child: TextButton(
                    onPressed: () {
                      final emailRegex =
                          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                      var email = memberEmailController.toString();
                      if (emailRegex.hasMatch(email)) {
                      } else {
                        customSnackbar(
                            context, "Please Enter Your valid email");
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Invite Admin",
                        style: TextStyle(
                            color: Colors.black), // Optional: Change text color
                      ),
                    ),
                  ),
                ),
                Spacer()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
