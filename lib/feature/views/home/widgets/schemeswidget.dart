import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:turbosoft/core/constents/colors/kcolors.dart';
import 'package:turbosoft/core/constents/fonts/kfonts.dart';

class SchemesWidget extends StatelessWidget {
  const SchemesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width / 3,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    width: size.width / 2,
                    decoration: BoxDecoration(
                      color: kcolorwhite,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Iconsax.global_edit,
                            ),
                            Text(
                              '35612 - AK',
                              style: kprimaryfont(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Akshayanidhi | ₹ 30000.00',
                              style: kprimaryfont(
                                fontSize: 10,
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: 0,
              ),
          itemCount: 3),
    );
  }
}
