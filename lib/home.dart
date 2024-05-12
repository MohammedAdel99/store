import 'package:flutter/material.dart';
import 'package:store/core/routes/app_routes.dart';
import 'package:store/core/theming/font_family_helper.dart';
import 'package:store/core/theming/font_weight_helper.dart';
import 'package:store/core/helpers/navigator_extension.dart';

class homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Brand Store',
              style: TextStyle(
                fontSize: 20,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
            SizedBox(width: 20),
            Text(
              'براند ستور',
              style: TextStyle(
                fontSize: 20,
                fontFamily: FontFamilyHelper.cairoArabic,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  context.pushNamed(AppRoutes.testOne);
                },
                child: const Text('Go to test1'),),
            TextButton(
                onPressed: () {
                  context.pushNamed(AppRoutes.testTwo);
                },
                child: const Text('Go to test2'),),
          ],
        ),
      ),
    );
  }
}
