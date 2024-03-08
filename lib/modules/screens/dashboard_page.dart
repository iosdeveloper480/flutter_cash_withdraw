import 'package:cash_withdraw/data/Constants.dart';
import 'package:cash_withdraw/models/ServicesModel.dart';
import 'package:cash_withdraw/modules/screens/nfc_reader_page.dart';
import 'package:cash_withdraw/modules/views/DashboardProfileView.dart';
import 'package:cash_withdraw/modules/views/ServicesView.dart';
import 'package:cash_withdraw/modules/views/TransactionsListView.dart';
import 'package:cash_withdraw/modules/widgets/GradientAppBarView.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  double boxSize = 160;
  double margin = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBarView(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DashboardProfileView(margin: margin),
            ServicesView(
              margin: margin,
              onTapServiceCard: (ServicesModel item) {
                if (item.id == "1") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NFCReaderPage(),
                    ),
                  );
                }
              },
            ),
            TransactionsListView(
              margin: margin,
              list: allTransactions,
            ),
          ],
        ),
      ),
    );
  }
}
