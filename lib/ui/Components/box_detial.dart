import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class BoxDetial extends StatelessWidget {
  final String taskname;
  final DateTime date;
  final bool isChecked;
  Function(bool?)? onChanged;
  BoxDetial({
    super.key,
    this.onChanged,
    required this.date,
    required this.taskname,
    required this.isChecked,
    required this.deleteFunction,
  });

  Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, right: 20, left: 20),
      child: Slidable(
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            backgroundColor: const Color(0xffDD5746),
            onPressed: deleteFunction,
            icon: Icons.delete,
            autoClose: true,
            flex: 2,
          )
        ]),
        child: Container(
          //padding inside
          padding: const EdgeInsets.all(20),
          //decoration
          decoration: const BoxDecoration(
            boxShadow: [
              // putting the shadow to the box
              BoxShadow(
                color: Color.fromARGB(28, 0, 0, 0),
                blurRadius: 10,
                spreadRadius: 3,
                offset: Offset(0, 1),
              )
            ],
            // Color
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          //Title of the list
          child: Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: onChanged,
              ),
              Text(
                taskname,
                style: TextStyle(
                    decoration: isChecked
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: const Color.fromARGB(255, 255, 0, 0),
                    fontSize: 15,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w500),
              ),
              Text(
                date.toString(),
                style: TextStyle(
                    fontSize: 12, color: const Color.fromARGB(34, 0, 0, 0)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
