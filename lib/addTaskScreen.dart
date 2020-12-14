import 'package:do_it/hateTaskDecisionScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'theme.dart';
import 'tasksController.dart';

class AddTaskScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TasksController tasks = Get.find();
    final textEditingController = TextEditingController();

    return Material(
        type: MaterialType.transparency,
        child: Container(
            child: Container(
                decoration: BoxDecoration(color: AppColors.purple),
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          headerImage,
                          title,
                          Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: textEditingController,
                                    style: TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                        hintText: 'Enter your task',
                                        hintStyle:
                                            TextStyle(color: Colors.white)),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter your task';
                                      }
                                      return null;
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 100),
                                    child: RaisedButton(
                                      onPressed: () {
                                        // Validate will return true if the form is valid, or false if
                                        // the form is invalid.
                                        if (_formKey.currentState.validate()) {
                                          tasks.addTask(
                                              textEditingController.text);
                                          Get.off(HateTaskDecisionScreen());
                                        }
                                      },
                                      padding: const EdgeInsets.only(
                                          top: 15,
                                          bottom: 15,
                                          left: 40,
                                          right: 40),
                                      textColor: Colors.black87,
                                      color: AppColors.yellow,
                                      child: Text("Next",
                                          style: TextStyle(fontSize: 24)),
                                    ),
                                  ),
                                ],
                              ))
                        ])))));
  }

  final headerImage = Container(
    width: 500,
    height: 400,
    child: SvgPicture.asset(
      'assets/addTask.svg',
    ),
  );

  final title = Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Text(
        "What is your task?",
        style: TextStyle(fontSize: 32, color: Colors.white),
      ));
}
