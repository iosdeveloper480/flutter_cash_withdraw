import 'package:cash_withdraw/modules/withdraw_status_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomerCardDetailsPage extends StatefulWidget {
  const CustomerCardDetailsPage({super.key});

  @override
  State<CustomerCardDetailsPage> createState() =>
      _CustomerCardDetailsPageState();
}

class _CustomerCardDetailsPageState extends State<CustomerCardDetailsPage> {
  final TextEditingController _textFieldController = TextEditingController();
  String? codeDialog;
  String? valueText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            customerDetails(),
            cardDetails(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                  "If you want to withdraw the money, please enter the amount and press the Withdraw button at bottom."),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Amount',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: rowFields("Min: 1.0", "Max: 1000"),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  withdrawPressed(context);
                },
                child: const Text('Withdraw'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customerDetails() {
    return shadowContainer(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Customer's Details",
            style: TextStyle(fontSize: 18),
          ),
          rowFields("Name: ", "Waqas Ali Muhammad aslam"),
          rowFields("EID: ", "1234324324234324"),
          rowFields("Phone: ", "+971501234567890"),
        ],
      ),
    );
  }

  Widget cardDetails() {
    return shadowContainer(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Card Details",
            style: TextStyle(fontSize: 18),
          ),
          rowFields("Card Name: ", "WPS Premium Card", spaceRequired: true),
          rowFields("Number: ", "1234324324234324", spaceRequired: true),
          rowFields("Balance: ", "3000 AED", spaceRequired: true),
          rowFields("Limit: ", "1000 AED", spaceRequired: true),
          rowFields("Last Withdraw Amount: ", "500 AED", spaceRequired: true),
        ],
      ),
    );
  }

  Widget shadowContainer(Widget content) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
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

  withdrawPressed1(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Withdraw"),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const WithdrawStatusPage(),
          ),
        );
        // Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Withdraw"),
      content: const Text(
          "You will be asked to put OTP that has been sent to the customer's phone number."),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void> withdrawPressed(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('OTP for Withdraw'),
          content: Wrap(
            children: [
              const Text(
                  "You will be asked to put OTP that has been sent to the customer's phone number."),
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  setState(
                    () {
                      valueText = value;
                    },
                  );
                },
                controller: _textFieldController,
                decoration: const InputDecoration(hintText: "Enter OTP"),
              ),
            ],
          ),
          actions: <Widget>[
            MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            MaterialButton(
              color: Colors.green,
              textColor: Colors.white,
              child: const Text('Verify'),
              onPressed: () {
                setState(() {
                  codeDialog = valueText;
                  Navigator.pop(context);
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WithdrawStatusPage(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
