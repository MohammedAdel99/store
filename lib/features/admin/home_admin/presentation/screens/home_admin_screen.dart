import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/theming/colors/colors_dark.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:store/features/admin/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:store/features/admin/home_admin/presentation/widgets/menu_admin_screen.dart';





class HomeAdminScreen extends StatefulWidget {
  const HomeAdminScreen({super.key});

  @override
  State<HomeAdminScreen> createState() => _HomeAdminScreenState();
}

class _HomeAdminScreenState extends State<HomeAdminScreen> {
  Widget page = DashboardScreen();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:  TextDirection.ltr,
      child:
     ZoomDrawer(
        menuScreen: Builder(builder: (context) {
          return MenuAdminScreen(
            onPageChanged: (e) {
              setState(() {
                page = e;
              });
              ZoomDrawer.of(context)!.close();
            },
          );
        }),
        mainScreen: page,
        borderRadius: 24.r,
        showShadow: true,
        drawerShadowsBackgroundColor:
          mainBlue,
        menuBackgroundColor:  mainBlue,
    ),
    );
  }
}


