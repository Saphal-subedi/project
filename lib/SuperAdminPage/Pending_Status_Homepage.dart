import 'package:e_woda/SuperAdminPage/admin_birth.dart';
import 'package:e_woda/SuperAdminPage/admin_death.dart';
import 'package:e_woda/SuperAdminPage/admin_inviteadmin.dart';
import 'package:e_woda/SuperAdminPage/admin_kyc.dart';
import 'package:e_woda/SuperAdminPage/admin_marriage.dart';
import 'package:e_woda/SuperAdminPage/admin_news.dart';
import 'package:e_woda/SuperAdminPage/admin_userinfo.dart';
import 'package:e_woda/features/authentication/User%20Login%20Page/login_user_page.dart';
import 'package:flutter/material.dart';

class PendingStatusPage extends StatelessWidget {
  const PendingStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final widhth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Row(
              children: [
                CircleAvatar(
                    backgroundColor: Colors.orange.shade50,
                    child: IconButton(
                        onPressed: () {
                          showMultiSelectDialog(context);
                        },
                        icon: const Icon(
                          Icons.person,
                          color: Colors.black,
                        ))),
              ],
            ),
          ),
        ],
        title: const Text(
          "Pending Status Page",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Colors.blue.shade300),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AdminNews(),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.blue.shade300,
                      margin: const EdgeInsets.all(5),
                      child: SizedBox(
                        height: height * 0.25,
                        width: widhth * 0.45,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: Center(
                                  child: Image.asset(
                                    "assets/images/Notices.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                "Notices",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => AdminKyc(),
                      //   ),
                      // );
                    },
                    child: Card(
                      color: Colors.blue.shade300,
                      margin: const EdgeInsets.all(5),
                      child: SizedBox(
                        height: height * 0.25,
                        width: widhth * 0.45,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: Center(
                                  child: Image.asset(
                                    "assets/images/kyc1.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                "Pending Status",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminUserInfo(),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.blue.shade300,
                      margin: const EdgeInsets.all(5),
                      child: SizedBox(
                        height: height * 0.25,
                        width: widhth * 0.45,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: Center(
                                  child: Image.asset(
                                    "assets/images/public-forum.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                "User Info",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminInvite(),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.blue.shade300,
                      margin: const EdgeInsets.all(5),
                      child: SizedBox(
                        height: height * 0.25,
                        width: widhth * 0.45,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: Center(
                                  child: Image.asset(
                                    "assets/images/inviteadmin.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                "Invite Admin",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showMultiSelectDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Do you really want to logout'),
          content: Container(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Column(
              children: [
                TextButton(
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(BorderSide(
                        color: Colors.blue, // Border color
                        width: 2.0, // Border width
                      )),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginUser(),
                        ),
                      );
                    },
                    child: Text("Yes")),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(BorderSide(
                        color: Colors.blue, // Border color
                        width: 2.0, // Border width
                      )),
                    ),
                    child: Text("Cancel")),
              ],
            ),
          ),
        );
      });
}
