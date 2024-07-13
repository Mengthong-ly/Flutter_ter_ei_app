import 'package:flutter/material.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/ui/Components/Auth_sign_in.dart';
import 'package:todoapp/ui/Components/Login_page.dart';
import 'package:todoapp/ui/Components/home_page.dart';

class Mycontinuebutton extends StatelessWidget {
  final String buttonname;
  const Mycontinuebutton({super.key, required this.buttonname});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 4),
      child: MaterialButton(
        disabledColor: Colors.white,
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => StreamBuilder(
                stream: Auth().authStateChange,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return HomePage();
                  } else {
                    return LoginPage();
                  }
                },
              ),
            ),
          );
        },
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        color: const Color(0xFF516FB6),
        textColor: Colors.white,
        child: Text(
          buttonname,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
