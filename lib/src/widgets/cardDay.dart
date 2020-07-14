import 'package:flutter/material.dart';

class CardDayPage extends StatelessWidget {
  final Color colorText;
  final Color colorbackground;
  final String numberDay;
  final String nameDay;

  const CardDayPage(
      {Key key,
      this.colorText = Colors.white,
      this.colorbackground = const Color(0xff2D34AD),
      @required this.numberDay,
      @required this.nameDay})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: 40.0,
      decoration: BoxDecoration(
          color: this.colorbackground,
          borderRadius: BorderRadius.circular(5.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            this.numberDay,
            style: TextStyle(
                color: this.colorText,
                fontWeight: FontWeight.bold,
                fontSize: 18.0),
          ),
          Text(this.nameDay,
              style: TextStyle(
                color: this.colorText,
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    );
  }
}
