import 'package:flutter/material.dart';
import 'package:store/core/routes/app_routes.dart';
import 'package:store/core/helpers/navigator_extension.dart';

class test1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('test1')),
      ),
      body:  Container(
        color: context.color.mainColor,
        child: Center(
          child: TextButton(
              onPressed: () {
                context.pushNamed(AppRoutes.testTwo);
              },
              child: const Text('Go to test2', style: TextStyle(color:Colors.white),),),
        ),
      ),
    );
  }
}
