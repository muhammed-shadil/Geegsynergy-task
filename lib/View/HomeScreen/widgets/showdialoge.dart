import 'package:flutter/material.dart';
import 'package:geeksynergy_mechine_task/Utils/constants.dart';
import 'package:geeksynergy_mechine_task/Utils/styles.dart';

void showCompanyInfoDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: constants.backgroundColor,
        title: const Text(
          'Company Info',
          style: styles.textfieldhintstyle,
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Company: Geeksynergy Technologies Pvt Ltd'),
            SizedBox(height: 8),
            Text('Address: Sanjayanagar, Bengaluru-56'),
            SizedBox(height: 8),
            Text('Phone: XXXXXXXXX09'),
            SizedBox(height: 8),
            Text('Email: XXXXXX@gmail.com'),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
