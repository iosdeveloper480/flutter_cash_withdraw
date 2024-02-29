import 'package:flutter/material.dart';

class WithdrawStatusPage extends StatefulWidget {
  const WithdrawStatusPage({super.key});

  @override
  State<WithdrawStatusPage> createState() => _WithdrawStatusPageState();
}

class _WithdrawStatusPageState extends State<WithdrawStatusPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Withdraw Status"),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            children: [
              const Text("Reference Number"),
              const Text("12345435345"),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // withdrawPressed(context);
                    Navigator.of(context).popUntil(
                      (route) => route.isFirst,
                    );
                  },
                  child: const Text('Print Receipt'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
