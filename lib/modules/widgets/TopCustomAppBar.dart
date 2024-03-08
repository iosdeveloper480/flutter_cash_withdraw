import 'package:flutter/material.dart';

class TopCustomAppBarView extends StatelessWidget {
  double boxSize = 0.0;
  double margin = 0.0;

  TopCustomAppBarView({
    super.key,
    required this.boxSize,
    required this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: boxSize,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment(1, 0.9),
                  colors: <Color>[
                    Colors.green,
                    Colors.lightGreen,
                  ],
                  tileMode: TileMode.mirror,
                ),
              ),
            ),
          ),
          Positioned(
            top: boxSize - 80,
            left: margin,
            child: const Align(
              alignment: Alignment.bottomLeft,
              child: Image(
                image: AssetImage("lib/assets/logo.png"),
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
