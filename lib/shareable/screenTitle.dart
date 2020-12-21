import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String title;

  ScreenTitle({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Center(
        child: Text(
          this.title,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 32, color: Colors.white),
        ),
      ),
    );
  }
}
