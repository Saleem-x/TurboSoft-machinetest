import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:turbosoft/core/constents/colors/kcolors.dart';

class GoldrateSkelton extends StatelessWidget {
  const GoldrateSkelton({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.width / 5,
      child: Shimmer.fromColors(
        baseColor: kcolorgrey.withOpacity(0.2),
        highlightColor: kcolorgrey.withOpacity(0.4),
        child: const Card(),
      ),
    );
  }
}
