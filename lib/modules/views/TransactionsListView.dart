import 'package:cash_withdraw/models/TransactionModel.dart';
import 'package:cash_withdraw/modules/rows/TransactionRow.dart';
import 'package:cash_withdraw/modules/widgets/CustomText.dart';
import 'package:flutter/material.dart';

class TransactionsListView extends StatelessWidget {
  double margin = 0.0;
  List<TransactionModel> list = [];

  TransactionsListView({
    super.key,
    required this.margin,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: margin, vertical: 10),
          child: CustomText(
            data: "All Transactions",
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        ListView.builder(
          padding: const EdgeInsets.only(top: 0, bottom: 10),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, int index) {
            bool isLast = list.length - 1 == index;
            return TransactionRow(
              item: list[index],
              margin: margin,
              hideDivider: isLast,
            );
          },
        ),
      ],
    );
  }
}
