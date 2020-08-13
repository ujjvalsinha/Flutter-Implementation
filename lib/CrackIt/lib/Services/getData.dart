import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GetData {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var  userName ,userProfileUrl;

  Future<FirebaseUser> handleSignIn() async {
    try {
      print("inside _handleSignIn try method");
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final FirebaseUser user =
          (await _auth.signInWithCredential(credential)).user;
      print("signed in " + user.displayName);

      userName = user.displayName;
      userProfileUrl = user.displayName;

      return user;
    } catch (e) {
      print("Error at _handleSignIn  method");
      print(e.toString());
    }
  }
}
