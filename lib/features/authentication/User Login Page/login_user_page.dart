import 'package:e_woda/Common/custom_appbar.dart';
import 'package:e_woda/features/authentication/User%20Register%20Page/custom_textformfield.dart';
import 'package:e_woda/features/authentication/User%20Register%20Page/register_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class LoginUser extends StatelessWidget {
  LoginUser({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: NavigateAppBar(title: AppLocalizations.of(context)!.login)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 30.0),
            CustomTextFormField(
                hintText: AppLocalizations.of(context)!.userEmail,
                textController: emailController),
            const SizedBox(height: 30.0),
            CustomTextFormField(
                hintText: AppLocalizations.of(context)!.userPassword,
                textController: passwordController),
            const SizedBox(height: 30.0),
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
                      AppLocalizations.of(context)!.login,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Row(
              children: [
                const Spacer(),
                TextButton(
                  child: Text(
                    AppLocalizations.of(context)!.createuser,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
