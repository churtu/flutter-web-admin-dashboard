import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMenuItem extends StatefulWidget {
  final String text;
  final IconData icon;
  final bool isActive;
  final Function()? onPressed;

  const CustomMenuItem({
    super.key, 
    required this.text, 
    required this.icon, 
    this.isActive = false, 
    required this.onPressed
  });

  @override
  State<CustomMenuItem> createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      color: (isHovered || widget.isActive)
        ? Colors.white.withOpacity(.1)
        : Colors.transparent,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: !widget.isActive ? widget.onPressed : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: MouseRegion(
              onEnter: (event) => setState(() {
                isHovered = true;
              }),
              onExit: (event) => setState(() {
                isHovered = false;
              }),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(widget.icon, color: Colors.white.withOpacity(.3)),
                  const SizedBox(width: 10),
                  Text(
                    widget.text,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.white.withOpacity(.8)
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}