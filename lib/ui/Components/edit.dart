import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:todoapp/ui/Components/home_page.dart';

class Editpage extends StatefulWidget {
  final VoidCallback onCancel;
  final VoidCallback onSave;
  DateTime date;
  final String penddingtext;
  final bool status;
  final TextEditingController controller;

  Editpage({
    Key? key,
    required this.status,
    required this.date,
    required this.penddingtext,
    required this.onSave,
    required this.onCancel,
    required this.controller,
  }) : super(key: key);

  @override
  _EditpageState createState() => _EditpageState();
}

class _EditpageState extends State<Editpage> {
  @override
  void initState() {
    date = widget.date; // Initialize date in initState using widget.date
    super.initState();
  }

  void pickDate(BuildContext context) {
    BottomPicker.date(
      initialDateTime: date,
      pickerTitle: Text("Pick your date: "),
      dateOrder: DatePickerDateOrder.dmy,
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
      initialTime: Time(hours: date.hour, minutes: date.minute),
      pickerTitle: Text("Pick your time: "),
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
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    widget.controller.text = widget.penddingtext;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          'Edit',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                autovalidateMode: AutovalidateMode.always,
                child: TextField(
                  cursorColor: Colors.black,
                  autofocus: true,
                  controller: widget.controller,
                  decoration: InputDecoration(
                    labelText: "Task",
                    labelStyle: TextStyle(color: Colors.black),
                    fillColor: Color.fromARGB(29, 158, 158, 158),
                    filled: true,
                    contentPadding: EdgeInsets.all(18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  pickDate(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: Color.fromARGB(29, 158, 158, 158),
                  ),
                  child: Center(child: Text(date.toString().split(' ')[0])),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: () {
                  pickTime(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: Color.fromARGB(29, 158, 158, 158),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(date.toString().split(' ')[1].split('.')[0] + ' '),
                        Text(date.hour > 12 ? 'PM' : 'AM'),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: MaterialButton(
                      splashColor: Theme.of(context).colorScheme.secondary,
                      onPressed: () {
                        widget.onSave();
                        widget.controller.clear();
                      },
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      color: Theme.of(context).colorScheme.secondary,
                      child: Text(
                        "Save",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: MaterialButton(
                      splashColor: Theme.of(context).colorScheme.secondary,
                      padding: EdgeInsets.all(2),
                      onPressed: () {
                        widget.onCancel();
                        widget.controller.clear();
                      },
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      color: Theme.of(context).colorScheme.secondary,
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
