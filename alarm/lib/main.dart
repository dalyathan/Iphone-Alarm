import 'package:alarm/screens/main_page.dart';
import 'package:alarm/state/alarm_time_being_set.dart';
import 'package:alarm/state/alarms.dart';
import 'package:alarm/state/bedtime_being_set.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<AlarmTimeBeingSetProvider>(
            create: (_) => AlarmTimeBeingSetProvider()),
        ListenableProvider<AlarmsProvider>(create: (_) => AlarmsProvider()),
        ListenableProvider<BedTimeBeingSetProvider>(
            create: (_) => BedTimeBeingSetProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainPage(),
      ),
    );
  }
}
