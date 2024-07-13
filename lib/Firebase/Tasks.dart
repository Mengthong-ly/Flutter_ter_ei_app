import 'package:cloud_firestore/cloud_firestore.dart';

class Tasks {
  String task;
  Timestamp date;
  bool isDone;

  Tasks({required this.task, required this.date, required this.isDone});

  Tasks.fromJson(Map<String, Object?> json)
      : this(
            task: json['task']! as String,
            isDone: json['isDone']! as bool,
            date: json['date']! as Timestamp);

  Tasks copyWith({
    String? task,
    bool? isDone,
    Timestamp? date,
  }) {
    return Tasks(
        task: task ?? this.task,
        isDone: isDone ?? this.isDone,
        date: date ?? this.date);
  }
  //  Map

  Map<String, Object?> toJson() => {
        'task': task,
        'isDone': isDone,
        'date': date,
      };
}
