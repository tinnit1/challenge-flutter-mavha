import 'package:chmavha/src/widgets/cardDay.dart';
import 'package:chmavha/src/widgets/cardTodo.dart';
import 'package:chmavha/src/widgets/customButton.dart';
import 'package:chmavha/src/widgets/generalAppbar.dart';
import 'package:chmavha/src/widgets/header.dart';
import 'package:flutter/material.dart';

class MyListPage extends StatefulWidget {
  @override
  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  int position = 4;
  var days = [
    {'day': 'SUN', 'number': '28'},
    {'day': 'MON', 'number': '29'},
    {'day': 'TUE', 'number': '30'},
    {'day': 'WED', 'number': '1'},
    {'day': 'THU', 'number': '2'},
    {'day': 'FRI', 'number': '3'},
    {'day': 'SAT', 'number': '4'},
  ];
  var listTask = [
    {
      'icon': Icons.assignment,
      'task': 'All Tasks',
      'numberItems': 20,
    },
    {
      'icon': Icons.perm_identity,
      'task': 'Personal',
      'numberItems': 100,
    },
    {
      'icon': Icons.work,
      'task': 'Work',
      'numberItems': 100,
    },
    {
      'icon': Icons.lightbulb_outline,
      'task': 'Ideas',
      'numberItems': 1000,
    },
    {
      'icon': Icons.palette,
      'task': 'Art Work',
      'numberItems': 42,
    },
    {
      'icon': Icons.priority_high,
      'task': 'Urgently',
      'numberItems': 2,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppbar.appbar(
          context: context, titleText: 'MY LIST', icon: Icons.more_horiz),
      body: Stack(
        children: [
          _listTask(context),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Stack(
              children: [_calendar(context), _selectDay()],
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
      child: Container(child: CustomButtonPage(
        onPress: () {
          Navigator.pushNamed(context, 'schedule', arguments: {
            'day': days[position]['day'],
            'number': days[position]['number']
          });
        },
      )),
    );
  }

  Container _listTask(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60.0),
      child: Container(
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.only(top: 40.0),
          children: List.generate(
              listTask.length,
              (index) => Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
                      child: CardTodoPage(
                        icon: listTask[index]['icon'],
                        task: listTask[index]['task'],
                        numberItems: listTask[index]['numberItems'],
                      ),
                    ),
                  )),
        ),
      ),
    );
  }

  Container _calendar(BuildContext context) {
    return Container(child: HeaderPage());
  }

  Row _selectDay() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            days.length,
            (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      position = index;
                    });
                  },
                  child: CardDayPage(
                    nameDay: days[index]['day'],
                    numberDay: days[index]['number'],
                    colorText:
                        index == position ? Color(0xFF4042C9) : Colors.white,
                    colorbackground:
                        index == position ? Colors.white : Color(0xff2D34AD),
                  ),
                )));
  }
}
