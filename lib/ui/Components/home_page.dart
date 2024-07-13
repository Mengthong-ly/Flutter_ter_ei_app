import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoapp/Firebase/database.dart';
import 'package:todoapp/ui/Components/Auth_sign_in.dart';
import 'package:todoapp/ui/Components/Mybutton.dart';
import 'package:todoapp/ui/Components/dialog.dart';
import 'package:todoapp/ui/Components/edit.dart';
import 'package:todoapp/ui/Components/profile.dart';
import 'package:todoapp/ui/Components/setting_page.dart';
import 'package:todoapp/ui/Components/verticle_box.dart';

List<List<dynamic>> list = [
  ["Make Pizza", false, date],
  ["Do Laudry", false, date],
  ["Do Homework", false, date],
  ["Go to School", true, date],
  ["Make Friend", true, date],
  ["Talk to Crush", false, date],
  ["Eat Spaheti", false, date],
  ["Eat hamburger", false, date],
  ["Eat hamburger", true, date],
  ["Eat Donut", false, date],
  ["Buy A car", false, date],
  ["Make a fry chicken", false, date],
  ["Talk to someone", false, date],
];
void sortList() {
  list.sort((a, b) {
    // First compare the names
    int nameComparison = a[0].compareTo(b[0]);
    if (nameComparison != 0) {
      return nameComparison;
    }

    // If names are the same, compare the status
    if (a[1] && !b[1]) return -1;
    if (!a[1] && b[1]) return 1;

    return 0; // If both names and status are equal
  });
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
// import 'package:todoapp/ui/Components/box_detial.dart';
// import 'package:todoapp/ui/Components/welcome_page.dart';
DateTime date = DateTime.now();

void editDate() {}
void editTime() {}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Database database = Database();
  @override
  void initState() {
    date = date;
    sortList();
    super.initState();
  }

  // database
  // final Database _data = Database();

  TextEditingController controller = TextEditingController();
  int myindex = 0;

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  void onUpdate(int index) {
    setState(
      () {
        print(list[index]);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Editpage(
              penddingtext: list[index][0],
              // date: list[index][2],
              status: list[index][1],
              date: list[index][2],
              onSave: () {
                setState(() {
                  controller.text == ""
                      ? null
                      : list[index][0] = controller.text;
                  list[index][2] = date;
                  controller.clear();
                  Navigator.pop(context);
                });
              },
              controller: controller,
              onCancel: () {
                onCancel();
              },
            ),
          ),
        );
      },
    );
  }

  void onCancel() {
    setState(() {
      controller.clear();
      Navigator.of(context).pop();
    });
  }

  void onSave() {
    if (controller.text == '') {
      return;
    }

    setState(() {
      list.add([controller.text, false, date]);
      controller.clear();
      // Optionally reset date to current time after adding task
      date = DateTime.now();
      Navigator.of(context).pop();
    });
  }

  Function(BuildContext?)? delete(int index) {
    setState(() {
      list.removeAt(index);
    });
    return null;
  }

  void onChange(bool? value, int index) {
    setState(() {
      list[index][1] = !list[index][1];
    });
  }

  void onclickAdd() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: controller,
            onCancel: onCancel,
            onChange: onSave,
          );
        });
  }

  void taskStatus(int index) {
    setState(() {
      list[index][1] = !list[index][1];
    });
  }

  // void pickDate(BuildContext context) {
  //   BottomPicker.date(
  //     pickerTitle: Text("Pick your Schedule: "),
  //     dateOrder: DatePickerDateOrder.dmy,
  //     initialDateTime: DateTime.now(),
  //     onChange: (value) {
  //       setState(() {
  //         date = DateTime(
  //           value.year,
  //           value.month,
  //           value.day,
  //           date.hour,
  //           date.minute,
  //         );
  //       });
  //       print(date); // Printing the updated date for debugging purposes
  //     },
  //     onSubmit: (value) {
  //       setState(() {
  //         date = DateTime(
  //           value.year,
  //           value.month,
  //           value.day,
  //           date.hour,
  //           date.minute,
  //         );
  //       });
  //       print(date); // Printing the updated date for debugging purposes
  //     },
  //     bottomPickerTheme: BottomPickerTheme.plumPlate,
  //   ).show(context);
  // }
  // void pickDate(BuildContext context) {
  //   BottomPicker.date(
  //     pickerTitle: Text("Pick your Schedule: "),
  //     dateOrder: DatePickerDateOrder.dmy,
  //     initialDateTime: DateTime.now(),
  //     onChange: (value) {
  //       setState(() {
  //         date = DateTime(
  //           value.year,
  //           value.month,
  //           value.day,
  //           date.hour,
  //           date.minute,
  //         );
  //       });
  //       print(date); // Printing the updated date for debugging purposes
  //     },
  //     onSubmit: (value) {
  //       setState(() {
  //         date = DateTime(
  //           value.year,
  //           value.month,
  //           value.day,
  //           date.hour,
  //           date.minute,
  //         );
  //       });
  //       print(date); // Printing the updated date for debugging purposes
  //     },
  //   ).show(context);
  // }

  // void pickTime(BuildContext context) {
  //   BottomPicker.time(
  //     pickerTitle: Text("Pick your Time: "),
  //     initialTime: Time(hours: date.hour, minutes: date.minute),
  //     // initialTime: TimeOfDay(hour: date.hour, minute: date.minute),
  //     onSubmit: (value) {
  //       setState(() {
  //         date = DateTime(
  //           date.year,
  //           date.month,
  //           date.day,
  //           value.hour,
  //           value.minute,
  //         );
  //       });
  //       print(date); // Printing the updated time for debugging purposes
  //     },
  //     bottomPickerTheme: BottomPickerTheme.plumPlate,
  //   ).show(context);
  // }

  void pickDate(BuildContext context) {
    BottomPicker.date(
      pickerTitle: Text("Pick your Schedule: "),
      dateOrder: DatePickerDateOrder.dmy,
      initialDateTime: date,
      onChange: (value) {
        setState(() {
          date = DateTime(
            value.year,
            value.month,
            value.day,
            date.hour,
            date.minute,
          );
        });
      },
      onSubmit: (value) {
        setState(() {
          date = DateTime(
            value.year,
            value.month,
            value.day,
            date.hour,
            date.minute,
          );
        });
      },
    ).show(context);
  }

  void pickTime(BuildContext context) {
    BottomPicker.time(
      pickerTitle: Text("Pick your Time: "),
      initialTime: Time(hours: date.hour, minutes: date.minute),
      onSubmit: (value) {
        setState(() {
          date = DateTime(
            date.year,
            date.month,
            date.day,
            value.hour,
            value.minute,
          );
        });
      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      // drawer sidebar
      drawer: Drawer(
        shadowColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 330,
                child: DrawerHeader(
                  child: Text(
                    "To\nDoList",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w900,
                      fontSize: 65,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                ),
                iconColor: Color(0xFF516FB6),
                title: const Text(
                  "Home",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                iconColor: Color(0xFF516FB6),
                title: const Text(
                  "Settings",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingPage(),
                      ));
                },
              ),
              ListTile(
                iconColor: Color(0xFF516FB6),
                leading: const Icon(Icons.person),
                title: const Text(
                  "Profile",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => ProfilePage(),
                      ));
                },
              ),

              // draw bottom section
              Container(
                width: double.infinity,
                height: 360,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    if (Auth().currentUser == '')
                      ListTile(
                          title: const Text("Login"),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          splashColor: const Color.fromARGB(117, 81, 111, 182),
                          leading: const Icon(Icons.login),
                          onTap: () {}),
                    ListTile(
                        title: const Text("Logout"),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        splashColor: const Color.fromARGB(117, 81, 111, 182),
                        leading: const Icon(Icons.login),
                        onTap: () {
                          Auth().signOut();
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(185),
        // child: CustomAppBar(),
        child: Stack(children: [
          // AppBar(
          //   backgroundColor: Colors.white,
          //   title: Text("ToDoList"),
          // ),
          const CustomAppBar(),
          Positioned(
            top: 110,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 130,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.contain,
                  image: AssetImage('assets/Welcome.png'),
                ),
              ),
            ),
          ),
        ]),
      ),

      ///|||||||||||||
      ///|||||||||||||
      ///|||||||||||||
      ///|||||||||||||
      ///|||||||||||||
      ///|||||||||||||
      ///|||||||||||||
      ///|||||||||||||
      ///|||||||||||||
      ///|||||||||||||
      ///|||||||||||||
      // Home Page Body

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.only(left: 20, top: 10),
              child: Text("Our Features")),
          const Expanded(
            flex: 1,
            child: VerticalBox(),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 20),
            child: Text("Yours Tasks"),
          ),
          Expanded(
            flex: 8,
            child: listView(),
            // child: _messageListView(),
          ),
        ],
      ),

      floatingActionButton:
          Container(margin: EdgeInsets.only(bottom: 10), child: actionButton()),
    );
  }

