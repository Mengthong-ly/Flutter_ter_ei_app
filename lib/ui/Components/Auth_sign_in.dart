import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // User? get currentUser => FirebaseAuth.currentUser;
  User? get currentUser => _firebaseAuth.currentUser;

  // User? get currentUser => FirebaseAuth.instance.currentUser;
  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Future<void> createUserWithEmailAndPassword({
  //   required String email,
  //   required String password,
  //   required String confirmedpassword,
  // }) async {
  //   if (password != confirmedpassword) {
  //     _firestore.c(
  //       email: email,
  //       password: password,
  //     );
  //   }
  // }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

// class Auth {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   User? get currentUser => _firebaseAuth.currentUser;

//   Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

//   Future<void> signIn({
//     required String email,
//     required String password,
//   }) async {
//     await _firebaseAuth.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//   }
// }
