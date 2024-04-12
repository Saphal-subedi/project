import 'package:e_woda/Query%20Search/Jaccard_index_details.dart';
import 'package:e_woda/Query%20Search/query_tokenization.dart';
import 'package:flutter/material.dart';

import '../Common/custom_appbar.dart';
import '../Common/unordered_list.dart';

class QueryOutput extends StatefulWidget {
  const QueryOutput({super.key});

  @override
  State<QueryOutput> createState() => _QueryOutputState();
}

class _QueryOutputState extends State<QueryOutput> {
  int count = 0;
  void saphal() {
    count = count + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: NavigateAppBar(title: "Query Output Page")),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Text(
                //   "Birth index is $birthindex",
                //   style: const TextStyle(
                //     fontSize: 20.0,
                //   ),
                // ),
                // Text(
                //   "Marriage index is $marriageindex",
                //   style: const TextStyle(
                //     fontSize: 20.0,
                //   ),
                // ),
                // Text(
                //   "Death index is $deathindex",
                //   style: const TextStyle(
                //     fontSize: 20.0,
                //   ),
                // ),
                if (birthindex! > deathindex! && birthindex! > marriageindex!)
                  const Column(
                    children: [
                      SizedBox(height: 30),
                      Text(
                        "For birth regristration we need following things",
                        style: TextStyle(color: Colors.green, fontSize: 17.0),
                      ),
                      UnorderedListItem(itemText: "Name of childen"),
                      UnorderedListItem(itemText: "Date of birth of children"),
                      UnorderedListItem(itemText: "Full name of Father"),
                      UnorderedListItem(itemText: "Full name of mother"),
                    ],
                  ),
                if (marriageindex! > birthindex! &&
                    marriageindex! > deathindex!)
                  const Column(
                    children: [
                      SizedBox(height: 30),
                      Text(
                        "For marriage regristration we need following things",
                        style: TextStyle(color: Colors.green, fontSize: 17.0),
                      ),
                      UnorderedListItem(itemText: "Name of marriage couple"),
                      UnorderedListItem(itemText: "Date of birth of couple"),
                      UnorderedListItem(itemText: "Both couple Father name"),
                      UnorderedListItem(itemText: "Both couple Mother name"),
                    ],
                  ),
                if (deathindex! > birthindex! && deathindex! > marriageindex!)
                  const Column(
                    children: [
                      SizedBox(height: 30),
                      Text(
                        "For Death regristration we need following things",
                        style: TextStyle(color: Colors.green, fontSize: 17.0),
                      ),
                      UnorderedListItem(itemText: "Full name of death person"),
                      UnorderedListItem(itemText: "Date of death"),
                    ],
                  ),
                if (birthindex == deathindex &&
                    birthindex != 0 &&
                    birthindex != marriageindex &&
                    birthindex! > marriageindex!)
                  const Column(
                    children: [
                      SizedBox(height: 30),
                      Text(
                        "For birth regristration we need following things",
                        style: TextStyle(color: Colors.green, fontSize: 17.0),
                      ),
                      UnorderedListItem(itemText: "Name of childen"),
                      UnorderedListItem(itemText: "Date of birth of children"),
                      UnorderedListItem(itemText: "Full name of Father"),
                      UnorderedListItem(itemText: "Full name of mother"),
                      Column(
                        children: [
                          SizedBox(height: 30),
                          Text(
                            "For Death regristration we need following things",
                            style:
                                TextStyle(color: Colors.green, fontSize: 17.0),
                          ),
                          UnorderedListItem(
                              itemText: "Full name of death person"),
                          UnorderedListItem(itemText: "Date of death"),
                        ],
                      ),
                    ],
                  ),
                if (birthindex == marriageindex &&
                    birthindex != 0 &&
                    birthindex != deathindex &&
                    birthindex! > deathindex!)
                  const Column(
                    children: [
                      SizedBox(height: 30),
                      Text(
                        "For birth regristration we need following things",
                        style: TextStyle(color: Colors.green, fontSize: 17.0),
                      ),
                      UnorderedListItem(itemText: "Name of childen"),
                      UnorderedListItem(itemText: "Date of birth of children"),
                      UnorderedListItem(itemText: "Full name of Father"),
                      UnorderedListItem(itemText: "Full name of mother"),
                      Column(
                        children: [
                          SizedBox(height: 30),
                          Text(
                            "For marriage regristration we need following things",
                            style:
                                TextStyle(color: Colors.green, fontSize: 17.0),
                          ),
                          UnorderedListItem(
                              itemText: "Name of marriage couple"),
                          UnorderedListItem(
                              itemText: "Date of birth of couple"),
                          UnorderedListItem(
                              itemText: "Both couple Father name"),
                          UnorderedListItem(
                              itemText: "Both couple Mother name"),
                        ],
                      ),
                    ],
                  ),
                if (marriageindex == deathindex &&
                    marriageindex != 0 &&
                    marriageindex != birthindex &&
                    marriageindex! > birthindex!)
                  const Column(
                    children: [
                      SizedBox(height: 30),
                      Text(
                        "For marriage regristration we need following things",
                        style: TextStyle(color: Colors.green, fontSize: 17.0),
                      ),
                      UnorderedListItem(itemText: "Name of marriage couple"),
                      UnorderedListItem(itemText: "Date of birth of couple"),
                      UnorderedListItem(itemText: "Both couple Father name"),
                      UnorderedListItem(itemText: "Both couple Mother name"),
                      Column(
                        children: [
                          SizedBox(height: 30),
                          Text(
                            "For Death regristration we need following things",
                            style:
                                TextStyle(color: Colors.green, fontSize: 17.0),
                          ),
                          UnorderedListItem(
                              itemText: "Full name of death person"),
                          UnorderedListItem(itemText: "Date of death"),
                        ],
                      ),
                    ],
                  ),
                if (birthindex == deathindex &&
                    deathindex == marriageindex &&
                    birthindex != 0)
                  const Column(
                    children: [
                      SizedBox(height: 30),
                      Text(
                        "For birth regristration we need following things",
                        style: TextStyle(color: Colors.green, fontSize: 17.0),
                      ),
                      UnorderedListItem(itemText: "Name of childen"),
                      UnorderedListItem(itemText: "Date of birth of children"),
                      UnorderedListItem(itemText: "Full name of Father"),
                      UnorderedListItem(itemText: "Full name of mother"),
                      Column(
                        children: [
                          SizedBox(height: 30),
                          Text(
                            "For marriage regristration we need following things",
                            style:
                                TextStyle(color: Colors.green, fontSize: 17.0),
                          ),
                          UnorderedListItem(
                              itemText: "Name of marriage couple"),
                          UnorderedListItem(
                              itemText: "Date of birth of couple"),
                          UnorderedListItem(
                              itemText: "Both couple Father name"),
                          UnorderedListItem(
                              itemText: "Both couple Mother name"),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: 30),
                          Text(
                            "For Death regristration we need following things",
                            style:
                                TextStyle(color: Colors.green, fontSize: 17.0),
                          ),
                          UnorderedListItem(
                              itemText: "Full name of death person"),
                          UnorderedListItem(itemText: "Date of death"),
                        ],
                      ),
                    ],
                  ),
                if (birthindex == 0 && deathindex == 0 && marriageindex == 0)
                  const Text(
                    "Sorry we could not match your query please try again",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 22,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(50.0), // Half of the width
            right: Radius.circular(50.0), // Half of the width
          ),
          color: Colors.blue, // Change the color as needed
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const JaccardIndexDetails()));
              },
              child: Text(
                "Jaccard Index Details",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
        ),
      ),
    );
  }
}
