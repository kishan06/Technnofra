import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:technofra/Utils/CommonWidgets/sized_box.dart';
import 'package:technofra/Utils/Helpers/FilePicker.dart';
import 'package:technofra/Utils/Helpers/ImagePicker.dart';

class ImageUploadBottomSheet {
  // final ProfileImageController editProfileImage =
  //     Get.put(ProfileImageController());
  showModal(
    BuildContext context,
    bool showFile,
    Function(String) onImagePicked,
  ) {
    return showModalBottomSheet(
      backgroundColor: const Color(0XFF222935),
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(26.r),
          topRight: Radius.circular(26.r),
        ),
      ),
      builder: (context) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 36.w, vertical: 26.h),
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  (showFile) ? 'Select Image/File' : 'Select Image',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                  ),
                ),
                sizedBoxHeight(40.h),
                showFile == true
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              //  editProfileImage.getImage(ImageSource.camera);
                              var result = await ImagePickerMethod()
                                  .getImage(ImageSource.camera);
                              onImagePicked(result);

                              // Get.back();
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 27.r,
                                  backgroundColor: const Color(0xFF858585),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    size: 30.sp,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Text(
                                  'Camera',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          sizedBoxWidth(36.w),
                          GestureDetector(
                            onTap: () async {
                              var result = await ImagePickerMethod()
                                  .getImage(ImageSource.gallery);
                              onImagePicked(result);
                              Get.back();
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 27.r,
                                  backgroundColor: const Color(0xFF858585),
                                  child: Icon(
                                    Icons.image_outlined,
                                    size: 30.sp,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Text(
                                  'Gallery',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          sizedBoxWidth(36.w),
                          GestureDetector(
                            onTap: () async {
                              var result = await FilePickerMethod().pickFile();
                              onImagePicked(result?.path ?? "");
                              // Get.back();
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 27.r,
                                  backgroundColor: const Color(0xFF858585),
                                  child: Icon(
                                    Icons.file_copy_outlined,
                                    size: 30.sp,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Text(
                                  'File',
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.white,
                                      fontFamily: 'Poppins'),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              //  editProfileImage.getImage(ImageSource.camera);
                              var result = await ImagePickerMethod()
                                  .getImage(ImageSource.camera);
                              onImagePicked(result);

                              // Get.back();
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 27.r,
                                  backgroundColor: const Color(0xFF858585),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    size: 30.sp,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Text(
                                  'Camera',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          sizedBoxWidth(36.w),
                          GestureDetector(
                            onTap: () async {
                              var result = await ImagePickerMethod()
                                  .getImage(ImageSource.gallery);
                              onImagePicked(result);
                              // Get.back();
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 27.r,
                                  backgroundColor: const Color(0xFF858585),
                                  child: Icon(
                                    Icons.image_outlined,
                                    size: 30.sp,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Text(
                                  'Gallery',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
