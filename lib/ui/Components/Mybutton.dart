import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final onPressed;
  final String buttonname;
  const Mybutton(
      {super.key, required this.buttonname, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 4),
      child: MaterialButton(
        onPressed: onPressed,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        color: Theme.of(context).colorScheme.secondary,
        textColor: Theme.of(context).colorScheme.primary,
        child: Text(
          buttonname,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
