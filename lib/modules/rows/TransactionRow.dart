import 'package:cash_withdraw/models/TransactionModel.dart';
import 'package:cash_withdraw/modules/widgets/CustomText.dart';
import 'package:flutter/material.dart';

class TransactionRow extends StatelessWidget {
  TransactionModel item;
  bool hideDivider = false;
  double margin = 0.0;

  TransactionRow(
      {super.key,
      required this.item,
      required this.margin,
      this.hideDivider = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin),
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        splashColor: const Color.fromRGBO(55, 238, 62, 0.1),
        highlightColor: const Color.fromRGBO(55, 238, 62, 0.1),
        onTap: () {},
        child: Wrap(
          runSpacing: 20,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10, right: 12.0),
                  child: Image(
                    image: AssetImage("lib/assets/profile.png"),
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        runAlignment: WrapAlignment.center,
                        alignment: WrapAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                              data: item.name, fontWeight: FontWeight.bold),
                          CustomText(data: item.date, color: Colors.grey),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                              data: '${item.otherCurrency} ${item.otherAmount}',
                              fontWeight: FontWeight.bold),
                          CustomText(
                              data:
                                  '${item.currentCurrency} ${item.currentAmount}',
                              color: Colors.grey),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Visibility(
              visible: !hideDivider,
              child: const Divider(
                thickness: 1,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
