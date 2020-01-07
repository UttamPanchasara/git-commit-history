import 'package:flutter/material.dart';

import 'ui/githistory/git_history.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        primaryColorDark: Colors.black,
        accentColor: Colors.orange,
      ),
      home: GitHistory(title: 'Git Commit History'),
    );
  }
}
