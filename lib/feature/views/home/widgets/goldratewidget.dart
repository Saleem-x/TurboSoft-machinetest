import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbosoft/core/api/endpoints.dart';
import 'package:turbosoft/core/constents/colors/kcolors.dart';
import 'package:turbosoft/core/constents/fonts/kfonts.dart';
import 'package:turbosoft/feature/state/bloc/goldrate/goldrate_bloc.dart';
import 'package:turbosoft/feature/views/home/widgets/goldrateskelton.dart';

class GoldRateWidget extends StatelessWidget {
  const GoldRateWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    context.read<GoldrateBloc>().add(const GetgoldRateEvent(datakey: datakey));
    return BlocBuilder<GoldrateBloc, GoldrateState>(
      builder: (context, state) {
        return SizedBox(
          height: size.width / 5,
          child: state.when(
            goldratestate: (goldrate) => goldrate == null
                ? const GoldrateSkelton()
                : Row(
                    children: [
                      Image.asset(
                        'assets/images/GoldRate.png',
                        height: 80,
                        width: 60,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Last Change ${goldrate.entryDate} | ${goldrate.entryTime}',
                              overflow: TextOverflow.ellipsis,
                              style: kprimaryfont(
                                color: kcolorblack.withOpacity(.6),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    '₹${goldrate.boardRate}',
                                    style: kprimaryfont(
                                        color: kcolorblack,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    '(${goldrate.weight} gram)',
                                    style: kprimaryfont(
                                      color: kcolorblack.withOpacity(.6),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Expanded(
                              child: Text(
                                '₹${goldrate.totalPrice} ( 8 grams )',
                                style: kprimaryfont(
                                    color: kcolorblack.withOpacity(.6),
                                    fontSize: 11),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
            failedState: () => Row(
              children: [
                Image.asset(
                  'assets/images/GoldRate.png',
                  height: 80,
                  width: 60,
                ),
                const SizedBox(
                  width: 20,
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
                          color: kcolorblack.withOpacity(.6), fontSize: 10),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
