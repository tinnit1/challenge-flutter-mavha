import 'package:flutter/material.dart';

class CardTodoPage extends StatelessWidget {
  final IconData icon;
  final String task;
  final int numberItems;

  const CardTodoPage(
      {Key key,
      @required this.icon,
      @required this.task,
      @required this.numberItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      color: Color(0xffF0F4F7),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _icon(context),
              SizedBox(
                height: 20.0,
              ),
              _nameTask(context),
              SizedBox(
                height: 5.0,
              ),
              _items(),
              SizedBox(
                height: 20.0,
              )
            ],
          ),
      ),
    );
  }

  Container _items() {
    return Container(
      width: 90.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(this.numberItems < 1000)Icon(
            Icons.query_builder,
            size: 17.0,
            color: Colors.grey,
          ),
          Text(
            this.numberItems.toString(),
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            'items',
            style: TextStyle(color: Colors.grey),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }

  Text _nameTask(BuildContext context) {
    return Text(
      this.task,
      style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          letterSpacing: -1),
    );
  }

  Container _icon(BuildContext context) {
    return Container(
        decoration:
            BoxDecoration(color: Color(0xffD3E5FE), shape: BoxShape.circle),
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Icon(
            this.icon,
            color: Theme.of(context).primaryColor,
          ),
        ));
  }
}
