import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/routes/names.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/common/values/constant.dart';
import 'package:ulearning/common/widgets/base_text_widget.dart';
import 'package:ulearning/global.dart';
import 'package:ulearning/pages/application/bloc/app_blocs.dart';
import 'package:ulearning/pages/application/bloc/app_events.dart';

AppBar buildAppbar() {
  return AppBar(
    title: Container(
      child: reusableText("Settings"),
    ),
  );
}

Widget settingsButton(BuildContext context) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Confirm logout"),
              content: const Text("Confirm logout"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    context.read<AppBlocs>().add(TriggerAppEvent(0));
                    Global.storageService
                        .remove(AppConstants.STORAGE_USER_PROFILE_KEY);
                    Global.storageService
                        .remove(AppConstants.STORAGE_USER_TOKEN_KEY);
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.SIGN_IN, (route) => false);
                  },
                  child: const Text("Confirm"),
                ),
              ],
            );
          });
    },
    child: Container(
      height: 100.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage('assets/icons/Logout.png'),
        ),
      ),
    ),
  );
}
