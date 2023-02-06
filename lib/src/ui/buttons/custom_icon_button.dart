
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final Color color;
  final bool isFilled;
  final IconData icon;

  const CustomIconButton({
    super.key, 
    this.onPressed, 
    this.color = Colors.blue, 
    this.isFilled = false, 
    required this.text, 
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        backgroundColor: MaterialStateProperty.all(color.withOpacity(.5)),
        overlayColor: MaterialStateProperty.all(color.withOpacity(.3)),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          Text(text, style: const TextStyle(color: Colors.white))
        ],
      ),
      
    );
  }
}