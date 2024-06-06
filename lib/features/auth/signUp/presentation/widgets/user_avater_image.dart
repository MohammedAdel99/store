import 'package:flutter/material.dart';
import 'package:store/core/animations/animate_do.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/navigator_extension.dart';


class UserAvaterImage extends StatelessWidget {
  const UserAvaterImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomFadeInDown(duration: 500, child: CircleAvatar(backgroundColor:context.color.bluePinkDark ,radius: 38,)),
        SizedBox(height: 10.h),
      ],
    );
  }
}
