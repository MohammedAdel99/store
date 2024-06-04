import 'package:flutter/material.dart';
import 'package:store/core/animations/animate_do.dart';
import 'package:store/core/extensions/navigator_extension.dart';

class UserAvaterImage extends StatelessWidget {
  const UserAvaterImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(duration: 500, child: CircleAvatar(backgroundImage:const AssetImage('assets/images/core/onboarding(1).png') ,radius: 38,));
  }
}