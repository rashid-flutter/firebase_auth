import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireStoreService {
  static final auth = FirebaseAuth.instance;
  static final googleSignIn = GoogleSignIn();
  static Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return null;
    }
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final UserCredential userCredential =
        await auth.signInWithCredential(credential);
    return userCredential.user;
  }

  static Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
    await googleSignIn.signOut();
  }

  //forget password
  static Future<void> sendPasswordResetEmail(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print("Error sending password reset email: $e");
    }
  }

  static Future<User?> signinWithEmailpass(String email, String pass) async {
    try {
      final UserCredential userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: pass);
      return userCredential.user;
    } catch (e) {
      print("Error signing up: $e");
      return null;
    }
  }

  static Future<User?> signupWithEP(String email, String pass, String firstName,
      String lastName, String phone) async {
    try {
      final UserCredential userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: pass);

      User? user = userCredential.user;
      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'firstName': firstName,
          'lastName': lastName,
          'phoneNumber': phone,
          'email': email,
        });
        return user;
      }
    } catch (e) {
      print("Error signing up: $e");
      return null;
    }
  }
}
