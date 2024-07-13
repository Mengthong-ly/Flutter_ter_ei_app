import 'package:flutter/material.dart';

class VerticalBox extends StatefulWidget {
  const VerticalBox({super.key});

  @override
  State<VerticalBox> createState() => _VerticalBoxState();
}

class _VerticalBoxState extends State<VerticalBox> {
  final List<String> tasks = [
    "Health",
    "Cooking",
    "Eating",
    "Fitness",
    "Learning",
    "Schooling",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // showBottomSheet(
            //     context: context,
            //     builder: (BuildContext context) {
            //       return Container(
            //         height: 700,
            //         decoration: BoxDecoration(
            //             color: Theme.of(context).colorScheme.primary),
            //         child: Column(
            //           children: [Icon(Icons.door_back_door)],
            //         ),
            //       );
            //     });
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: 700,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 12,
                            spreadRadius: 12,
                            color: Colors.black12)
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.arrow_downward), // Adjust size as needed
                        SizedBox(height: 20), // Spacer
                        SizedBox(
                          height: 10,
                        ),

                        Text("About"),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          tasks[index],
                          style: TextStyle(
                             fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            children: [Text("recommended Tasks")],
                          ),
                        )

                        // Add more widgets as needed
                      ],
                    ),
                  );
                });

            // showModalBottomSheet(
            //     context: context,
            //     builder: (BuildContext context) {
            //       return Container(
            //           // color: Theme.of(context).colorScheme.primary,
            //           padding:
            //               const EdgeInsets.only(top: 30, left: 30, right: 30),
            //           decoration: BoxDecoration(
            //             color: Theme.of(context).colorScheme.primary,
            //           ),
            //           height: 700,
            //           child: Center());
            //     });
          },
          child: Container(
            margin: EdgeInsets.only(top: 14, bottom: 14, left: 22),
            // margin: EdgeInsets.symmetric(horizontal: 8),
            width: MediaQuery.of(context).size.width / 2.7,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 10,
                  spreadRadius: 3,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  tasks[index],
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
