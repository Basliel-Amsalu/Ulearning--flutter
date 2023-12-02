import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';

AppBar buildAppbar() {
  return AppBar(
    title: Container(
      child: Text(
        "settings",
        style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}
