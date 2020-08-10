import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_app/ui/widgets/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Auth {
  Auth._();
  static final Auth auth = Auth._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // create google sign in
  GoogleSignIn googleSignIn = GoogleSignIn();
  Future<bool> registerUsingEmailAndPassword(
      String email, String password) async {
    try {
      AuthResult authResult = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (authResult.user != null) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error);
    }
  }

  loginUsingEmailAndPasswordd(String email, String password) async {
  
   AuthResult login = await auth.firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
   login.user;

  }

  Future<bool> loginUsingGmail() async {
    try {
      // create google Account
      GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      // create authentaication object to get the  access token and token id
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      // get credintials
      String accesToken = googleSignInAuthentication.accessToken;
      String tokenId = googleSignInAuthentication.idToken;
      // create credintial object
      AuthCredential authCredential = GoogleAuthProvider.getCredential(
          idToken: tokenId, accessToken: accesToken);
      // create the user using credintials
      AuthResult authResult =
          await firebaseAuth.signInWithCredential(authCredential);
      print(authResult.user.photoUrl);
      print(authResult.user.email);
      print(authResult.user.displayName);
      if (authResult.user == null) {
        return false;
      } else {
        
     //   UserSharedPreferences.userSharedPreferences.prefs.setString('email', authResult.user.email);
        UserSharedPreferences.userSharedPreferences.insertIntoFile(true);

        
        return true;
      }
    } catch (error) {
      print(error);
    }
  }

  signOut() {
    googleSignIn.signOut();
  }
}
