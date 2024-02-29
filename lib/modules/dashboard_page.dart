import 'package:cash_withdraw/modules/customer_card_details_page.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            children: [
              profileRow(),
              setupPrinterRow(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40),
                ),
                onPressed: _tagRead,
                child: const Text('Tap Customer WPS Card'),
              ),
              const Text(
                  "Note: Click on this button, and tap WPS card with the device."),
            ],
          ),
        ),
      ),
    );
  }

  void _tagRead() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CustomerCardDetailsPage(),
      ),
    );
    return;
    // NfcManager.instance.startSession(
    //   onDiscovered: (NfcTag tag) async {
    //     // result.value = tag.data;
    //     //Call API with this tag.data
    //     print(tag.data);
    //     NfcManager.instance.stopSession();
    //   },
    // );
  }

  Widget profileRow() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Branch User",
              style: TextStyle(fontSize: 22),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Branch User Name Here"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget setupPrinterRow() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Setup Printer",
              style: TextStyle(fontSize: 22),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("No Printer Attached"),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Setup"),
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
