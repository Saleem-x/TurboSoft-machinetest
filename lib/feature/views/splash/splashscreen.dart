import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbosoft/core/constents/colors/kcolors.dart';
import 'package:turbosoft/feature/state/bloc/splash/splash_bloc.dart';
import 'package:turbosoft/feature/views/auth/loginscreen.dart';
import 'package:turbosoft/feature/views/home/homescreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    context.read<SplashBloc>().add(const CheckLogin());
    return Scaffold(
      body: BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) {
          state.when(
            userinstate: (user) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(
                      user: user,
                    ),
                  ),
                  (route) => false);
            },
            usernotinState: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                  (route) => false);
            },
          );
        },
        builder: (context, state) {
          return Stack(children: [
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
            )
          ]);
        },
      ),
    );
  }
}
