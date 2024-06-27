import 'package:flutter/material.dart';
import 'package:store/core/widgets/admin_appbar.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/core/theming/colors/colors_dark.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/features/admin/home_admin/presentation/widgets/admin_drawer_list.dart';
class MenuAdminScreen extends StatelessWidget {
  const MenuAdminScreen({
    Key? key,
    required this.onPageChanged,
  }) : super(key: key);
  final void Function(Widget) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsDark.blueDark,
        appBar: AdminAppBar(
          isMain: false,
          background: mainBlue,

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