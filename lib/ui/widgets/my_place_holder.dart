import 'package:flutter/material.dart';

class MyPlaceHolder extends StatelessWidget {
  final String message;
  final double fontSize;

  MyPlaceHolder({
    @required this.message,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(
          (message != null && message.isNotEmpty)
              ? message
              : 'Something went wrong',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w700,
            fontSize: fontSize ?? 16.0,
          ),
        ),
      ),
    );
  }
}
