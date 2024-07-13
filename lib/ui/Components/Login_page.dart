import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/ui/Components/Auth_sign_in.dart';
import 'package:todoapp/ui/Components/authservice.dart';
import 'package:todoapp/ui/Components/home_page.dart';
import 'package:todoapp/ui/Components/loginButton.dart';
import 'package:todoapp/ui/Components/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool islogin = true;

  // get createUserwithEmailAndPassword => null;

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signIn(
          email: emailcontroller.text, password: passwordcontroller.text);
      print(emailcontroller.text);
      print(passwordcontroller.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

//   Widget _title(){
// return const Text("data");
//   }

  // Widget _entryFired(
  //   String title,
  //   TextEditingController controller,
  // ){
  //   return TextField();
  // }

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  // void signIn() async {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Appbar
              // Image Up
              SizedBox(
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Text(
                  "Sign In",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              // Eamil
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: Row(
                  children: [
                    Icon(Icons.email),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: TextField(
                        controller: emailcontroller,
                        cursorColor: Theme.of(context).colorScheme.secondary,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),

                          label: Text(
                            "Email",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                          // labelText: "Email",

                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          filled: true,
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.all(Radius.circular(12)),
                          // ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: Row(
                  children: [
                    Icon(Icons.lock),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: TextField(
                        controller: passwordcontroller,
                        obscureText: true,
                        cursorColor: Theme.of(context).colorScheme.secondary,
                        decoration: InputDecoration(
                          // labelText: "Password",
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.secondary,
                          )),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.secondary,
                          )),
                          label: Text(
                            "password",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                          ),

                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          filled: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Policy
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Text(
                      "lorem ipsum dolor sit amet, consectetur",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 87, 87, 87),
                          fontSize: 13),
                    ),
                    Text(
                      " Privacy Policy",
                      style: TextStyle(color: Color(0xFF516FB6), fontSize: 13),
                    ),
                  ],
                ),
              ),
              // Continue
              SizedBox(
                height: 20,
              ),

              MyloginBtn(signIn: signInWithEmailAndPassword),

              SizedBox(
                height: 13,
              ),
              // ForgetPassword

              // Divider
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Color.fromARGB(52, 184, 184, 184),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text("or with"),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Color.fromARGB(52, 0, 0, 0),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Authservice().signinwithGoogle();
                    },
                    child: Container(
                      width: 70,
                      padding: EdgeInsets.all(16),
                      child: Image(
                        image: AssetImage('assets/google.png'),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          border: Border.all(
                            color: Color.fromARGB(255, 168, 168, 168),
                          ),
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 70,
                    padding: EdgeInsets.all(16),
                    child: Image(
                      image: AssetImage('assets/apple-logo.png'),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        border: Border.all(
                          color: Color.fromARGB(255, 168, 168, 168),
                        ),
                        color: Colors.white),
                  ),
                ],
              ),

              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "First Time Here? ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StreamBuilder(
                            stream: Auth().authStateChange,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return HomePage();
                              } else {
                                return SignupPage();
                              }
                            },
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "Register ",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w600,
                          fontSize: 13),
                    ),
                  ),
                ],
              )
              // login with google , apple

              // New? register
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:todoapp/ui/Components/Auth_sign_in.dart';
// import 'package:todoapp/ui/Components/home_page.dart';
// import 'package:todoapp/ui/Components/loginButton.dart';
// import 'package:todoapp/ui/Components/signup_page.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   String? errorMessage = '';
//   final _formKey = GlobalKey<FormState>();

//   final emailcontroller = TextEditingController();
//   final passwordcontroller = TextEditingController();

