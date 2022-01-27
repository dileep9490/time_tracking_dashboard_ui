import 'package:flutter/material.dart';
import 'package:time_tracking_dashboard_ui/dashboard/views/dashboard_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Tracking Dashboard',
      theme: ThemeData(fontFamily: 'Rubik'),
      home: const DashBoradPage(),
    );
  }
}
