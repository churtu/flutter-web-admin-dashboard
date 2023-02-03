import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const ClipOval(
      child: Image(
        height: 30,
        width: 30,
        image: NetworkImage('https://picsum.photos/200'),
      ),
    );
  }
}