//   Future<void> signInWithEmailAndPassword() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         await Auth().signIn(
//             email: emailcontroller.text, password: passwordcontroller.text);
//         print(emailcontroller.text);
//         print(passwordcontroller.text);
//         // Navigate to HomePage if sign in is successful
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => HomePage()),
//         );
//       } on FirebaseAuthException catch (e) {
//         setState(() {
//           errorMessage = e.message;
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         maintainBottomViewPadding: false,
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 150,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 22.0),
//                   child: Text(
//                     "Sign In",
//                     style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 50,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 26.0),
//                   child: Row(
//                     children: [
//                       Icon(Icons.email),
//                       SizedBox(
//                         width: 12,
//                       ),
//                       Expanded(
//                         child: TextFormField(
//                           controller: emailcontroller,
//                           cursorColor: Theme.of(context).colorScheme.secondary,
//                           decoration: InputDecoration(
//                             focusedBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Theme.of(context).colorScheme.secondary,
//                               ),
//                             ),
//                             enabledBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Theme.of(context).colorScheme.secondary,
//                               ),
//                             ),
//                             label: Text(
//                               "Email",
//                               style: TextStyle(
//                                   color:
//                                       Theme.of(context).colorScheme.secondary),
//                             ),
//                             fillColor: Color.fromARGB(255, 255, 255, 255),
//                             filled: true,
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter your email';
//                             } else if (!value.contains('@')) {
//                               return 'Please enter a valid email';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 26.0),
//                   child: Row(
//                     children: [
//                       Icon(Icons.lock),
//                       SizedBox(
//                         width: 12,
//                       ),
//                       Expanded(
//                         child: TextFormField(
//                           controller: passwordcontroller,
//                           obscureText: true,
//                           cursorColor: Theme.of(context).colorScheme.secondary,
//                           decoration: InputDecoration(
//                             focusedBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(
//                               color: Theme.of(context).colorScheme.secondary,
//                             )),
//                             enabledBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(
//                               color: Theme.of(context).colorScheme.secondary,
//                             )),
//                             label: Text(
//                               "Password",
//                               style: TextStyle(
//                                   color:
//                                       Theme.of(context).colorScheme.secondary),
//                             ),
//                             fillColor: Color.fromARGB(255, 255, 255, 255),
//                             filled: true,
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter your password';
//                             } else if (value.length < 6) {
//                               return 'Password must be at least 6 characters';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 30.0),
//                   child: Row(
//                     children: [
//                       Text(
//                         "lorem ipsum dolor sit amet, consectetur",
//                         style: TextStyle(
//                             color: const Color.fromARGB(255, 87, 87, 87),
//                             fontSize: 13),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           // Navigate to Privacy Policy
//                         },
//                         child: Text(
//                           " Privacy Policy",
//                           style:
//                               TextStyle(color: Color(0xFF516FB6), fontSize: 13),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 MyloginBtn(signIn: signInWithEmailAndPassword),
//                 SizedBox(
//                   height: 13,
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Divider(
//                           thickness: 1,
//                           color: Color.fromARGB(52, 184, 184, 184),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10, right: 10),
//                         child: Text("or with"),
//                       ),
//                       Expanded(
//                         child: Divider(
//                           thickness: 1,
//                           color: Color.fromARGB(52, 0, 0, 0),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       width: 70,
//                       padding: EdgeInsets.all(16),
//                       child: Image(
//                         image: AssetImage('assets/google.png'),
//                       ),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(12)),
//                           border: Border.all(
//                             color: Color.fromARGB(255, 168, 168, 168),
//                           ),
//                           color: Colors.white),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Container(
//                       width: 70,
//                       padding: EdgeInsets.all(16),
//                       child: Image(
//                         image: AssetImage('assets/apple-logo.png'),
//                       ),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(12)),
//                           border: Border.all(
//                             color: Color.fromARGB(255, 168, 168, 168),
//                           ),
//                           color: Colors.white),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 25,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "First Time Here? ",
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 13),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => StreamBuilder(
//                               stream: Auth().authStateChange,
//                               builder: (context, snapshot) {
//                                 if (snapshot.hasData) {
//                                   return HomePage();
//                                 } else {
//                                   return SignupPage();
//                                 }
//                               },
//                             ),
//                           ),
//                         );
//                       },
//                       child: Text(
//                         "Register ",
//                         style: TextStyle(
//                             color: Theme.of(context).colorScheme.secondary,
//                             fontWeight: FontWeight.w600,
//                             fontSize: 13),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
