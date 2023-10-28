import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbosoft/core/constents/colors/kcolors.dart';
import 'package:turbosoft/core/constents/fonts/kfonts.dart';
import 'package:turbosoft/feature/data/models/uset_base_model/uset_base_model.dart';
import 'package:turbosoft/feature/state/bloc/activeschemes/activeschemes_bloc.dart';
import 'package:turbosoft/feature/state/bloc/goldrate/goldrate_bloc.dart';
import 'package:turbosoft/feature/views/auth/loginscreen.dart';
import 'package:turbosoft/feature/views/home/widgets/bottomsection.dart';
import 'package:turbosoft/feature/views/home/widgets/goldratewidget.dart';
import 'package:turbosoft/feature/views/home/widgets/profiletile.dart';
import 'package:turbosoft/feature/views/home/widgets/schemeswidget.dart';

import '../../../core/api/endpoints.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.user});
  final UsetBaseModel user;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kbgcolor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PopupMenuButton(
                child: const Icon(FontAwesomeIcons.bars),
                onSelected: (value) async {
                  if (value == 'logout') {
                    final sharedprefs = await SharedPreferences.getInstance();
                    await sharedprefs.clear();
                    // ignore: use_build_context_synchronously
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                        (route) => false);
                  }
                },
                itemBuilder: (BuildContext bc) {
                  return [
                    const PopupMenuItem(
                      value: 'close',
                      child: Icon(Iconsax.close_circle),
                    ),
                    PopupMenuItem(
                      value: 'about',
                      child: Text(
                        "About",
                        style: kprimaryfont(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: kcolorblack.withOpacity(.6)),
                      ),
                    ),
                    PopupMenuItem(
                      value: 't&c',
                      child: Text(
                        "Terms and Conditions",
                        style: kprimaryfont(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: kcolorblack.withOpacity(.6)),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'privacy',
                      child: Text(
                        "privacy policy",
                        style: kprimaryfont(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: kcolorblack.withOpacity(.6)),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'logout',
                      child: Text(
                        "Logout",
                        style: kprimaryfont(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: kcolorblack.withOpacity(.6)),
                      ),
                    )
                  ];
                },
              ),
              IconButton(
                onPressed: () async {},
                icon: const Icon(
                  Iconsax.notification,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          context
              .read<GoldrateBloc>()
              .add(const GetgoldRateEvent(datakey: datakey));
          context
              .read<ActiveschemesBloc>()
              .add(GetActiveSchemes(datakey: datakey, cusid: user.cusId!));
          return refresh();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              children: [
                ProfileTileWidget(user: user),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        "Today's Gold Rate",
                        style: kprimaryfont(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: kcolorblack.withOpacity(.5)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GoldRateWidget(size: size),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.center,
                          'Gold rate shown in Thrissur is shown here. It may be varies with your region',
                          style: kprimaryfont(
                              color: kcolorblack.withOpacity(.6), fontSize: 8),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.011,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        'Active Schemes',
                        style: kprimaryfont(
                            color: kcolorblack.withOpacity(.6),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SchemesWidget(user: user),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const BottomSectionWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> refresh() async {}
