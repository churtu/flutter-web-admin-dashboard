import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final Color? color;
  final bool? isFilled;
  const CustomOutlinedButton({
    super.key, 
    this.onPressed, 
    required this.text, 
    this.color = Colors.blue, 
    this.isFilled = false
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const StadiumBorder()
        ),
        side: MaterialStateProperty.all(
          BorderSide(
            color: color!
          )
        ),
        backgroundColor: MaterialStateProperty.all(
          isFilled! ? color!.withOpacity(.3) : Colors.transparent
        )
      ),
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          text,
          style: TextStyle( fontSize: 16, color: color! ),
        ),
      ),
    );
  }
}