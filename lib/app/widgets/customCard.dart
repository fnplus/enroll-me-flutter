import 'package:flutter/material.dart';
class CustomCard extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final int code;
  final bool isDark;

  const CustomCard(
      {Key key,
      @required this.height,
      @required this.width,
      @required this.text,
      @required this.code,
      @required this.isDark})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          child: isDark
              ? Text(
                  text,
                  style: TextStyle(color: Colors.white),
                )
              : Text(text),
          decoration: BoxDecoration(
              color: Color(code), borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}