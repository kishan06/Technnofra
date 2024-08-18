import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.validator,
    this.textEditingController,
    this.hintText,
    this.leadingIcon,
    this.prefixIconColor = const Color(0xFF737373),
    this.isInputPassword = false,
    this.validatorText,
    this.value,
    this.readonly = false,
    this.enabled = true,
    this.maxlines = 1,
    this.texttype,
    this.inputFormatters,
    this.onInput,
    this.onTap,
    this.textCapV,
    this.suffixIcon,
  });

  final dynamic validator;
  final TextEditingController? textEditingController;
  final String? hintText;
  final Widget? leadingIcon;
  final Color prefixIconColor;
  final bool isInputPassword;
  final String? validatorText;
  final String? value;
  final bool readonly;
  final bool enabled;
  final int maxlines;
  final TextInputType? texttype;
  final dynamic inputFormatters;
  final Function(String)? onInput;
  final VoidCallback? onTap;
  final TextCapitalization? textCapV;
  final Widget? suffixIcon;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isInputPassword;
  }

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
        textAlignVertical: TextAlignVertical.center,
        cursorColor: const Color(0xff4A73FB),
        initialValue: widget.value,
        readOnly: widget.readonly,
        onTap: widget.onTap,
        enabled: widget.enabled,
        enableInteractiveSelection: false,
        maxLines: widget.maxlines,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: obscureText,
        controller: widget.textEditingController,
        textCapitalization: widget.textCapV ?? TextCapitalization.none,
        decoration: InputDecoration(
          hintStyle: const TextStyle(
              color: Color.fromRGBO(252, 252, 252, 0.5),
              fontSize: 14,
              fontFamily: "Helvetica",
              fontWeight: FontWeight.w400),
          hintText: widget.hintText,
          prefixIconColor: widget.prefixIconColor,
          // ignore: prefer_null_aware_operators
          prefixIcon: widget.leadingIcon == null ? null : widget.leadingIcon!,
          suffixIcon: widget.isInputPassword
              ? GestureDetector(
                  onTap: () => setState(() => obscureText = !obscureText),
                  child: obscureText
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 20.0),
                              child: Icon(Icons.remove_red_eye),
                            ),
                          ],
                        )
                      : const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 20.0),
                              child: Icon(
                                Icons.remove_red_eye_outlined,
                                color: Color(0xFF959595),
                              ),
                            ),
                          ],
                        ),
                )
              : widget.suffixIcon,
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        ),
        style: const TextStyle(color: Colors.white),
        keyboardType: widget.texttype,
        // validator: widget.validator ??
        //     (value) {
        //       if (value == null || value.isEmpty) {
        //         return "Empty value";
        //       }
        //       return null;
        //     },
        inputFormatters: widget.inputFormatters,
        onChanged: (value) {
          widget.onInput?.call(value);
        },
      );
  }
}
