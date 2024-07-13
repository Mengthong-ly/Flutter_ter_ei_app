import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/ui/Components/Auth_Register.dart';
import 'package:todoapp/ui/Components/Auth_sign_in.dart';
import 'package:todoapp/ui/Components/Login_page.dart';
import 'package:todoapp/ui/Components/home_page.dart';
import 'package:todoapp/ui/Components/loginButton.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String? errorMessage = '';
  bool islogin = true;

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
  final confirmpasswordcontroller = TextEditingController();
  // Future<void> signInWithEmailAndPassword() async {
  //   try {
  //     await Auth().signIn(
  //         email: emailcontroller.text, password: passwordcontroller.text);
  //     print(emailcontroller.text);
  //     print(passwordcontroller.text);
  //   } on FirebaseAuthException catch (e) {
  //     setState(() {
  //       errorMessage = e.message;
  //     });
  //   }
  // }

  void createAccount() async {
    String res = await AuthRegister().createUserWithEmailAndPassword(
        confirmPassword: confirmpasswordcontroller.text,
        email: emailcontroller.text,
        password: passwordcontroller.text);
    print(emailcontroller.text);
    print(passwordcontroller.text);
    print(confirmpasswordcontroller.text);
    if (res == "success") {
      setState(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      });
    } else {
      setState(() {
        errorMessage = "Email already exists";
      });
    }
  }

  // void signUp() async {
  //   String res = await AuthRegister().createUserWithEmailAndPassword(
  //       email: emailcontroller.text,
  //       password: passwordcontroller.text,
  //       confirmPassword: confirmpasswordcontroller.text);
  // }

  // void signIn() async {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 95,
              ),
              // Appbar
              // Image
              // sign up
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Text(
                  "Sign Up",
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
              SizedBox(
                height: 20,
              ),

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
                        controller: confirmpasswordcontroller,
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
                            "Confirm Password",
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
              MyloginBtn(signIn: createAccount),

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
                      debugPrint("hi");
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
                  GestureDetector(
                    onTap: () {
                      debugPrint("hi");
                    },
                    child: Container(
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
                  ),
                ],
              ),

              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an Account? ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
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
                                  return LoginPage();
                                }
                              },
                            ),
                          ));
                    },
                    child: Text(
                      "Log In ",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
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
