import 'package:flutter/material.dart';
class MaterialCardWidget extends StatelessWidget {
  final Widget child;

  const MaterialCardWidget({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: MediaQuery.of(context).size.width * 0.95,
          child: child),
    );
  }
}