import 'package:flutter/material.dart';
import 'package:todoapp/ui/Components/Mybutton.dart';

class DialogBox extends StatelessWidget {
  final controller;

  VoidCallback onCancel;
  VoidCallback onChange;

  DialogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: SizedBox(
          width: 120,
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: controller,
                  autofocus: true,
                  decoration: const InputDecoration(
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 158, 156, 156)),
                      hintText: "make your list",
                      border: OutlineInputBorder(
                        gapPadding: 0,
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      fillColor: Color.fromARGB(31, 0, 0, 0),
                      filled: true),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Mybutton(
                      onPressed: onChange,
                      buttonname: 'Create',
                    ),
                    Mybutton(
                      onPressed: onCancel,
                      buttonname: 'Cancel',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
