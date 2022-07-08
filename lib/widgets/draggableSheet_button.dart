import 'package:covid_info/screens/country_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class DraggableSheetButton extends StatelessWidget {
  final String buttonTitle;
  final dynamic onPress;

  DraggableSheetButton({required this.buttonTitle, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kButtonColor,
        ),
        child: Center(
          child: Text(
            buttonTitle.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
