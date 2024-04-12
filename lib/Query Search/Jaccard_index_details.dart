import 'package:e_woda/Query%20Search/query_tokenization.dart';
import 'package:flutter/material.dart';

import '../Common/custom_appbar.dart';
import '../Common/unordered_list.dart';

class JaccardIndexDetails extends StatefulWidget {
  const JaccardIndexDetails({super.key});

  @override
  State<JaccardIndexDetails> createState() => _JaccardIndexDetailsState();
}

class _JaccardIndexDetailsState extends State<JaccardIndexDetails> {
  int count = 0;
  void saphal() {
    count = count + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: NavigateAppBar(title: "Jaccard Index Details Info")),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Birth index is $birthindex",
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  "Marriage index is $marriageindex",
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  "Death index is $deathindex",
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
