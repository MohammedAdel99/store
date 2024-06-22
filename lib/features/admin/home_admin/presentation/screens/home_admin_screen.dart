import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/theming/styles.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:store/core/widgets/admin_appbar.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/core/app/app_cubit/app_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/theming/colors/colors_dark.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/features/admin/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:store/features/admin/home_admin/presentation/widgets/admin_drawer_list.dart';

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
            context.color.mainColor ?? ColorsDark.black1,
        menuBackgroundColor: context.color.bluePinkDark ?? ColorsDark.blueDark,
    ),
    );
  }
}

class MenuAdminScreen extends StatelessWidget {
  const MenuAdminScreen({
    Key? key,
    required this.onPageChanged,
  }) : super(key: key);
  final void Function(Widget) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.color.bluePinkDark,
        appBar: AdminAppBar(
          isMain: false,
          background: context.color.bluePinkDark ?? ColorsDark.blueDark,

          title: context.translate(LangKeys.appName),
          
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children:
           
           adminDrawerList(context)
              .map((e) => ListTile(
                  onTap: () {
                    onPageChanged(e.page);
                  },
                  title: e.title,
                  leading: e.icon))
              .toList(),
        ));
  }
}
