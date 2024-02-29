import 'package:e_woda/SuperAdminPage/get_birth_model.dart';
import 'package:flutter/material.dart';

class DetailsBirthPage extends StatelessWidget {
  final GetBirth data;

  DetailsBirthPage({required this.data});
//   DetailsBirthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${data.childFullName}"),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Child Full Name:-${data.childFullName}"),
              SizedBox(height: 10.0),
              Text("Father Name:-${data.fatherFullName}"),
              SizedBox(height: 10.0),
              Text("Mother Name:-${data.motherFullName}"),
              SizedBox(height: 10.0),
              Text("Children Id:-${data.id}"),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black), // Add border
                      borderRadius: BorderRadius.circular(
                          8), // Optional: Add border radius
                      color: Colors.green, // Change background color
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Accept",
                          style: TextStyle(
                              color:
                                  Colors.white), // Optional: Change text color
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black), // Add border
                      borderRadius: BorderRadius.circular(
                          8), // Optional: Add border radius
                      color: Colors.red, // Change background color
                    ),
                    child: TextButton(
                      onPressed: () {
                        // Add onPressed functionality here
                      },
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "Reject",
                          style: TextStyle(
                              color:
                                  Colors.white), // Optional: Change text color
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
