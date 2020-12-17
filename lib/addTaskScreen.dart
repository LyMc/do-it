import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'theme.dart';
import 'tasksController.dart';
import 'decision-tree/hateTaskDecisionScreen.dart';
import 'shareable/screenTitle.dart';
import 'shareable/primaryAction.dart';

class AddTaskScreen extends StatelessWidget {
  final TasksController _tasksController = Get.find();

  final _textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Container(
            decoration: BoxDecoration(color: AppColors.purple),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      headerImage,
                      ScreenTitle(title: "What is your task?"),
                      Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextFormField(
                                controller: _textEditingController,
                                style: TextStyle(color: Colors.white),
                                autofocus: true,
                                decoration: const InputDecoration(
                                  hintText: 'Enter your task',
                                  hintStyle: TextStyle(color: Colors.white),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.cyan),
                                  ),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your task';
                                  }
                                  return null;
                                },
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 100),
                                  child: PrimaryAction(
                                      text: "Next",
                                      onPressed: () {
                                        // Validate will return true if the form is valid, or false if
                                        // the form is invalid.
                                        if (_formKey.currentState.validate()) {
                                          _tasksController.createTask(
                                              _textEditingController.text);
                                          Get.to(HateTaskDecisionScreen());
                                        }
                                      }))
                            ],
                          ))
                    ]))));
  }

  final headerImage = Container(
    width: 500,
    height: 400,
    child: SvgPicture.asset(
      'assets/addTask.svg',
    ),
  );
}
