import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  final String time;
  final String task;
  final String description;
  final String status;

  const EventsPage(
      {Key key,
      @required this.time,
      @required this.task,
      @required this.description,
      @required this.status})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    IconData icon;
    switch (this.status) {
      case 'check':
        icon = Icons.check;
        break;
      case 'now':
        icon = Icons.notifications_active;
        break;
      default:
        icon = Icons.notifications_none;
        break;
    }
    return Container(
      height: 150.0,
      child: Row(
        children: [_time(context), _verticalDivider(context), _card(icon, context)],
      ),
    );
  }

  Expanded _card(IconData icon, BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 20.0, left: 15.0),
        child: Card(
          margin: EdgeInsets.zero,

          color: Color(0xffF0F4F7),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  topLeft: Radius.circular(15.0))),
          child: Container(
            margin: EdgeInsets.only(left: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _textTask(icon, context),
                Divider(),
                _textDescription(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _textDescription(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Text(this.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey, fontSize: 12.0)),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Icon(
            Icons.more_horiz,
            color: Colors.grey,
          ),
        )
      ],
    );
  }

  Row _textTask(IconData icon, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Text(
            this.task,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Icon(
            icon,
            color: this.status == 'now'
                ? Theme.of(context).primaryColor
                : Colors.grey,
          ),
        )
      ],
    );
  }

  Stack _verticalDivider(BuildContext context) {
    return Stack(
      children: [
        VerticalDivider(),
        if(this.status == 'now')Center(
          child: Container(
            margin: EdgeInsets.only(top: 20.0),
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(offset: Offset(-0.5, 0.5), color: Colors.black54),
                  BoxShadow(offset: Offset(-0.7, 0.7), color: Colors.black54)
                ]),
          ),
        ),
        if(this.status == 'now')Center(
          child: Container(
            margin: EdgeInsets.only(left: 5.0, top: 20.0),
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Container _time(BuildContext context) {
    return Container(
      width: 40.0,
      margin: EdgeInsets.only(right: 5.0, top: 20.0),
      child: Text(
        this.time,
        style: TextStyle(color: Colors.grey, fontSize: MediaQuery.of(context).size.width < 370 ? 10.0 : null),
      ),
    );
  }
}
