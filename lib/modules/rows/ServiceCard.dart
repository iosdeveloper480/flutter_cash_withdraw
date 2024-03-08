import 'package:cash_withdraw/models/ServicesModel.dart';
import 'package:cash_withdraw/utilities/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServiceCard extends StatelessWidget {
  ServicesModel item;
  final FallbackFunction<ServicesModel> onTapServiceCard;

  ServiceCard({
    super.key,
    required this.item,
    required this.onTapServiceCard,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      splashColor: const Color.fromRGBO(55, 238, 62, 0.1),
      highlightColor: const Color.fromRGBO(55, 238, 62, 0.1),
      onTap: () {
        onTapServiceCard(item);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 95,
            height: 80,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(241, 241, 243, 1),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              border: Border.all(
                  color: const Color.fromRGBO(237, 237, 238, 1), width: 3),
            ),
            child: Center(
              child: SvgPicture.asset(
                "lib/assets/${item.image}.svg",
                height: 45,
                width: 45,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 6,
              left: 6,
              bottom: 0,
              right: 6,
            ),
            child: Text(
              item.name,
              style: const TextStyle(
                fontSize: 15,
              ),
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
