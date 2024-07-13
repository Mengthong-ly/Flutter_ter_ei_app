import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/ui/Components/home_page.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          MediaQuery.of(context).platformBrightness == Brightness.dark
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.primary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(206.0),
        child: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/thong.JPG"),
              ),
            ),
          ),
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(0, 255, 255, 255),
                  Color.fromARGB(0, 255, 255, 255),
                  Color.fromARGB(0, 255, 255, 255),
                  Color.fromARGB(0, 255, 255, 255),
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primary
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              // image: DecorationImage(
              //   fit: BoxFit.cover,
              //   image: AssetImage("assets/thong.JPG"),
              // ),
              border: Border(
                bottom: BorderSide(
                  color: Colors.transparent,
                  width: 4.0,
                ),
              ),
            ),
          ),
          AppBar(
            shadowColor: Colors.red,
            foregroundColor: Colors.white,
            title: const Text(
              "Profile",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 28),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ]),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20),
                width: 130,
                height: 130,
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(47, 0, 0, 0),
                        blurRadius: 12,
                        spreadRadius: 2,
                      )
                    ],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/thong.JPG"))),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  // height: 120,
                  decoration: const BoxDecoration(
                      // color: Colors.blueAccent,
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Color.fromARGB(47, 0, 0, 0),
                      //     blurRadius: 12,
                      //     spreadRadius: 2,
                      //   )
                      // ],
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title(
                      //   color: Colors.black,
                      //   child: Text("data"),
                      // )
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Mengthong Ly",
                          style: TextStyle(
                            color: MediaQuery.of(context).platformBrightness ==
                                    Brightness.dark
                                ? Theme.of(context).colorScheme.secondary
                                : Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "mengthongly@gmail.com",
                          style: TextStyle(
                            color: MediaQuery.of(context).platformBrightness ==
                                    Brightness.dark
                                ? Theme.of(context).colorScheme.secondary
                                : Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.phone),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.email),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.person),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.facebook),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                // backgroundColor: const Color(0xFF516FB6),
                backgroundColor:
                    MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.secondary,
              ),
              child: Text(
                "Upload Profile",
                style: TextStyle(
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//   Future<void> getLostData() async {
//     final ImagePicker picker = ImagePicker();
//     final LostDataResponse response = await picker.retrieveLostData();
//     if (response.isEmpty) {
//       return;
//     }
//     final List<XFile>? files = response.files;
//     if (files != null) {
//       // _handleLostFiles(files);
//     } else {
//       // _handleError(response.exception);
//     }
//   }
//   // Future<void> getLostData() async {
//   //   final ImagePicker picker = ImagePicker();
//   //   final LostDataResponse response = await picker.retrieveLostData();
//   //   if (response.isEmpty) {
//   //     return;
//   //   }
//   //   final List<XFile>? files = response.files;
//   //   if (files != null) {
//   //   } else {
//   //     // _handleError(response.exception);
//   //   }
//   // }
// }
