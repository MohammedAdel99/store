import 'package:flutter/material.dart';
import 'package:store/core/helpers/fonts/font_weight_helper.dart';
import 'package:store/core/helpers/fonts/font_family_helper.dart';







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
              'Brand store',
              style:TextStyle(
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
