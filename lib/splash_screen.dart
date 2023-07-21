import 'package:e_woda/New%20Home%20Page/home_page.dart';
import 'package:flutter/material.dart';

<<<<<<< HEAD
=======
import 'features/HomePage/home_page.dart';

>>>>>>> 33199bb4326b88636056f8972d9b98c9865841e9
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 6),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const NewHomePage(),
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
        decoration: BoxDecoration(
          color: Colors.blue.shade300,
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/images/kathmandu-logo.png"),
<<<<<<< HEAD
              height: 200,
              width: 200,
=======
              height: 250,
              width: 250,
>>>>>>> 33199bb4326b88636056f8972d9b98c9865841e9
            ),
            SizedBox(height: 20.0),
            Text(
              "नागार्जुन",
              style: TextStyle(
                fontSize: 35.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              "नगरपालिका",
              style: TextStyle(
                fontSize: 35.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
