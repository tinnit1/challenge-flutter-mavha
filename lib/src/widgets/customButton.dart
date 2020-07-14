import 'package:flutter/material.dart';

class CustomButtonPage extends StatelessWidget {
  final Function onPress;

  const CustomButtonPage({Key key, this.onPress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: this.onPress,
      child: Card(
        elevation: 10,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: Theme.of(context).primaryColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
