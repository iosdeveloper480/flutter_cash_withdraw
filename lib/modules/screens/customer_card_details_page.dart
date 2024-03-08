import 'package:cash_withdraw/config/custom_colors.dart';
import 'package:cash_withdraw/modules/screens/withdraw_status_page.dart';
import 'package:cash_withdraw/modules/widgets/CustomText.dart';
import 'package:cash_withdraw/modules/widgets/GradientAppBarView.dart';
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
      appBar: GradientAppBarView(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              child: TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: CustomColors.primary,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    alignment: Alignment.centerLeft),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.green,
                    ),
                    CustomText(
                      data: "back",
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
            customerDetails(),
            cardDetails(),
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 30, right: 30),
              child: Text(
                  "If you want to withdraw the money, please enter the amount and press the Withdraw button at bottom."),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
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
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: rowFields("Min: 1.0", "Max: 1000"),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
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
                onPressed: () async {
                  withdrawPressed(context);
                },
                child: const Text("Confirm"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customerDetails() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            data: "Customer's Details",
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          rowFields("Name: ", "Waqas Ali Muhammad aslam", spaceRequired: true),
          rowFields("EID: ", "1234324324234324", spaceRequired: true),
          rowFields("Phone: ", "+971501234567890", spaceRequired: true),
        ],
      ),
    );
  }

  Widget cardDetails() {
    return Container(
      margin: const EdgeInsets.only(top: 0, bottom: 20, right: 30, left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            data: "Card Details",
            fontWeight: FontWeight.bold,
            fontSize: 25,
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
