import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:turbosoft/core/constents/colors/kcolors.dart';
import 'package:turbosoft/core/constents/fonts/kfonts.dart';
import 'package:turbosoft/feature/state/bloc/schemedetails/schemedetails_bloc.dart';

class BottomSectionWidget extends StatelessWidget {
  const BottomSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocBuilder<SchemedetailsBloc, SchemedetailsState>(
      builder: (context, state) {
        return state.when(
          schemedetails: (schemedetail, scheme) => schemedetail == null ||
                  scheme == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Card(
                  color: kcolorwhite,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        50,
                      ),
                    ),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: kcolorwhite,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          40,
                        ),
                      ),
                    ),
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Instalment amount',
                                        style: kprimaryfont(
                                          fontSize: 14,
                                          color: kcolorblack.withOpacity(.6),
                                        ),
                                      ),
                                      Text(
                                        '₹${scheme.instAmount}',
                                        style: kprimaryfont(
                                            fontSize: 22,
                                            color: kcolorblack,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      Text(
                                        'Due Amount: ${double.parse(schemedetail.schemeAmount!) - double.parse(schemedetail.totAmount!) < 0 ? 0 : double.parse(schemedetail.schemeAmount!) - double.parse(schemedetail.totAmount!)}',
                                        style: kprimaryfont(
                                          fontSize: 14,
                                          color: kcolorblack.withOpacity(.6),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      Text(
                                        'Due Date: ${schemedetail.dueDate!}',
                                        style: kprimaryfont(
                                          fontSize: 14,
                                          color: kcolorblack.withOpacity(.6),
                                        ),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    splashFactory: InkRipple.splashFactory,
                                    splashColor: kcolorred,
                                    child: Column(
                                      children: [
                                        const Icon(
                                          FontAwesomeIcons.arrowRight,
                                        ),
                                        Text(
                                          'View Details',
                                          style: kprimaryfont(
                                            fontSize: 10,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Payable Amount',
                                          style: kprimaryfont(
                                            fontSize: 14,
                                            color: kcolorblack.withOpacity(.6),
                                          ),
                                        ),
                                        TextFormField(
                                          decoration: InputDecoration(
                                            border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    kcolorblack.withOpacity(.6),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Divider()
                                      ],
                                    ),
                                  ),
                                  MaterialButton(
                                    minWidth: size.height * 0.03,
                                    height: size.height * 0.05,
                                    color: kcolorred.shade800,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      'Pay',
                                      style: kprimaryfont(color: kcolorwhite),
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                textAlign: TextAlign.start,
                                'Enter an amount greater than or equal to the Instalment amount',
                                style: kprimaryfont(
                                  fontSize: 10,
                                  color: kcolorblack.withOpacity(.6),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/regal j logo (1).png',
                                    fit: BoxFit.cover,
                                    height: 40,
                                    width: 40,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'REGAL',
                                        style: logofont(
                                            color: kcolorred.shade700,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        'JEWELLERS',
                                        style: logofont(
                                            color: kcolorred.shade700,
                                            fontSize: 6,
                                            letterSpacing: 4),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Text(
                                'A Regal Jewellery Initiative',
                                style: kprimaryfont(
                                  fontSize: 10,
                                  color: kcolorblack.withOpacity(.4),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
