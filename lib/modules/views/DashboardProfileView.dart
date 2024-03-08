import 'package:cash_withdraw/modules/widgets/CustomText.dart';
import 'package:flutter/material.dart';

class DashboardProfileView extends StatelessWidget {
  double margin = 0;
  DashboardProfileView({super.key, required this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin),
      padding: const EdgeInsets.only(top: 30),
      child: Wrap(
        runSpacing: 8,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomText(
                    data: "Welcome ",
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                  CustomText(
                    data: "Username",
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.green,
                  ),
                ],
              ),
              TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.green,
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(50, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    alignment: Alignment.centerLeft),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      data: "Edit",
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 12.0, bottom: 0),
                child: Image(
                  image: AssetImage("lib/assets/profile.png"),
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    rowFields("Name", "John Smith", spaceRequired: true),
                    rowFields("Staff ID", "123456", spaceRequired: true),
                    rowFields("Designation", "King", spaceRequired: true),
                    rowFields("Branch", "Sharjah", spaceRequired: true),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
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
        CustomText(
          data: title,
          fontSize: 18,
          color: Colors.black,
        ),
        CustomText(
          data: subtitle,
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.black,
        ),
      ],
    );
  }
}
