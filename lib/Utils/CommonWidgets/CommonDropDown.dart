// ignore_for_file: prefer_const_constructors



import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:technofra/Utils/CommonWidgets/MiscWidgets.dart';

class CommonDropdownBtn extends StatefulWidget {
  CommonDropdownBtn({
    required this.hint,
    required this.items,
    this.isEnabled = true,
    this.textcolor = false,
    this.onItemSelected,
    this.leadingImage,
    bool showAddButton = false,
    super.key,
  });

  final String hint;
  final List<String>? items;
  final void Function(String)? onItemSelected;
  final bool isEnabled;
  final bool textcolor;
  final Widget? leadingImage;

  @override
  State<CommonDropdownBtn> createState() => _CommonDropdownBtnState();
}

class _CommonDropdownBtnState extends State<CommonDropdownBtn> {
  final kInnerDecoration = BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.white),
    borderRadius: BorderRadius.circular(30.r),
  );

  late String label;
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Row(
        children: [
          Expanded(
            child: DropdownButton2(
              isExpanded: true,
              hint: Row(
                children: [
                  if (widget.leadingImage != null) widget.leadingImage!,
                  SizedBox(
                      width: 8.w), // Spacing between the image and the text
                  Expanded(
                    child: Text(
                      widget.hint,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: 'hiragino',
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              items: widget.items!
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontFamily: 'hiragino',
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                  .toList(),
              value: selectedValue,
              onChanged: widget.isEnabled
                  ? (value) {
                      setState(() {
                        selectedValue = value as String;
                        if (widget.onItemSelected != null) {
                          widget.onItemSelected!(selectedValue!);
                        }
                      });
                    }
                  : null,
              buttonStyleData: ButtonStyleData(
                height: 50.h,
                width: double.infinity,
                padding: EdgeInsets.only(left: 12.w, right: 4.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFffffff).withOpacity(0.8),
                        Color(0xFFFFFFFF).withOpacity(0.8),
                      ],
                      stops: const [
                        0.1,
                        1,
                      ]),
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(
                    color: Color(0xff434A53),
                  ),
                  color: Color(0xFFFFFFFF).withOpacity(0.05),
                ),
                elevation: 0,
              ),
              iconStyleData: IconStyleData(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                ),
                iconSize: 23.sp,
                iconEnabledColor: Color(0xFFFFFFFF),
                iconDisabledColor: Color(0xFFFFFFFF),
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
                width: 350,
                padding: null,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xFF222935),
                ),
                elevation: 0,
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(40),
                  thickness: MaterialStateProperty.all<double>(6),
                  thumbVisibility: MaterialStateProperty.all<bool>(true),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
                padding: EdgeInsets.only(left: 14, right: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CommonDropdownradioBtn extends StatefulWidget {
  const CommonDropdownradioBtn({
    required this.hint,
    required this.items,
    this.leadingIcon,
    this.textcolor = false,
    this.onItemSelected,
    this.showOtherOption = false,
    super.key,
  });

  final String hint;
  final List<String>? items;
  final Widget? leadingIcon;
  final void Function(String)? onItemSelected;
  final bool textcolor;
  final bool showOtherOption;

  @override
  State<CommonDropdownradioBtn> createState() => _CommonDropdownradioBtnState();
}

class _CommonDropdownradioBtnState extends State<CommonDropdownradioBtn> {
  final RxString selectedValue = RxString('');
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Obx(() {
          return Row(
            children: [
              if (widget.leadingIcon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: widget.leadingIcon!,
                ),
              Expanded(
                child: Text(
                  selectedValue.isEmpty ? widget.hint : selectedValue.value,
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Helvetica'),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
        }),
        items: _buildDropdownMenuItems(),
        value: null,
        onChanged: (value) {},
        selectedItemBuilder: (BuildContext context) {
          return widget.items!.map((item) {
            return Obx(() {
              return Row(
                children: [
                  if (widget.leadingIcon != null) widget.leadingIcon!,
                  Expanded(
                    child: Text(
                      selectedValue.value,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'hiragino',
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              );
            });
          }).toList();
        },
        buttonStyleData: ButtonStyleData(
          height: 50,
          width: double.infinity,
          padding: EdgeInsets.only(left: 12, right: 4),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFffffff).withOpacity(0.8),
                Color(0xFFFFFFFF).withOpacity(0.8),
              ],
              stops: const [0.1, 1],
            ),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Color(0xff434A53),
            ),
            color: Color(0xFFFFFFFF).withOpacity(0.05),
          ),
          elevation: 0,
        ),
        iconStyleData: IconStyleData(
          icon: Icon(
            Icons.keyboard_arrow_down,
          ),
          iconSize: 23,
          iconEnabledColor: Color(0xFFFFFFFF),
          iconDisabledColor: Color(0xFFFFFFFF),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: 400,
          padding: null,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color(0xFF222935),
          ),
          elevation: 0,
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all<double>(6),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 60,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownMenuItems() {
    List<DropdownMenuItem<String>> items =
        widget.items!.asMap().entries.map((entry) {
      int index = entry.key;
      String item = entry.value;
      return DropdownMenuItem<String>(
        value: item,
        child: InkWell(
          onTap: () {
            selectedValue.value = item;
            _textController.clear();
            if (widget.onItemSelected != null) {
              widget.onItemSelected!(item);
            }
          },
          child: Column(
            children: [
              Row(
                children: [
                  Obx(() {
                    return Radio<String>(
                      value: item,
                      activeColor: Colors.white,
                      groupValue: selectedValue.value,
                      onChanged: (value) {
                        selectedValue.value = value!;
                        _textController.clear();
                        if (widget.onItemSelected != null) {
                          widget.onItemSelected!(value);
                        }
                      },
                    );
                  }),
                  SizedBox(width: 8),
                  Text(
                    item,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'hiragino',
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              if (index != widget.items!.length - 1) commonDivider()
            ],
          ),
        ),
      );
    }).toList();
    if (widget.showOtherOption) {
      items.add(
        DropdownMenuItem<String>(
          value: _textController.text,
          child: Column(
            children: [
              commonDivider(),
              Row(
                children: [
                  Obx(() {
                    return Radio<String>(
                      value: _textController.text,
                      activeColor: Colors.white,
                      groupValue: selectedValue.value,
                      onChanged: (value) {
                        selectedValue.value = value!;
                        _textController.clear();
                        if (widget.onItemSelected != null) {
                          widget.onItemSelected!(value);
                        }
                      },
                    );
                  }),
                  SizedBox(width: 8),
                  Text(
                    "Other: ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'hiragino',
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'hiragino',
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                          hintText: '',
                          hintStyle: TextStyle(color: Colors.white70),
                          border: UnderlineInputBorder()),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_textController.text.trim().isNotEmpty) {
                        selectedValue.value = _textController.text;
                        if (widget.onItemSelected != null) {
                          widget.onItemSelected!(_textController.text);
                        }
                      }
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'hiragino',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
    return items;
  }
}

class CommonDropdownCheckbox extends StatefulWidget {
  const CommonDropdownCheckbox({
    required this.hint,
    required this.items,
    required this.images,
    this.isEnabled = true,
    this.islocation = false,
    this.textcolor = false,
    this.onItemSelected,
    bool showAddButton = false,
    super.key,
  });
  final String hint;
  final List<String>? items;
  final List<String>? images;
  final void Function(String)? onItemSelected;
  final bool isEnabled;
  final bool islocation;
  final bool textcolor;

  @override
  State<CommonDropdownCheckbox> createState() => _CommonDropdownCheckboxState();
}

class _CommonDropdownCheckboxState extends State<CommonDropdownCheckbox> {
  var selectedValues = <String>[].obs;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Row(
        children: [
          widget.islocation
              ? Padding(
                  padding: EdgeInsets.only(left: 4.w),
                  child: SvgPicture.asset("assets/svg/location.svg"),
                )
              : SizedBox(),
          Expanded(
            child: DropdownButton2(
              isExpanded: true,
              hint: Obx(() {
                return Row(
                  children: [
                    Expanded(
                      child: Text(
                        selectedValues.isEmpty
                            ? widget.hint
                            : selectedValues.join(', '),
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: 'hiragino',
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                );
              }),
              items: widget.items!.asMap().entries.map((entry) {
                int index = entry.key;
                String item = entry.value;
                String image = widget.images![index];
                return DropdownMenuItem<String>(
                  value: item,
                  child: InkWell(
                    onTap: () {
                      selectedValues.contains(item)
                          ? selectedValues.remove(item)
                          : selectedValues.add(item);

                      if (widget.onItemSelected != null) {
                        widget.onItemSelected!(selectedValues.join(', '));
                      }
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                image: DecorationImage(
                                  image: AssetImage(image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Text(
                                item,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontFamily: 'hiragino',
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Obx(() {
                              return Transform.scale(
                                scale: 1,
                                child: Checkbox(
                                  side: BorderSide(color: Color(0xFF434A53)),
                                  value: selectedValues.contains(item),
                                  activeColor: Color(0xFF434A53),
                                  checkColor: Colors.white,
                                  onChanged: (bool? value) {
                                    if (value == true) {
                                      selectedValues.add(item);
                                    } else {
                                      selectedValues.remove(item);
                                    }
                                    if (widget.onItemSelected != null) {
                                      widget.onItemSelected!(
                                          selectedValues.join(', '));
                                    }
                                  },
                                ),
                              );
                            }),
                          ],
                        ),
                        SizedBox(height: 5.h),
                        if (index != widget.items!.length - 1) commonDivider()
                      ],
                    ),
                  ),
                );
              }).toList(),
              value: null, // Set to null to avoid the duplicate value issue
              onChanged: (value) {},
              selectedItemBuilder: (BuildContext context) {
                return widget.items!.map((item) {
                  return Row(
                    children: [
                      Expanded(
                        child: Obx(() {
                          return Text(
                            selectedValues.join(', '),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontFamily: 'hiragino',
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          );
                        }),
                      ),
                    ],
                  );
                }).toList();
              },
              buttonStyleData: ButtonStyleData(
                height: 50.h,
                width: double.infinity,
                padding: EdgeInsets.only(left: 12.w, right: 4.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFffffff).withOpacity(0.8),
                      Color(0xFFFFFFFF).withOpacity(0.8),
                    ],
                    stops: const [0.1, 1],
                  ),
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(
                    color: Color(0xff434A53),
                  ),
                  color: Color(0xFFFFFFFF).withOpacity(0.05),
                ),
                elevation: 0,
              ),
              iconStyleData: IconStyleData(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                ),
                iconSize: 23.sp,
                iconEnabledColor: Color(0xFFFFFFFF),
                iconDisabledColor: Color(0xFFFFFFFF),
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
                width: 400,
                padding: null,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xFF222935),
                ),
                elevation: 0,
                scrollbarTheme: ScrollbarThemeData(
                  radius: Radius.circular(40),
                  thickness: MaterialStateProperty.all<double>(6),
                  thumbVisibility: MaterialStateProperty.all<bool>(true),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 60,
                padding: EdgeInsets.only(left: 14, right: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
