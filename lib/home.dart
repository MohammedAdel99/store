import 'package:flutter/material.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/core/helpers/navigator_extension.dart';
import 'package:store/core/theming/fonts/font_family_helper.dart';
import 'package:store/core/theming/fonts/font_weight_helper.dart';




class homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.yellow,
      appBar: AppBar(
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.translate(LangKeys.appName),
              style: const TextStyle(
                fontSize: 20,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
            
            
          ],
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
          ],
        ),
      ),
    );
  }
}
