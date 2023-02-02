import 'package:admin_dashboard/src/ui/buttons/buttons.dart';
import 'package:flutter/material.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.width >= 1000 ? size.height*.07 : null,
      color: Colors.black,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        children: [
          LinkText( text: 'About' , onPressed: () {} ),
          const LinkText( text: 'Help Center' ),
          const LinkText( text: 'Terms of Service' ),
          const LinkText( text: 'Privacy Policy' ),
          const LinkText( text: 'Cookie Policy' ),
          const LinkText( text: 'Ads Info' ),
          const LinkText( text: 'Blog' ),
          const LinkText( text: 'Status' ),
          const LinkText( text: 'Careers' ),
          const LinkText( text: 'Brand Resources'),
          const LinkText( text: 'Advertising'),
          const LinkText( text: 'Marketing'),
          const LinkText( text: 'Twitter for Bussines' ),
          const LinkText( text: 'Developers' ),
          const LinkText( text: 'Directory' ),
          const LinkText( text: 'Settings' ),
          const LinkText( text: '© 2021 Twitter, Inc' ),


        ],
      ),
    );
  }
}