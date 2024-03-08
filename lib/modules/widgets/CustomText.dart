import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {
  String data;
  double fontSize = 15;
  FontWeight fontWeight = FontWeight.normal;
  Color color = Colors.black;

  CustomText({
    super.key,
    required this.data,
    this.fontSize = 15,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
  });

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.data,
      style: TextStyle(
        fontSize: widget.fontSize,
        fontWeight: widget.fontWeight,
        color: widget.color,
      ),
    );
  }
}
