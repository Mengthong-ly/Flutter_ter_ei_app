import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRegister {
  final FirebaseFirestore _filestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Future<String> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    String message = "error";
    try {
      if (password != confirmPassword) {
        message = "Passwords do not match";
      } else {
        UserCredential credential = await _firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);
        await _filestore.collection("users").doc(credential.user!.uid).set(
          {
            "email": email,
            // It's not recommended to store passwords directly in the database.
            // Consider storing a hash of the password instead.
          },
        );
        message = "success";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else if (e.code == 'invalid-email') {
        message = 'The email address is not valid.';
      } else {
        message = e.message!;
      }
    } catch (e) {
      message = 'An unknown error occurred: ${e.toString()}';
    }
    return message;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
