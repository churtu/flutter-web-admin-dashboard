import 'package:flutter/material.dart';

class LinkText extends StatefulWidget {
  final String text;
  final Function()? onPressed;
  const LinkText({super.key, required this.text, this.onPressed});

  @override
  State<LinkText> createState() => _LinkTextState();
}

class _LinkTextState extends State<LinkText> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: MouseRegion(
        onEnter: (event) => setState(() {
          _isHover = true;
        }),
        onExit: (event) => setState(() {
          _isHover = false;
        }),
        cursor: SystemMouseCursors.click,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            widget.text,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16,
              decoration: _isHover ? TextDecoration.underline : TextDecoration.none
            ),
          ),
        ),
      ),
    );
  }
}