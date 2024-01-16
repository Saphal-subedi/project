import 'package:e_woda/SuperAdminPage/admin_birth.dart';
import 'package:e_woda/SuperAdminPage/admin_death.dart';
import 'package:e_woda/SuperAdminPage/admin_inviteadmin.dart';
import 'package:e_woda/SuperAdminPage/admin_kyc.dart';
import 'package:e_woda/SuperAdminPage/admin_marriage.dart';
import 'package:e_woda/SuperAdminPage/admin_news.dart';
import 'package:e_woda/SuperAdminPage/admin_userinfo.dart';
import 'package:flutter/material.dart';

class SuperAdminPage extends StatelessWidget {
  const SuperAdminPage({super.key});

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
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => LoginUser()));
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
          "Admin Home Page",
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
                        child: const Center(
                          child: Text(
                            "NEWS",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
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
                          builder: (context) => const AdminKyc(),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.blue.shade300,
                      margin: const EdgeInsets.all(5),
                      child: SizedBox(
                        height: height * 0.25,
                        width: widhth * 0.45,
                        child: const Center(
                          child: Text(
                            "KYC",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
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
                          builder: (context) => const AdminUserInfo(),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.blue.shade300,
                      margin: const EdgeInsets.all(5),
                      child: SizedBox(
                        height: height * 0.25,
                        width: widhth * 0.45,
                        child: const Center(
                          child: Text(
                            "UserInfo",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
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
                          builder: (context) => const AdminInvite(),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.blue.shade300,
                      margin: const EdgeInsets.all(5),
                      child: SizedBox(
                        height: height * 0.25,
                        width: widhth * 0.45,
                        child: const Center(
                          child: Text(
                            "Invite Admin",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
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
                          builder: (context) => const AdminBirth(),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.blue.shade300,
                      margin: const EdgeInsets.all(5),
                      child: SizedBox(
                        height: height * 0.25,
                        width: widhth * 0.29,
                        child: const Center(
                          child: Text(
                            "Birth",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
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
                          builder: (context) => const AdminMarriage(),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.blue.shade300,
                      margin: const EdgeInsets.all(5),
                      child: SizedBox(
                        height: height * 0.25,
                        width: widhth * 0.29,
                        child: const Center(
                          child: Text(
                            "Marriage",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
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
                          builder: (context) => const AdminDeath(),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.blue.shade300,
                      margin: const EdgeInsets.all(5),
                      child: SizedBox(
                        height: height * 0.25,
                        width: widhth * 0.29,
                        child: const Center(
                          child: Text(
                            "Death",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
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
