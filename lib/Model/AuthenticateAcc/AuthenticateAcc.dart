import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../Controller/Login&signincontroller/SigninController.dart';

class AuthenticateSignin extends GetxController {
  late String messageErrorSignin;

  registerUser(String email, String password) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        return 'Success';
      } else {
        return 'Error: User is null';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("error", "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("error", "The account already exists for that email.");
      }

      return 'Error: ${e.code}';
    } catch (e) {
      Get.snackbar("error", e.toString());
      return 'Error: ${e.toString()}';
    }
  }
}

class Auth {
  final FirebaseAuth auth;

  Auth({required this.auth});

  Stream<User?> get user => auth.authStateChanges();

  Future<String?> createAccount(
      {required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> signOut() async {
    try {
      await auth.signOut();
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      rethrow;
    }
  }
}
