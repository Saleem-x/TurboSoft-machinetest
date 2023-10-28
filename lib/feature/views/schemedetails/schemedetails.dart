import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:turbosoft/core/constents/colors/kcolors.dart';
import 'package:turbosoft/core/constents/fonts/kfonts.dart';
import 'package:turbosoft/feature/data/models/customer_scheme_model/customer_scheme_model.dart';
import 'package:turbosoft/feature/data/models/scheme_details_model/scheme_details_model.dart';

class SchemeDetailsScreen extends StatelessWidget {
  final CustomerSchemeModel scheme;
  final SchemeDetailsModel schemedetail;
  const SchemeDetailsScreen(
      {super.key, required this.scheme, required this.schemedetail});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kbgcolor,
      appBar: AppBar(
        backgroundColor: kbgcolor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            FontAwesomeIcons.arrowLeft,
          ),
        ),
        title: Text(
          'Scheme Detail',
          style: kprimaryfont(
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        leading: Container(
                          height: 100,
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
                          scheme.schemeNo!,
                          overflow: TextOverflow.ellipsis,
                          style: kprimaryfont(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: kcolorblack.withOpacity(.6)),
                        ),
                        subtitle: Text(
                          '${scheme.schemeName!} | ${schemedetail.totAmount}',
                          overflow: TextOverflow.ellipsis,
                          style: kprimaryfont(
                            fontSize: 14,
                            color: kcolorblack.withOpacity(.6),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        'Started On : ${schemedetail.issueDate}',
                        style: kprimaryfont(
                          fontSize: 15,
                          color: kcolorblack.withOpacity(.6),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        'Closing On : ${schemedetail.closingDate}',
                        style: kprimaryfont(
                          fontSize: 15,
                          color: kcolorblack.withOpacity(.6),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        'Due Amount : ${double.parse(schemedetail.schemeAmount!) - double.parse(schemedetail.totAmount!) < 0 ? 0 : double.parse(schemedetail.schemeAmount!) - double.parse(schemedetail.totAmount!)}',
                        style: kprimaryfont(
                          fontSize: 15,
                          color: kcolorblack.withOpacity(.6),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        'Total Paid : ${schemedetail.schemeAmount}',
                        style: kprimaryfont(
                          fontSize: 15,
                          color: kcolorblack.withOpacity(.6),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        'Current Total Weight : ${schemedetail.goldWeight}',
                        style: kprimaryfont(
                          fontSize: 15,
                          color: kcolorblack.withOpacity(.6),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        'Pending Installents : ${schemedetail.noofInst}',
                        style: kprimaryfont(
                          fontSize: 15,
                          color: kcolorblack.withOpacity(.6),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Instalment History',
                    style: kprimaryfont(
                      fontSize: 14,
                      color: kcolorblack.withOpacity(.6),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      '( Click each item to view details )',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: kprimaryfont(
                        fontSize: 10,
                        color: kcolorblack.withOpacity(.6),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Image.asset('assets/images/phone.png'),
                        title: const Text(
                          '₹1000',
                        ),
                        subtitle: Text(
                          'Trans. No. : 154268',
                          style: kprimaryfont(
                            fontSize: 12,
                            color: kcolorblack.withOpacity(.6),
                          ),
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '18 Apr 2020',
                              style: kprimaryfont(
                                fontSize: 10,
                                color: kcolorblack.withOpacity(.6),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
