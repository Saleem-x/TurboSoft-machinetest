import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:turbosoft/core/constents/colors/kcolors.dart';
import 'package:turbosoft/core/constents/fonts/kfonts.dart';
import 'package:turbosoft/feature/views/auth/widgets/inputfieldwidget.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:turbosoft/feature/views/home/homescreen.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/regal j logo (1).png',
                      height: 100,
                      width: 100,
                    ),
                    Text(
                      'REGAL',
                      style: logofont(color: kcolorred.shade700, fontSize: 43),
                    ),
                    Text(
                      'JEWELLERS',
                      style: logofont(
                          color: kcolorred.shade700,
                          fontSize: 18,
                          letterSpacing: 4),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Row(
                      children: [
                        Text(
                          'Welcome',
                          style: kprimaryfont(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: kcolorblack.withOpacity(
                              0.6,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '+91',
                  style: kprimaryfont(fontSize: 18),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '|',
                  style: TextStyle(
                    fontSize: 20,
                    color: kcolorblack.withOpacity(0.6),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Expanded(
                  child: InputFieldWidget(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter Your Pin',
                style: kprimaryfont(
                    fontSize: 16,
                    color: kcolorblack.withOpacity(0.5),
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: OTPTextField(
              length: 4,
              width: size.width,
              fieldWidth: 60,
              style: const TextStyle(fontSize: 17),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.box,
              otpFieldStyle: OtpFieldStyle(
                backgroundColor: kcolorwhite,
                borderColor: kcolorwhite,
                disabledBorderColor: kcolorwhite,
                enabledBorderColor: kcolorwhite,
                errorBorderColor: kcolorwhite,
                focusBorderColor: kcolorwhite,
              ),
              onCompleted: (pin) {
                // print("Completed: " + pin);
              },
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                minWidth: size.width / 3,
                color: kcolorred.shade800,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (route) => false);
                },
                child: Text(
                  'Login',
                  style: kprimaryfont(color: kcolorwhite),
                ),
              )
            ],
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Forgot yor pin ?',
                style: kprimaryfont(
                    fontSize: 14,
                    color: kcolorblack.withOpacity(0.5),
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Forgot yor pin ?',
                style: kprimaryfont(
                  fontSize: 14,
                  color: kcolorred.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
