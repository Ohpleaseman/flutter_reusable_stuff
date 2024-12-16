import 'package:flutter/material.dart';

void showYesNoDialog({
  required BuildContext context,
  required String title,
  required VoidCallback onPositiveButtonClick,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(title),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onPositiveButtonClick();
            },
            child: Text('Yes'),
          ),
        ],
      );
    },
  );
}
