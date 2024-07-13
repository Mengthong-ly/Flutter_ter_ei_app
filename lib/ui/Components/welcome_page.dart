import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  final String pic;
  final String caption;

  const WelcomePage({
    super.key,
    required this.pic,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            child: Text(
              "TER EI APP ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 200,
                  color: Color.fromARGB(90, 81, 111, 182)),
            ),
          ),
          Center(
            child: newMethod(pic, caption),
          ),
        ],
      ),
    );
  }

  Widget newMethod(picture, caption) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Image displayed here
        DisplayImage(
          pic: picture,
        ),

        // description text

        SizedBox(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Caption_1(
                caption: caption,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget welcome() {
    return const Text( 
      'Welcome to ToDO',
      style: TextStyle(
          fontSize: 22, fontWeight: FontWeight.w900, color: Colors.white),
    );
  }
}

// ignore: camel_case_types
class Caption_1 extends StatelessWidget {
  final String caption;
  const Caption_1({super.key, required this.caption});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 7, right: 30, left: 30),
      child: Text(
        caption,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class DisplayImage extends StatelessWidget {
  String pic;
  DisplayImage({
    super.key,
    required this.pic,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      pic,
      width: 300,
      height: 300,
    );
  }
}
