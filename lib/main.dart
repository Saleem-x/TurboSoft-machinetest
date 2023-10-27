import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbosoft/feature/data/di/injectable.dart';
import 'package:turbosoft/feature/state/bloc/activeschemes/activeschemes_bloc.dart';
import 'package:turbosoft/feature/state/bloc/goldrate/goldrate_bloc.dart';
import 'package:turbosoft/feature/state/bloc/login/login_bloc.dart';
import 'package:turbosoft/feature/state/bloc/schemedetails/schemedetails_bloc.dart';
import 'package:turbosoft/feature/state/bloc/splash/splash_bloc.dart';
import 'package:turbosoft/feature/views/splash/splashscreen.dart';

void main() async {
  configureinjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashBloc>(
          create: (context) => SplashBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => getit<GoldrateBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<ActiveschemesBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<SchemedetailsBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
