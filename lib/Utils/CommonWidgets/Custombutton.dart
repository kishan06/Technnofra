import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technofra/Utils/Helpers/colors.dart';

class CustomInvestNowButton extends StatelessWidget {
  const CustomInvestNowButton({
    Key? key,
    GlobalKey<FormState>? form,
    this.ontap,
    required this.text,
    this.colorchange = false,
    this.productid,
  }) : super(key: key);

  final bool colorchange;
  final GestureTapCallback? ontap;
  final String text;
  final String? productid;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          shadowColor: Color.fromARGB(255, 220, 220, 226),

          backgroundColor: AppColors.primary,

          //  color: Color(0xFFFFB600),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.h),
          ),
        ),
        onPressed: () {
          ontap!();
          // productid;
        },
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.secondary,
            fontSize: 18.sp,
          ),
        ),
      ),
    );
  }
}