// cross button
  FloatingActionButton actionButton() {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      onPressed: () {
        setState(() {
          customsheet();
        });
      },
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: Icon(
        Icons.add,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Future<dynamic> customsheet() {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            // color: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            height: 700,
            child: Center(
              child: Form(
                // key: _keyform,
                child: Column(
                  children: [
                    TextFormField(
                      cursorColor: Color.fromARGB(255, 205, 126, 126),
                      autofocus: true,
                      validator: (value) => value == null || value.isEmpty
                          ? "Name Should be written"
                          : null,
                      controller: controller,
                      style: const TextStyle(),
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          borderSide: BorderSide(
                            width: 0.2,
                            color: Color.fromARGB(255, 105, 104, 104),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          borderSide: BorderSide(
                            width: 0.2,
                            color: Color.fromARGB(255, 208, 207, 207),
                          ),
                        ),
                        hintText: "Enter your new task",
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Color.fromARGB(21, 0, 0, 0),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              pickDate(context);
                            },
                            child: Container(
                              width: double.infinity,
                              height: 52,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: Color.fromARGB(29, 158, 158, 158),
                              ),
                              child: Center(
                                  child: Text(date.toString().split(' ')[0])),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              pickTime(context);
                            },
                            child: Container(
                              width: double.infinity,
                              height: 52,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: Color.fromARGB(29, 158, 158, 158),
                              ),
                              child: Center(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(date
                                          .toString()
                                          .split(' ')[1]
                                          .split('.')[0] +
                                      ' '),
                                  Text(date.hour > 12
                                      ? DayPeriod.pm.toString().split('.')[1]
                                      : DayPeriod.am.toString().split('.')[1]),
                                ],
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 200,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Mybutton(
                            buttonname: "Add",
                            onPressed: () {
                              onSave();
                            }),
                        Mybutton(
                            buttonname: "Cancel",
                            onPressed: () {
                              onCancel();
                            })
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

// task + checkbox + linethrough

  Widget listView() {
    if (list.isNotEmpty) {
      return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Slidable(
              closeOnScroll: true,
              endActionPane: ActionPane(
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    backgroundColor: const Color(0xFFe3242b),
                    onPressed: (context) {
                      delete(index);
                    },
                    icon: Icons.delete,
                    autoClose: true,
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    boxShadow: [
                      BoxShadow(
                          // color: Color.fromARGB(73, 0, 0, 0),
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.dark
                              ? Colors.white
                              : Color.fromARGB(40, 0, 0, 0),
                          blurRadius: 6,
                          spreadRadius: 1),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                // color: Colors.white,
                child: ListTile(
                  title: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Checkbox(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            checkColor:
                                const Color.fromARGB(255, 252, 252, 252),
                            fillColor: const WidgetStatePropertyAll(
                              Color(0xFF516FB6),
                            ),
                            value: list[index][1],
                            onChanged: (value) {
                              taskStatus(index);
                            },
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            splashRadius: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                list[index][0],
                                style: TextStyle(
                                    // color: Theme.of(context).colorScheme.secondary,
                                    fontWeight: FontWeight.w600,
                                    decorationColor: Colors.red,
                                    decorationThickness: 1.5,
                                    decoration: list[index][1]
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none),
                              ),
                              // display date and time
                              Text(
                                list[index][2].toString().split(' ')[0],
                                style: TextStyle(
                                    // color: Theme.of(context).colorScheme.secondary,
                                    decorationColor: Colors.red,
                                    decorationThickness: 1.5,
                                    decoration: list[index][1]
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none),
                              ),
                              Text(
                                list[index][2]
                                        .toString()
                                        .split(' ')[1]
                                        .split('.')[0] +
                                    (date.hour > 12 ? ' PM' : ' AM'),
                                style: TextStyle(
                                    // color: Theme.of(context).colorScheme.secondary,
                                    decorationColor: Colors.red,
                                    decorationThickness: 1.5,
                                    decoration: list[index][1]
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none),
                              ),
                            ],
                          ),
                        ],
                      ),
                      FloatingActionButton(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        elevation: 0,
                        heroTag: 'tag-hero-$index',
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(32),
                          ),
                        ),
                        onPressed: () {
                          onUpdate(index);
                          print(index);
                        },
                        child: Icon(
                          Icons.edit,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    } else {
      return const Center(
        child: Text(
          "create a new task",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black38),
        ),
      );
    }
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {
            print("logout");
            Auth().signOut();
          },
        )
      ],
      iconTheme: IconThemeData(
        // color: MediaQuery.of(context).platformBrightness == Brightness.dark,
        // ? const Color.fromARGB(255, 255, 255, 255)
        color: Theme.of(context).colorScheme.primary,
        // color: Theme.of(context)
        //     .colorScheme
        //     .primary, // Set the drawer icon color to white
      ),
      // backgroundColor: Theme.of(context).colorScheme.secondary,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      scrolledUnderElevation: 0,
      // MediaQuery.of(context).platformBrightness == Brightness.dark
      //     ? Colors.black
      //     : Theme.of(context).colorScheme.secondary,
      title: Text(
        "Todo App",
        style: TextStyle(
          // color: Theme.of(context).colorScheme.primary,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      elevation: 0,
    );
  }
}
