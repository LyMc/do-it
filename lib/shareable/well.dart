import 'package:flutter/material.dart';

class Well extends StatelessWidget {
  final Widget child;

  Well({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(30),
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
          color: const Color(0x20F1F0FF),
        ),
        child: child);
  }
}
