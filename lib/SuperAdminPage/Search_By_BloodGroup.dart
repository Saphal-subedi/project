import 'package:flutter/material.dart';

import 'get_user_model.dart';

class BloodSearch extends StatefulWidget {
  final List<GetUserDetailss> userDetailsList;

  BloodSearch({required this.userDetailsList});

  @override
  _BloodSearchState createState() => _BloodSearchState();
}

class _BloodSearchState extends State<BloodSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Search'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.userDetailsList
              .map((userDetails) => ListTile(
                    title: Text("Name:-${userDetails.memberName}" ?? ''),
                    subtitle:
                        Text("Phone Number:-${userDetails.phoneNumber}" ?? ''),

                    // Add more fields as needed
                  ))
              .toList(),
        ),
      ),
    );
  }
}
