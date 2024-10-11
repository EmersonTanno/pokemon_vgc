import 'package:flutter/material.dart';

class ButtonLoginPage extends StatelessWidget {
  final String text;
  final Function funct;
  const ButtonLoginPage({super.key, required this.text, required this.funct,});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
        ),
        onPressed: () {
          funct();
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 5,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}
