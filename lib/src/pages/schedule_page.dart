import 'package:chmavha/src/widgets/cardDay.dart';
import 'package:chmavha/src/widgets/customButton.dart';
import 'package:chmavha/src/widgets/events.dart';
import 'package:chmavha/src/widgets/generalAppbar.dart';
import 'package:chmavha/src/widgets/header.dart';
import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  var listTask = [
    {
      'time': '8:00',
      'task': 'Morning Run In The Park',
      'description': 'Mon - Fri',
      'status': 'check'
    },
    {
      'time': '10:00',
      'task': 'Skype Meeting With The NY Contractor',
      'description': 'Delivery Overview',
      'status': 'now'
    },
    {
      'time': '11:00',
      'task': 'Meeting With The Desing Team',
      'description': 'Timeline Of Visualization Project Objectives',
      'status': ''
    },
    {
      'time': '11:00',
      'task': 'Weekly Meeting The Team',
      'description': 'On The List Issues',
      'status': ''
    },
  ];

  @override
  Widget build(BuildContext context) {
  final args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: GeneralAppbar.appbar(
          context: context, titleText: 'SCHEDULE', icon: Icons.event_note),
      body: Stack(
        children: [
          _textEvents(context),
          _events(context),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Stack(
              children: [_calendar(context), _selectDay(context, args)],
            ),
          ),
          _buttonAdd(context)
        ],
      ),
    );
  }

  Positioned _buttonAdd(BuildContext context) {
    return Positioned(
      right: 20.0,
      bottom: MediaQuery.of(context).size.height * 0.05,
      child: Container(
          child: CustomButtonPage(
        onPress: () {},
      )),
    );
  }

  Container _calendar(BuildContext context) {
    return Container(child: HeaderPage());
  }

  Row _selectDay(BuildContext context, var args) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CardDayPage(
          nameDay: args['day'],
          numberDay: args['number'],
          colorbackground: Colors.white,
          colorText: Theme.of(context).primaryColor,
        ),
        Text(
          'TODAY LIST',
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          width: 15.0,
        ),
        Text(
          '8 tasks',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Container _textEvents(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 80.0, left: 20.0),
      child: Container(
          // margin: EdgeInsets.only(top: 40.0),
          child: Row(
        children: [
          Text(
            'Time',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
          ),
          Text('Events', style: TextStyle(color: Colors.grey)),
        ],
      )),
    );
  }

  Container _events(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 100.0, left: 20.0),
        child: ListView(
          children: List.generate(
              listTask.length,
              (index) => EventsPage(
                  time: listTask[index]['time'],
                  task: listTask[index]['task'],
                  description: listTask[index]['description'],
                  status: listTask[index]['status'])),
        ));
  }
}
