import 'package:cash_withdraw/data/Constants.dart';
import 'package:cash_withdraw/models/ServicesModel.dart';
import 'package:cash_withdraw/modules/rows/ServiceCard.dart';
import 'package:cash_withdraw/modules/widgets/CustomText.dart';
import 'package:cash_withdraw/utilities/Constants.dart';
import 'package:flutter/material.dart';

class ServicesView extends StatelessWidget {
  double margin = 0.0;
  final FallbackFunction<ServicesModel> onTapServiceCard;

  ServicesView({
    super.key,
    required this.margin,
    required this.onTapServiceCard,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: margin),
          child: CustomText(
            data: "Services",
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: margin - 5),
          child: GridView.count(
            padding: const EdgeInsets.only(top: 10, bottom: 0),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 5,
            childAspectRatio: (80 / 115),
            children: List.generate(
              services.length,
              (index) {
                return ServiceCard(
                  item: services[index],
                  onTapServiceCard: onTapServiceCard,
                );
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: margin),
          child: const Divider(),
        ),
      ],
    );
  }
}
