import 'package:flutter/material.dart';
// import 'dart:developer';

class ListItem extends StatelessWidget {
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // inspect(Theme.of(context));
    return Card(
      //  color: Colors.transparent,
      child: ListTile(
        title: TextFormField(
          controller: _textEditingController,
          // style: TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: 'Enter a sub-task',
            // hintStyle: TextStyle(color: Colors.white54),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
        leading: Checkbox(
          value: true,
          onChanged: print,
          checkColor: Theme.of(context).cardColor,
        ),
      ),
    );
  }
}
