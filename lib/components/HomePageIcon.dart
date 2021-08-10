import 'package:flutter/material.dart';

class HomePageIcon extends StatelessWidget {
  final double widthRatio;
  final double height;
  final preIcon;
  final suffIcon;
  final labelText;
  final double padding;
  final boxDecoration;
  final labelStyle;
  HomePageIcon(
      {@required this.widthRatio,
      @required this.height,
      @required this.labelText,
      this.preIcon,
      this.suffIcon,
      this.padding,
      this.boxDecoration,
      this.labelStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width * widthRatio,
      decoration: boxDecoration,
      child: Padding(
        padding: EdgeInsets.all(
          padding ?? 8,
        ),
        child: TextFormField(
          enabled: false,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: labelText,
            prefixIcon: preIcon,
            suffixIcon: suffIcon,
            labelStyle: labelStyle,
          ),
        ),
      ),
    );
  }
}
