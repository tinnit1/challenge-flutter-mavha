import 'package:chmavha/src/pages/my_list_page.dart';
import 'package:chmavha/src/pages/schedule_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    'mylist': (BuildContext context) => MyListPage(),
    'schedule': (BuildContext context) => SchedulePage(),
  };
}