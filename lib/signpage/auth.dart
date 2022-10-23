import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthBase {
  User? get currentUser;
  Future<User> signInWithGoogle();
  Future<void> signOut();
}
class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;
  @override

  Future<User> signInWithGoogle() async{
    final googleSignIn=GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if(googleUser!=null)
    {
      final googleAuth= await googleUser.authentication;
      if(googleAuth.idToken!=null){
        final userCredential= await _firebaseAuth.
        signInWithCredential(GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        ));
        return userCredential.user!;

      }else{
        throw FirebaseAuthException(code: 'Error missing google to token',
            message: "missing google Id token"
        );
      }

    }else{
      throw FirebaseAuthException(code:"Erro by user",
        message: "Sign in aborted by user",
      );
    }

  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  // TODO: implement currentUser
  User? get currentUser => throw UnimplementedError();


}
