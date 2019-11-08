import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final int code;
  final bool isDark;
  final String imageName;
  final String routeName;

  const CustomCard(
      {Key key,
      @required this.height,
      @required this.width,
      @required this.text,
      @required this.code,
      @required this.isDark,
      @required this.imageName,
      this.routeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          // Navigator.of(context).pushNamed(routeName);
        },
        child: Material(
          elevation: 3,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: height,
            width: width,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SvgPicture.asset('assets/images/' + imageName,
                    height: height * 0.80),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: isDark
                      ? Text(
                          text,
                          style: TextStyle(color: Colors.white),
                        )
                      : Text(text),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Color(code),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
