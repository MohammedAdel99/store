import 'package:flutter/material.dart';
import 'package:store/core/theming/styles.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/core/theming/colors/colors_dark.dart';
import 'package:store/core/extensions/navigator_extension.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        
        children: [
          Image.asset('assets/images/core/empty_screen.png'),
          Text('${ context.translate(LangKeys.noCategories)}',style: TextStyle(color: mainBlue),textAlign: TextAlign.center,)
             
        ],
      ),
    );
  }
}