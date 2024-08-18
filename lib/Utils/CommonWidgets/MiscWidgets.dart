
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
Widget commonDivider() {
  return Container(
    height: 1.5.h,
    width: double.infinity,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromRGBO(255, 255, 255, 0.07),
          Color.fromRGBO(255, 255, 255, 0.09),
        ],
        transform: GradientRotation(1.78),
      ),
    ),
  );
}


Future<void> datePicker(
    BuildContext context, TextEditingController controller) async {
  final ThemeData customTheme = Theme.of(context).copyWith(
      colorScheme: const ColorScheme.light(
          primary: Color(0xFFD90B2E),
          surfaceTint: Color(0xFF222935),
          surface: Color(0xFF222935),
          onPrimary: Colors.white,
          onSurface: Colors.white,
          onSecondary: Colors.white),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFFD90B2E),
        ),
      ));
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime(2100),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: customTheme,
        child: child!,
      );
    },
  );

  if (picked != null) {
    controller.text = DateFormat('yyyy-MM-dd').format(picked);
  }
}

Future<TimeOfDay?> showCustomTimePicker(BuildContext context,
    {TimeOfDay? initialTime}) {
  final ThemeData customTheme2 = Theme.of(context).copyWith(
      colorScheme: const ColorScheme.light(
        primary: Color(0xFFD90B2E),
        surfaceTint: Color(0xFF222935),
        surface: Color(0xFF222935),
        onPrimary: Colors.white,
        onSurface: Colors.white,
      ),
      textTheme: Theme.of(context).textTheme.copyWith(
            titleLarge:
                const TextStyle(color: Colors.blue), // Change the title color
          ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFFD90B2E),
        ),
      ));
  return showTimePicker(
    context: context,
    initialTime: initialTime ?? TimeOfDay.now(),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: customTheme2,
        child: child!,
      );
    },
  );
}

Widget stackContainers({
  required String number,
  required List<String> containerImages,
}) {
  return Row(
    children: [
      Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFD90B2E),
              border: Border.all(color: const Color(0xFF2C3742), width: 1),
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 8,
                ),
              ),
            ),
          ),
          Positioned(
            left: 22.w,
            child: SizedBox(
              height: 30,
              width: 50,
              child: Stack(
                clipBehavior: Clip.none,
                children: List.generate(containerImages.length, (index) {
                  return Positioned(
                    left: index * 22.w,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: const Color(0xFF2C3742), width: 1),
                      ),
                      child: CircleAvatar(
                        foregroundImage: AssetImage(containerImages[index]),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
