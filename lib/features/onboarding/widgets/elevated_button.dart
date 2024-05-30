import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final Function onPressed;

  final String buttonText;
  const AppElevatedButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        //shape: const CircleBorder(),
        backgroundColor: const Color(0xff005ae0),
      ),
      child: Text(
        buttonText
          ,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
