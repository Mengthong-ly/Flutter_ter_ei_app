import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/Firebase/Tasks.dart';

const String TODO_COLLECTION_REF = "ToDoLists";

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference _todoRef;

  Database() {
    _todoRef = _firestore.collection(TODO_COLLECTION_REF).withConverter<Tasks>(
        fromFirestore: (snapshots, _) => Tasks.fromJson(
              snapshots.data()!,
            ),
        toFirestore: (todo, _) => todo.toJson());
  }

  Stream<QuerySnapshot> getTask() {
    return _todoRef.snapshots();
  }

  void addTodo(Tasks todo) async {
    _todoRef.snapshots();
  }
}
