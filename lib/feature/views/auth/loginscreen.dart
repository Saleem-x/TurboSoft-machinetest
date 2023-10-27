import 'package:flutter/material.dart';
import 'package:turbosoft/core/constents/colors/kcolors.dart';
import 'package:turbosoft/core/constents/fonts/kfonts.dart';
import 'package:turbosoft/feature/views/auth/widgets/logowidget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/bg.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const LogoWidget(),
          Positioned(
              bottom: 5,
              left: 10,
              child: Row(
                children: [
                  Text(
                    'Terms & Conditions | Privacy Policy',
                    style: kprimaryfont(
                        fontSize: 10, color: kcolorblack.withOpacity(.6)),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
