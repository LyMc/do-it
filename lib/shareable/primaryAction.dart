import 'package:flutter/material.dart';
import '../theme.dart';

class PrimaryAction extends StatelessWidget {
  final String text;
  final GestureTapCallback onPressed;

  PrimaryAction({@required this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: this.onPressed,
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 40, right: 40),
      textColor: Colors.black87,
      color: AppColors.yellow,
      child: Text(
        this.text,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
