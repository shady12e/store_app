import 'package:flutter/material.dart';
import 'package:store_app_2/constens.dart';

// ignore: must_be_immutable
class CustomElevatedButtoms extends StatelessWidget {
  CustomElevatedButtoms({super.key, required this.ontap , required this.text});
  VoidCallback? ontap;
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(KPriymryColor),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
        ),
        onPressed: ontap,
        child: Text(
          text,
        ),
      ),
    );
  }
}
