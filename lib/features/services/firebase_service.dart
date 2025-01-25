import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final auth =  FirebaseAuth.instance;

Future<({bool? register, String? error})> registerUser({
  required String firstName,
  required String lastName,
  required String email,
  required String password
})async{
  try {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
    await auth.currentUser?.reload();
  return (register: true, error: null);
  } on FirebaseAuthException catch(e){
    return (register: null, error: e.message);
  }
  catch (e) {
    return (register: null, error: e.toString());
  }
   
}

Future <({bool? login, String? error})> loginUser({
  required String email,
  required String password
})async{
  try {
    await auth.signInWithEmailAndPassword(email: email, password: password);
    return (login: true, error: null );
  } on FirebaseAuthException catch(e){
    return (login: null, error: e.message );
  }
  catch (e) {
    return (login: null, error: e.toString() );
  }
}

  }