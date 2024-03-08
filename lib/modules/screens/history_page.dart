import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaction History"),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return historyRow(context);
        },
      ),
    );
  }

  Widget historyRow(BuildContext context) {
    return shadowContainer(
      context,
      Wrap(
        children: [
          rowFields("Name: ", "Waqas Ali Muhammad Aslam"),
          rowFields("EID: ", "45646545631"),
          rowFields("Phone: ", "978654312"),
          rowFields("Reference: ", "ALFA978654312"),
          rowFields("Amount: ", "500 AED"),
        ],
      ),
    );
  }

  Widget shadowContainer(BuildContext context, Widget content) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        // borderRadius: const BorderRadius.all(Radius.circular(5)),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.1),
        //     spreadRadius: 3,
        //     blurRadius: 4,
        //     offset: const Offset(0, 2), // changes position of shadow
        //   ),
        // ],
      ),
      child: content,
    );
  }

  Widget rowFields(String title, String subtitle,
      {bool spaceRequired = false}) {
    return Row(
      mainAxisAlignment: spaceRequired
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.start,
      children: [
        Text(title),
        Text(subtitle),
      ],
    );
  }
}
