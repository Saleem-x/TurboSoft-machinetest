import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:turbosoft/core/constents/colors/kcolors.dart';
import 'package:turbosoft/core/constents/fonts/kfonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    size: 40,
                  )),
              IconButton(
                onPressed: () {},
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: Container(
                  height: size.width / 2,
                  width: size.width / 6,
                  decoration: BoxDecoration(
                    color: kcolorred,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
                title: Text(
                  'Abdu Saleem',
                  overflow: TextOverflow.ellipsis,
                  style:
                      kprimaryfont(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  '+91 1234567890',
                  overflow: TextOverflow.ellipsis,
                  style: kprimaryfont(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
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
              SizedBox(
                height: size.width / 5,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/goldcoinimage.png',
                      height: 80,
                      width: 60,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Last Change !6 May 2020 | 12:30 PM',
                          style: kprimaryfont(
                            color: kcolorblack.withOpacity(.6),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '₹ 4,350.00',
                              style: kprimaryfont(
                                  color: kcolorblack,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '(1 gram)',
                              style: kprimaryfont(
                                color: kcolorblack.withOpacity(.6),
                              ),
                            )
                          ],
                        ),
                        Text(
                          '₹34,800.00 ( 8 grams )',
                          style: kprimaryfont(
                            color: kcolorblack.withOpacity(.6),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      'Gold rate shown in Thrissur is shown here. It may be varies with your region',
                      style: kprimaryfont(
                          color: kcolorblack.withOpacity(.6), fontSize: 9),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: [
                  Text(
                    'Active Schemes',
                    style: kprimaryfont(
                        color: kcolorblack.withOpacity(.6),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}