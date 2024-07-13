import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/firebase_options.dart';
import 'package:todoapp/ui/Components/Auth_sign_in.dart';
import 'package:todoapp/ui/Components/MyContinueButton.dart';
import 'package:todoapp/ui/Components/Theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/ui/Components/home_page.dart';
import 'package:todoapp/ui/Components/welcome_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: const Myapp(),
    ),
  );
}

List smallcircle = [
  circleBlue(const Color(0xFF516FB6)),
  circleBlue(const Color.fromARGB(0, 0, 0, 0)),
  circleBlue(const Color.fromARGB(0, 0, 0, 0)),
];

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  PageController pageController = PageController();

  void pageOnChange(double value) {
    setState(
      () {
        if (value < 0.5) {
          // Set colors for the first circle when value < 0.5
          smallcircle[0] = circleBlue(const Color(0xFF516FB6));
          smallcircle[1] = circleBlue(const Color.fromARGB(0, 0, 0, 0));
          smallcircle[2] = circleBlue(const Color.fromARGB(0, 0, 0, 0));
          setButton(false);
        } else if (value >= 0.5 && value < 1.5) {
          // Set colors for the second circle when 0.5 <= value < 1.5
          smallcircle[0] = circleBlue(const Color.fromARGB(0, 0, 0, 0));
          smallcircle[1] = circleBlue(const Color(0xFF516FB6));
          smallcircle[2] = circleBlue(const Color.fromARGB(0, 0, 0, 0));
          setButton(false);
        } else {
          // Set colors for the third circle when value >= 1.5
          smallcircle[0] = circleBlue(const Color.fromARGB(0, 0, 0, 0));
          smallcircle[1] = circleBlue(const Color.fromARGB(0, 0, 0, 0));
          smallcircle[2] = circleBlue(const Color(0xFF516FB6));
          setButton(true);
        }
      },
    );
  }

  bool isSetButton = false;
  void setButton(bool value) {
    setState(
      () {
        isSetButton = value;
      },
    );
  }

  bool isDarkTheme = false;
  void setTheme() {
    isDarkTheme = !isDarkTheme;
  }

  // final ThemeData lightTheme = ThemeData(
  //   primarySwatch: Colors.blue,
  //   brightness: Brightness.light,
  //   // Define other properties for light theme
  // );

  // final ThemeData darkTheme = ThemeData(
  //   primarySwatch: Colors.blue,
  //   brightness: Brightness.dark,
  //   // Define other properties for dark theme
  // );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeNotifier>(context).themeData,
      debugShowCheckedModeBanner: false,

      /// every thing start here
      // home: LoginPage(),

      // home: ,
      home: StreamBuilder(
        stream: Auth().authStateChange,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return welcome_stack();
          }
        },
      ),
    );
  }

  Stack welcome_stack() {
    return Stack(
      children: [
        PageView(
          physics: const BouncingScrollPhysics(),
          allowImplicitScrolling: true,
          controller: pageController,
          onPageChanged: (value) {
            pageOnChange(pageController.page!);
          },
          children: const [
            WelcomePage(
              pic: "assets/Welcome.png",
              caption:
                  "Everyoen Waking up everyday to do their daily random tasks is normal right? but what if we help you enchance your activities",
            ),
            WelcomePage(
              pic: "assets/image2.png",
              caption: "Are you Ready to TAKE A STEP FUTHER with US",
            ),
            WelcomePage(
              pic: "assets/image3.png",
              caption:
                  "Make Your Day a rememberable day and get better than yesterday... Let go !!",
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 500),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                smallcircle[0],
                smallcircle[1],
                smallcircle[2],
              ],
            ),
          ),
        ),
        if (isSetButton)
          Container(
            padding: const EdgeInsets.all(30),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Mycontinuebutton(
                      buttonname: 'Continue',
                    ),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}

Container circleBlue(Color color) {
  return Container(
    margin: const EdgeInsets.only(left: 8, right: 8),
    width: 15,
    height: 15,
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xFF516FB6), width: 2.0),
      color: color,
      borderRadius: const BorderRadius.all(Radius.circular(40)),
    ),
  );
}
