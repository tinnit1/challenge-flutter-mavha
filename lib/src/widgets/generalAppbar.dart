import 'package:flutter/material.dart';

class GeneralAppbar {
  static appbar(
      {@required BuildContext context,
      @required String titleText,
      @required IconData icon}) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      leading: Navigator.canPop(context) == true
          ? IconButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              icon: Icon(
                Icons.arrow_back,
                size: 25.0,
              ))
          : Container(),
      title: Container(
        child: Center(child: Text(titleText))),
      actions: [
        Container(margin: EdgeInsets.only(right: 25.0), child: Icon(icon))
      ],
    );
  }
}
