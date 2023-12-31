import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:turbosoft/core/constents/colors/kcolors.dart';
import 'package:turbosoft/core/constents/fonts/kfonts.dart';
import 'package:turbosoft/feature/state/bloc/login/login_bloc.dart';
import 'package:turbosoft/feature/views/auth/widgets/logowidget.dart';
import 'package:turbosoft/feature/views/home/homescreen.dart';

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
          BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              state.when(
                initialstate: () {},
                successstate: (user) {
                  FocusManager.instance.primaryFocus?.unfocus();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(user: user),
                      ),
                      (route) => false);
                },
                failedstate: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: kcolorred,
                      content: Row(
                        children: [
                          const Icon(
                            Iconsax.info_circle,
                            color: kcolorwhite,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Something went wrong',
                            style: kprimaryfont(),
                          )
                        ],
                      )));
                },
                exceptionalstate: (message) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: kcolorred,
                      content: Row(
                        children: [
                          const Icon(
                            Iconsax.info_circle,
                            color: kcolorwhite,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(message)
                        ],
                      )));
                },
                loadingstate: () {},
              );
            },
            builder: (context, state) {
              return state.when(
                initialstate: () => const LogoWidget(),
                successstate: (user) => const LogoWidget(),
                failedstate: () => const LogoWidget(),
                exceptionalstate: (message) => const LogoWidget(),
                loadingstate: () => Stack(children: [
                  Container(
                    height: size.height,
                    width: size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/splashimage.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: size.height,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: kcolorgrey.withOpacity(.7),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/logo_splash.png',
                      ),
                    ),
                  ),
                  const Positioned(
                      bottom: 0,
                      child: LinearProgressIndicator(
                        color: Colors.green,
                      ))
                ]),
              );
            },
          ),
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
