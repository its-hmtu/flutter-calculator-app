import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String btnText;
  final btnPressed;
  final Color btnColor;
  
  const MyButton({required this.btnText, this.btnPressed, required this.btnColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: btnPressed,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        
        child: ClipRRect
        (
          borderRadius: BorderRadius.circular(45.0),
          child: Container 
          (
            color: btnColor,
            child: Center
            (
              child: Text 
              (
                btnText,
                style: TextStyle
                (
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 30,
                  fontWeight: FontWeight.w600
                )
              ),
            ), 
          ),
        ),
      ),
    );
  }
}