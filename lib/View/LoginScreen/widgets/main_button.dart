// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:geeksynergy_mechine_task/Utils/constants.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    // required this.buttontext,
    this.onpressed,
    this.child,
  });
  // final String? buttontext;
  final Function()? onpressed;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: constants.secodarycolor,
        ),
        child: child,
      ),
    );
  }
}
