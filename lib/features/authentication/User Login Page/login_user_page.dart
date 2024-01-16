import 'package:e_woda/Common/custom_appbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../../../Common/custom_textformfield.dart';
import '../User Register Page/register_user.dart';

class LoginUser extends StatelessWidget {
  LoginUser({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginformkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: NavigateAppBar(title: AppLocalizations.of(context)!.login)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: loginformkey,
          child: Column(
            children: [
              const SizedBox(height: 30.0),
              CustomTextFormField(
                  validate: ((value) {
                    final emailRegex = RegExp(
                        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                    if (!emailRegex.hasMatch(value.toString())) {
                      return AppLocalizations.of(context)!.emailvalidate;
                    }
                    return null;
                  }),
                  hintText: AppLocalizations.of(context)!.userEmail,
                  textController: emailController),
              const SizedBox(height: 30.0),
              CustomTextFormField(
                  validate: ((value) {
                    if (value.toString().length < 8) {
                      return AppLocalizations.of(context)!.passwordvalidate;
                    }
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
                        onPressed: (() {
                          if (loginformkey.currentState?.validate() ?? false) {}
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
