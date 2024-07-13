// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:provider/provider.dart';
// import 'package:todoapp/main.dart';
import 'package:todoapp/ui/Components/Theme.dart';

// void themeChange() {}
// bool isDark = false;

// class SettingPage extends StatefulWidget {
//   const SettingPage({super.key});

//   @override
//   State<SettingPage> createState() => _SettingPageState();
// }

// class _SettingPageState extends State<SettingPage> {
//   void onchange(value) {
//     setState(() {
//       isDark = value;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.secondary,
//         leading: Container(
//           margin: const EdgeInsets.only(top: 9, bottom: 9, right: 9, left: 9),
//           padding: const EdgeInsets.only(left: 7),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(
//               Radius.circular(40),
//             ),
//             color: Theme.of(context).colorScheme.secondary,
//           ),
//           child: Center(
//             child: IconButton(
//               icon: Icon(
//                 Icons.arrow_back_ios,
//                 weight: 12,
//                 size: 20,
//                 color: Theme.of(context).colorScheme.primary,
//               ),
//               onPressed: () => Navigator.pop(context),
//             ),
//           ),
//         ),
//         centerTitle: false,
//         title: Text(
//           'Personal Settings',
//           style: TextStyle(
//               fontWeight: FontWeight.w500,
//               fontSize: 20,
//               color: Theme.of(context).colorScheme.primary),
//         ),
//       ),
//       body: ListView(
//         children: [
//           titleBar("Personal info"),
//           Container(
//             margin: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//                 color: Theme.of(context).colorScheme.primary,
//                 borderRadius: BorderRadius.all(Radius.circular(18))),
//             child: Column(
//               children: [
//                 GestureDec(context, "Account"),
//               ],
//             ),
//           ),
//           titleBar("General Settings"),
//           Container(
//             margin: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//                 color: Theme.of(context).colorScheme.primary,
//                 borderRadius: BorderRadius.all(Radius.circular(18))),
//             child: Column(
//               children: [
//                 GestureDecForDarkMode(context, "Dark Mode"),
//                 GestureDec(context, "Push Notification"),
//                 GestureDec(context, "Face Recognition"),
//                 GestureDec(context, "Security"),
//               ],
//             ),
//           ),
//           titleBar("Support"),
//           Container(
//             margin: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//                 color: Theme.of(context).colorScheme.primary,
//                 borderRadius: BorderRadius.all(Radius.circular(18))),
//             child: Column(
//               children: [
//                 GestureDec(context, "Term of Service"),
//                 GestureDec(context, "Advanced"),
//                 GestureDec(context, "Contact Us"),
//                 GestureDec(context, "Service Feedback"),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 40,
//           ),
//           const Center(
//               child: Text(
//             "Version 1.0.0.1",
//             style: TextStyle(fontSize: 16, color: Color.fromARGB(148, 0, 0, 0)),
//           )),
//         ],
//       ),
//     );
//   }

//   Title titleBar(
//     String title,
//   ) {
//     return Title(
//       color: const Color.fromARGB(255, 0, 0, 0),
//       child: Padding(
//         padding: const EdgeInsets.only(left: 15, top: 10),
//         child: Text(
//           title,
//           style: const TextStyle(color: Color.fromARGB(148, 0, 0, 0)),
//         ),
//       ),
//     );
//   }

//   GestureDetector GestureDec(BuildContext context, String title) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.pushReplacement(
//           context,
//           CupertinoPageRoute(
//             builder: (context) => const SettingPage(),
//           ),
//         );
//       },
//       child: ListTile(
//         // shape: BeveledRectangleBorder(
//         //   borderRadius: BorderRadius.all(
//         //     Radius.circular(20),
//         //   ),
//         // ),
//         splashColor: const Color.fromARGB(255, 0, 0, 0),
//         tileColor: Color.fromARGB(0, 255, 255, 255),
//         title: Text(
//           title,
//           overflow: TextOverflow.ellipsis,
//           style: TextStyle(fontSize: 17),
//         ),
//       ),
//     );
//   }

//   GestureDetector GestureDecForDarkMode(BuildContext context, String title) {
//     return GestureDetector(
//       onTap: () {},
//       child: Container(
//         color: Theme.of(context).colorScheme.primary,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 title,
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(fontSize: 17),
//               ),
//               CupertinoSwitch(
//                 onChanged: (value) {
//                   onchange(value);
//                   setState(() {
//                     Provider.of<ThemeNotifier>(context, listen: false)
//                         .toggleTheme();
//                   });
//                 },
//                 value: isDark,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  // Function(bool?)? onchangee;
  bool isdark = false;

  void onchange(bool value) {
    isdark = value;
    Provider.of<ThemeNotifier>(context, listen: ThemeMode.system == Theme)
        .toggleTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: Container(
          margin: const EdgeInsets.all(9),
          padding: const EdgeInsets.only(left: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Center(
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: Text(
          'Personal Settings',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: ListView(
        children: [
          titleBar("Personal info"),
          settingsContainer(context, [
            GestureDec(context, "Account"),
          ]),
          titleBar("General Settings"),
          settingsContainer(context, [
            GestureDecForDarkMode(context, "Dark Mode"),
            GestureDec(context, "Push Notification"),
            GestureDec(context, "Face Recognition"),
            GestureDec(context, "Security"),
          ]),
          titleBar("Support"),
          settingsContainer(context, [
            GestureDec(context, "Term of Service"),
            GestureDec(context, "Advanced"),
            GestureDec(context, "Contact Us"),
            GestureDec(context, "Service Feedback"),
          ]),
          const SizedBox(height: 40),
          Center(
            child: Text(
              "Version 1.0.0.1",
              style: TextStyle(
                  fontSize: 16, color: Theme.of(context).colorScheme.secondary),
            ),
          ),
        ],
      ),
    );
  }

  Title titleBar(String title) {
    return Title(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 10),
        child: Text(
          title,
          style: const TextStyle(color: Color.fromARGB(148, 0, 0, 0)),
        ),
      ),
    );
  }

  Container settingsContainer(BuildContext context, List<Widget> children) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.all(Radius.circular(18)),
      ),
      child: Column(children: children),
    );
  }

  GestureDetector GestureDec(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => const SettingPage(),
          ),
        );
      },
      child: ListTile(
        splashColor: Colors.black,
        tileColor: Colors.transparent,
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 17),
        ),
      ),
    );
  }

  GestureDetector GestureDecForDarkMode(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: Theme.of(context).colorScheme.primary,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 17),
            ),
            CupertinoSwitch(
                value: isdark, onChanged: (value) => {onchange(value)}),
          ],
        ),
      ),
    );
  }
}
