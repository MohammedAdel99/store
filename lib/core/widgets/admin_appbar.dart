import 'package:flutter/material.dart';
import 'package:store/core/theming/styles.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:store/core/extensions/navigator_extension.dart';

class AdminAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AdminAppBar(
      {super.key,
      required this.isMain,
      required this.background,
      required this.title});
  final bool isMain;
  final Color background;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: background,
      centerTitle: true,










      surfaceTintColor: Colors.transparent,
      title: TextApp(
        text: title,
        theme: TextStyles.font20BoldWhite
            .copyWith(color: isMain? context.color.textColor : Colors.white),
      ),
      leading:
      isMain?
       IconButton(
          onPressed: () {
            ZoomDrawer.of(context)!.toggle();
          },
          icon: Icon(
            Icons.menu,
            color: context.color.textColor,
          )): SizedBox.shrink(),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 50.h);
}
