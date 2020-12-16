import 'package:do_it/shareable/screenTitle.dart';
import 'package:do_it/strategies/overwhelmed/item.dart';
import 'package:do_it/theme.dart';
import 'package:flutter/material.dart';

class OverwhelmedListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: AppColors.purple,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              ScreenTitle(title: 'List how you\'ll know you\'re done'),
              Container(
                height: 600,
                padding: EdgeInsets.all(8),
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: [
                    ListItem(),
                    ListItem(),
                    ListItem(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
