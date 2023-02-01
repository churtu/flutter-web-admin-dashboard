import 'package:admin_dashboard/src/ui/layouts/auth/widgets/links_bar.dart';
import 'package:admin_dashboard/src/ui/layouts/auth/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;
  const AuthLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Scrollbar(
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            size.width >= 1000
              ? _DesktopBody(child: child)
              : _MobileBody( child: child),
            const LinksBar()
          ],
        ),
      ));
  }
}

class _MobileBody extends StatelessWidget {
  final Widget child;
  const _MobileBody({
    Key? key, required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          const SizedBox(height: 20),
          const CustomTitle(),
          SizedBox(
           width: double.infinity,
           height: 420,
           child: child,
          ),
          const SizedBox(
            width: double.infinity,
            height: 400,
            child: BackgroundTwitter(),
          )
        ],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;
  const _DesktopBody({
    Key? key,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      width: size.width,
      height: size.height*.93,
      child: Row(
        children: [
          const BackgroundTwitter(),
          Container(
            color: Colors.black,
            width: 600,
            height: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 20),
                const CustomTitle(),
                const SizedBox( height: 50),
                Expanded(
                  child: child
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}