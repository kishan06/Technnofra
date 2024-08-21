import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:technofra/Utils/CommonWidgets/CommonTextFormField.dart';
import 'package:technofra/Utils/CommonWidgets/Custombutton.dart';
import 'package:technofra/Utils/CommonWidgets/sized_box.dart';
import 'package:technofra/Utils/Helpers/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 28),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/jpg/AppLogo.png',
                      height: 41,
                      width: 142,
                    ),
                  ],
                ),
                const SizedBox(height: 50),

                const Text(
                  'Enter your mobile number',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),

                const Text(
                  'We will send you OTP on this mobile number',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 82),

                // Mobile number input
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFF6F6F6),
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFF6F6F6),
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        const Text(
                          '+91',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 10),
                        const VerticalDivider(
                          thickness: 2,
                          indent: 5.5,
                          endIndent: 5.5,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: CustomTextFormField(
                              texttype: TextInputType.number,
                              textEditingController: numberController,
                              hintText: 'Enter your mobile number',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 204),

                CustomButton(text: "Continue"),
                SizedBox(height: 40.h),

                // Terms & Conditions text
                GestureDetector(
                  onTap: () {
                    // Handle Terms & Conditions tap
                  },
                  child: Center(
                    child: const Text(
                      'Terms & Conditions to use crm app',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
