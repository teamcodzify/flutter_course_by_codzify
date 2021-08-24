import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ecommerce_app/models/app_user_model.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // create app user object based on firebase user
  AppUser _convertToAppUser(User _fireBaseUser) {
    return AppUser(
      uid: _fireBaseUser.uid,
      email: _fireBaseUser.email,
      displayName: _fireBaseUser.displayName,
      photoURL: _fireBaseUser.photoURL,
    );
  }

  // listen to user auth changes

  // get current/active app user

  // sign in with email and password

  Future<AppUser?> signInWithEmailAndPassword(
      String userEmail, String userPassword) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: userEmail, password: userPassword);
      User? _firebaseUser = userCredential.user;
      AppUser _appUser = _convertToAppUser(_firebaseUser!);
      return _appUser;
    } catch (e) {
      print("Invalid credentials.");
      return null;
    }
  }

  // register user with email and password

  Future<AppUser> createUserWithEmailAndPassword(
      String userEmail, String userPassword) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: userEmail, password: userPassword);

    User? _firebaseUser = userCredential.user;
    AppUser _appUser = _convertToAppUser(_firebaseUser!);

    return _appUser;
  }

  // sign out
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}

//   // sign in with google

//   // sign in with facebook

//   // sign in with mobile
