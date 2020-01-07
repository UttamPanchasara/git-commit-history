import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomBorderButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final double width;
  final double height;
  final bool enabled;

  const CustomBorderButton({
    @required this.onPressed,
    this.text,
    this.width,
    this.height,
      this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onPressed : null,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.green.withOpacity(0.8))
        ),
        margin: EdgeInsets.all(5.0),
        width: width ?? 60.0,
        height: height ?? 16.0,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.0,
            fontFamily: 'OpenSansRegular',
            color: Colors.green.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}
