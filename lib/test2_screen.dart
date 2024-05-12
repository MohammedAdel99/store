import 'package:flutter/material.dart';
import 'package:store/core/routes/app_routes.dart';
import 'package:store/core/helpers/navigator_extension.dart';

class test2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('test2')),
      ),
      body: Container(
        color: Colors.pink,
        child: Center(
          child: TextButton(
              onPressed: () {
                context.pushNamed(AppRoutes.testOne);
              },
              child: const Text('Go to test1', style: TextStyle(color:Colors.white)),),
        ),
      ),
    );
  }
}
