import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';
import 'package:turbosoft/core/api/endpoints.dart';
import 'package:turbosoft/core/constents/colors/kcolors.dart';
import 'package:turbosoft/core/constents/fonts/kfonts.dart';
import 'package:turbosoft/feature/data/models/uset_base_model/uset_base_model.dart';
import 'package:turbosoft/feature/state/bloc/activeschemes/activeschemes_bloc.dart';
import 'package:turbosoft/feature/state/bloc/schemedetails/schemedetails_bloc.dart';
import 'package:turbosoft/feature/state/cubit/cubit/schemeselector_cubit.dart';

class SchemesWidget extends StatelessWidget {
  const SchemesWidget({super.key, required this.user});
  final UsetBaseModel user;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    context
        .read<ActiveschemesBloc>()
        .add(GetActiveSchemes(datakey: datakey, cusid: user.cusId!));
    return SizedBox(
      height: size.width / 3,
      child: BlocListener<ActiveschemesBloc, ActiveschemesState>(
        listener: (context, state) {
          state.when(
            activeAchemesState: (schemes) {
              if (schemes != null) {
                context.read<SchemedetailsBloc>().add(GetschemedetailsEvent(
                    cusid: user.cusId!,
                    schmId: schemes[0].schemeNo!,
                    datakeys: datakey,
                    scheme: schemes[0]));
              }
            },
            failedstate: () {},
          );
        },
        child: BlocBuilder<ActiveschemesBloc, ActiveschemesState>(
          builder: (context, state) {
            return state.when(
              activeAchemesState: (schemes) => schemes == null
                  ? ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SizedBox(
                              width: size.width / 2,
                              height: size.width / 5,
                              child: Shimmer.fromColors(
                                baseColor: kcolorgrey.withOpacity(0.2),
                                highlightColor: kcolorgrey.withOpacity(0.4),
                                child: const Card(),
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 0,
                          ),
                      itemCount: 3)
                  : ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: InkWell(
                              onTap: () async {
                                context
                                    .read<SchemeselectorCubit>()
                                    .selectscheme(index);
                                context.read<SchemedetailsBloc>().add(
                                    GetschemedetailsEvent(
                                        cusid: user.cusId!,
                                        schmId: schemes[index].schemeNo!,
                                        datakeys: datakey,
                                        scheme: schemes[index]));
                              },
                              child: BlocBuilder<SchemeselectorCubit,
                                  SchemeselectorState>(
                                builder: (context, selected) {
                                  return Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Container(
                                      width: size.width / 2,
                                      decoration: BoxDecoration(
                                        color: kcolorwhite,
                                        gradient: LinearGradient(
                                            colors: selected.idx == index
                                                ? [kgold1, kgold2]
                                                : [kcolorwhite, kcolorwhite],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Iconsax.global_edit,
                                                color: selected.idx == index
                                                    ? kcolorwhite
                                                    : kcolorblack,
                                              ),
                                              Text(
                                                schemes[index].schemeNo!,
                                                style: kprimaryfont(
                                                    fontSize: 16,
                                                    color: selected.idx == index
                                                        ? kcolorwhite
                                                        : kcolorblack),
                                              ),
                                              Text(
                                                '${schemes[index].schemeName} | ₹${schemes[index].totalAmount}',
                                                style: kprimaryfont(
                                                    fontSize: 10,
                                                    color: selected.idx == index
                                                        ? kcolorwhite
                                                        : kcolorblack),
                                              ),
                                            ]),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 0,
                          ),
                      itemCount: schemes.length),
              failedstate: () => const SizedBox(),
            );
          },
        ),
      ),
    );
  }
}
