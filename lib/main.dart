import 'package:flutter/material.dart';

import 'ui/githistory/git_history.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Git Repo Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColorDark: Colors.black,
        primaryColorLight: Colors.black54,
        backgroundColor: Colors.white,
      ),
      home: GitHistory(title: 'Git Repo'),
    );
  }
}
