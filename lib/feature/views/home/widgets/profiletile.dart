import 'package:flutter/material.dart';
import 'package:turbosoft/core/constents/colors/kcolors.dart';
import 'package:turbosoft/core/constents/fonts/kfonts.dart';
import 'package:turbosoft/feature/data/models/uset_base_model/uset_base_model.dart';

class ProfileTileWidget extends StatelessWidget {
  const ProfileTileWidget({super.key, required this.user});
  final UsetBaseModel user;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Row(
        children: [
          Container(
            height: size.width / 5,
            width: size.width / 5,
            decoration: BoxDecoration(
                color: kcolorwhite,
                borderRadius: BorderRadius.circular(
                  10,
                ),
                image: const DecorationImage(
                    image: AssetImage('assets/images/user.png'),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.cusName,
                  overflow: TextOverflow.ellipsis,
                  style:
                      kprimaryfont(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  user.cusMobileNumber,
                  overflow: TextOverflow.ellipsis,
                  style: kprimaryfont(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
