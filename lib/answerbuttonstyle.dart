import 'package:flutter/material.dart';

class Answserbutton extends StatelessWidget {
 


  const Answserbutton({super.key,required this.answsertext,required this.onTap,});
   final String answsertext;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
       
      ),
      child: Text(answsertext),
    );
  }
}