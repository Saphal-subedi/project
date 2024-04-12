import 'package:e_woda/Query%20Search/query_output_page.dart';
import 'package:e_woda/Query%20Search/query_tokenization.dart';
import 'package:flutter/material.dart';

class QuerySearcher extends StatefulWidget {
  const QuerySearcher({super.key});

  @override
  State<QuerySearcher> createState() => _QuerySearcherState();
}

class _QuerySearcherState extends State<QuerySearcher> {
  static final queryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            maxLines: 3,
            controller: queryController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFF39415D),
              hintText: 'Search Your Query Here',
              hintStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black, // Border color
                  width: 3.0, // Border width
                ),
                borderRadius:
                    BorderRadius.circular(8.0), // Optional: Set border radius
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black, // Focused border color
                  width: 3.0, // Focused border width
                ),
                borderRadius: BorderRadius.circular(
                    8.0), // Optional: Set focused border radius
              ),
            ),
          ),
          Row(
            children: [
              const Spacer(),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue.shade50),
                ),
                onPressed: () {
                  queryTokenize(queryController.text.toUpperCase());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QueryOutput()));
                  queryController.clear();
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    Text(
                      "Search",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
