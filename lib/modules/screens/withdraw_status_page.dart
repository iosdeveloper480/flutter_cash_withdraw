import 'package:cash_withdraw/modules/widgets/CustomText.dart';
import 'package:cash_withdraw/modules/widgets/GradientAppBarView.dart';
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
        appBar: GradientAppBarView(
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            children: [
              CustomText(
                data: "Reference Number",
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
              CustomText(
                data: "12345435345",
                fontWeight: FontWeight.normal,
                fontSize: 22,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: TextButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                        const Size.fromHeight(50)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).popUntil(
                      (route) => route.isFirst,
                    );
                  },
                  child: const Text("Print Receipt"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
