import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbosoft/core/constents/colors/kcolors.dart';
import 'package:turbosoft/core/constents/fonts/kfonts.dart';
import 'package:turbosoft/feature/data/models/uset_base_model/uset_base_model.dart';
import 'package:turbosoft/feature/views/home/widgets/bottomsection.dart';
import 'package:turbosoft/feature/views/home/widgets/goldratewidget.dart';
import 'package:turbosoft/feature/views/home/widgets/schemeswidget.dart';

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
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () async {
                    final sharedprefs = await SharedPreferences.getInstance();
                    await sharedprefs.clear();
                    // final data = sharedprefs.get('user');
                    // log("$data");
                  },
                  icon: const Icon(
                    FontAwesomeIcons.bars,
                    size: 30,
                  )),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  leading: Container(
                    height: size.width / 2,
                    width: size.width / 6,
                    decoration: BoxDecoration(
                        color: kcolorwhite,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/user.png'))),
                  ),
                  title: Text(
                    user.cusName,
                    overflow: TextOverflow.ellipsis,
                    style:
                        kprimaryfont(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    user.cusMobileNumber,
                    overflow: TextOverflow.ellipsis,
                    style: kprimaryfont(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
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
    );
  }
}
