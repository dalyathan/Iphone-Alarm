import 'package:provider/provider.dart';
import 'screens/main_page.dart';
import 'state/alarm_time_being_set.dart';
import 'state/alarms.dart';
import 'state/bedtime_being_set.dart';
import 'package:flutter/material.dart';
import 'state/sleep_duration_being_set.dart';

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
        ListenableProvider<AlarmTimeBeingSet>(
            create: (_) => AlarmTimeBeingSet()),
        ListenableProvider<Alarms>(create: (_) => Alarms()),
        ListenableProvider<BedTimeBeingSet>(create: (_) => BedTimeBeingSet()),
        ListenableProvider<SleepDurationBeingSet>(
            create: (_) => SleepDurationBeingSet())
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
