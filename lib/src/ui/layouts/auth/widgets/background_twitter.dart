import 'package:flutter/material.dart';

class BackgroundTwitter extends StatelessWidget {
  const BackgroundTwitter({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.width >= 1000 ?  Expanded(
        child: _BackgroundTwitterBody()
      ) :  _BackgroundTwitterBody();
  }
}

class _BackgroundTwitterBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: _buildBoxDecoration(),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Image(
                  image: AssetImage('twitter-white-logo.png'),
                  width: 400,
                ),
              ),
            ),
          ),
        );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
    image: DecorationImage(
      image: AssetImage('twitter-bg.png'),
      fit: BoxFit.cover
    )
  );
}
