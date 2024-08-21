import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:technofra/Utils/CommonWidgets/Custombutton.dart';
import 'package:technofra/Utils/CommonWidgets/sized_box.dart';
import 'package:technofra/routes/route_name.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 291.h,
              width: Get.width,
              child:
                  Image.asset('assets/images/jpg/onboarding illustartion.png')),
          sizedBoxHeight(58),
          Text(
            "Simplify, Organize, and Conquer Your Day",
            style: TextStyle(fontSize: 30.spMin, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          sizedBoxHeight(40),
          Text(
            "Take control of your tasks and projects.",
            style: TextStyle(fontSize: 18.spMin, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          sizedBoxHeight(70),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: CustomButton(
              ontap: () {
                Get.offAllNamed(RouteName.loginScreen);
              },
              text: 'Let’s Start',
            ),
          ),
        ],
      ),
    );
  }
}
