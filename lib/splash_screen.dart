import 'package:e_woda/SuperAdminPage/super_admin.dart';
import 'package:e_woda/features/HomePage/home_page.dart';
import 'package:flutter/material.dart';

import 'features/authentication/User Login Page/login_user_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginUser(),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: 1 * size,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage("assets/images/digitalgaue.png"),
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 10.0),
            Text(
              "डिजिटल नागार्जुन",
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.blue.shade300,
              ),
            ),
            // const SizedBox(height: 20.0),
            // Text(
            //   "नागार्जुन",
            //   style: TextStyle(
            //     fontSize: 35.0,
            //     color: Colors.blue.shade300,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
