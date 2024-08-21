import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technofra/Utils/Helpers/colors.dart';

class CustomButton extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  CustomButton({
    super.key,
    this.ontap,
    required this.text,
    this.colorchange = false,
    this.productid,
  });

  final bool colorchange;
  final GestureTapCallback? ontap;
  final String text;
  final String? productid;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          shadowColor: const Color.fromARGB(255, 220, 220, 226),
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.h),
          ),
        ),
        onPressed: () {
          ontap!();
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
