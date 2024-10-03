import 'package:flutter/material.dart';

class FeatureInProgressWidget extends StatelessWidget {
  const FeatureInProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Feature in Progress'),
      content: const SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('This feature is currently under development.'),
            Text('Please check back later for updates.'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}