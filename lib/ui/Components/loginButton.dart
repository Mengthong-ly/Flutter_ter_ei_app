import 'package:flutter/material.dart';

class MyloginBtn extends StatelessWidget {
  final Function()? signIn;
  MyloginBtn({super.key, required this.signIn});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        signIn!();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: Color(0xFF516FB6),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Center(
            child: Text(
          "Continue",
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
              fontSize: 18),
        )),
      ),
    );
  }
}
